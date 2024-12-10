#!/usr/bin/env python
from interbotix_xs_modules.arm import InterbotixManipulatorXS

from datetime import datetime
import math
import random
from typing import Tuple

import numpy as np
import time
import rospy
from gymnasium import spaces, utils, Env
from stable_baselines3 import SAC
from stable_baselines3.common.callbacks import CheckpointCallback
import actionlib
import tf2_ros
import tf
from tf2_geometry_msgs import PoseStamped
from tf.transformations import quaternion_inverse, quaternion_multiply
from urdf_parser_py.urdf import URDF
from geometry_msgs.msg import (
    Pose,
    Quaternion,
    Vector3,
    TransformStamped,
    Transform,
    Point,
)
from sensor_msgs.msg import JointState
from control_msgs.msg import JointControllerState
from std_msgs.msg import Float32, Float64, Float64MultiArray, Header, ColorRGBA
from rospy.exceptions import ROSException, ROSInterruptException
from gazebo_msgs.srv import (
    SetPhysicsProperties,
    SpawnModel,
    SetModelState,
    DeleteModel,
    GetModelState,
    GetLinkState,
)
from tf.transformations import quaternion_from_euler
from std_srvs.srv import Empty
from gazebo_msgs.msg import ModelState
from geometry_msgs.msg import Pose, Twist

# Misc
TENSORBOARD_LOG_DIR = "./src/object_picker/logs/"
CHECKPOINT_DIR = "./src/object_picker/checkpoints/"

# Valid position ranges
WAIST_LIM = (-3.141583, 3.141583)
SHOULDER_LIM = (-1.937315, 1.867502)
ELBOW_LIM = (-2.111848, 1.605703)
WRIST_ANGLE_LIM = (0, 2.146755) # Hard limit to 0, was -1.745329
RIGHT_FINGER_LIM = (-0.036, -0.017)
LEFT_FINGER_LIM = (0.017, 0.036)

# Max position change per step
MAX_WAIST_DELTA = (WAIST_LIM[1] - WAIST_LIM[0]) / 50
MAX_SHOULDER_DELTA = (SHOULDER_LIM[1] - SHOULDER_LIM[0]) / 25
MAX_ELBOW_DELTA = (ELBOW_LIM[1] - ELBOW_LIM[0]) / 25
MAX_WRIST_ANGLE_DELTA = (WRIST_ANGLE_LIM[1] - WRIST_ANGLE_LIM[0]) / 25
MAX_RIGHT_FINGER_DELTA = (RIGHT_FINGER_LIM[1] - RIGHT_FINGER_LIM[0]) / 4  # was 15
MAX_LEFT_FINGER_DELTA = (LEFT_FINGER_LIM[1] - LEFT_FINGER_LIM[0]) / 4  # was 15

# Observation space bounds
OBS_SPACE_LOW = [
    WAIST_LIM[0],
    SHOULDER_LIM[0],
    ELBOW_LIM[0],
    WRIST_ANGLE_LIM[0],
    RIGHT_FINGER_LIM[0],
    LEFT_FINGER_LIM[0],
]
OBS_SPACE_HIGH = [
    WAIST_LIM[1],
    SHOULDER_LIM[1],
    ELBOW_LIM[1],
    WRIST_ANGLE_LIM[1],
    RIGHT_FINGER_LIM[1],
    LEFT_FINGER_LIM[1],
]

# Action space bounds
ACTION_SPACE_LOW = [
    -MAX_WAIST_DELTA,
    -MAX_SHOULDER_DELTA,
    -MAX_ELBOW_DELTA,
    -MAX_WRIST_ANGLE_DELTA,
    -MAX_RIGHT_FINGER_DELTA,
    -MAX_LEFT_FINGER_DELTA,
]
ACTION_SPACE_HIGH = [
    MAX_WAIST_DELTA,
    MAX_SHOULDER_DELTA,
    MAX_ELBOW_DELTA,
    MAX_WRIST_ANGLE_DELTA,
    MAX_RIGHT_FINGER_DELTA,
    MAX_LEFT_FINGER_DELTA,
]

GRIPPER_PROP_LINK_NAME = "px100/gripper_prop_link"
RIGHT_FINGER_LINK_NAME = "px100/right_finger_link"
LEFT_FINGER_LINK_NAME = "px100/left_finger_link"

PICKABLE_OBJ_MODEL_NAME = "t_object"
PICKABLE_OBJ_SDF = f"""
<?xml version="1.0" ?>
<sdf version='1.6'>
  <model name='{PICKABLE_OBJ_MODEL_NAME}'>
    <link name="link">
      <inertial>
        <mass>0.04</mass>
        <pose>0 0 -0.012 0 0 0</pose>
        <inertia>
          <ixx>0.0005</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.0005</iyy>
          <iyz>0</iyz>
          <izz>0.0001</izz>
        </inertia>
      </inertial>
      <collision name="collision_vertical">
        <pose>0 0 -0.02 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.04</size>
          </box>
        </geometry>
      </collision>
      <collision name="collision_horizontal">
        <pose>0 0 0.005 0 0 0</pose>
        <geometry>
          <box>
            <size>0.04 0.01 0.01</size>
          </box>
        </geometry>
      </collision>
      <visual name="visual_vertical">
        <pose>0 0 -0.02 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.04</size>
          </box>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Wood</name>
          </script>
        </material>
      </visual>
      <visual name="visual_horizontal">
        <pose>0 0 0.005 0 0 0</pose>
        <geometry>
          <box>
            <size>0.04 0.01 0.01</size>
          </box>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Wood</name>
          </script>
        </material>
      </visual>
    </link>
  </model>
</sdf>
"""


def unpause_gazebo():
    rospy.wait_for_service("/gazebo/unpause_physics")
    unpause_gazebo = rospy.ServiceProxy("/gazebo/unpause_physics", Empty)
    unpause_gazebo()


def pause_gazebo():
    rospy.wait_for_service("/gazebo/pause_physics")
    pause_gazebo = rospy.ServiceProxy("/gazebo/pause_physics", Empty)
    pause_gazebo()


def clip_value(value, limits):
    """
    Clips the input value to the specified limits.
    :param value: The input value to clip.
    :param limits: A tuple (min, max) representing the joint limits.
    :return: The clipped value.
    """
    min_limit, max_limit = limits
    return max(min(value, max_limit), min_limit)


def get_gazebo_model_pose(model_name: str) -> tuple:
    """Retrieve the current position (x, y, z) of a model in the simulation."""
    rospy.wait_for_service("/gazebo/get_model_state")
    try:
        get_model_state_service = rospy.ServiceProxy(
            "/gazebo/get_model_state", GetModelState
        )
        model_state = get_model_state_service(model_name, "")
        current_position = (
            model_state.pose.position.x,
            model_state.pose.position.y,
            model_state.pose.position.z,
        )
        return current_position
    except rospy.ServiceException as e:
        rospy.logerr(f"Failed to get current pose of model: {e}")
        return None


def get_link_position(link_name: str, tf_listener):
    try:
        tf_listener.waitForTransform(
            "world", link_name, rospy.Time(0), rospy.Duration(1.0)
        )
        (trans, rot) = tf_listener.lookupTransform("world", link_name, rospy.Time(0))
        return np.array(trans)
    except (
        tf.Exception,
        tf.LookupException,
        tf.ConnectivityException,
        tf.ExtrapolationException,
    ) as e:
        rospy.logerr(f"Failed to get transform for {link_name}: {e}")
        return None


class PickableGazeboObjectClient:
    def __init__(self, model_name: str, model_sdf: str):
        self.model_name = model_name
        self.model_sdf = model_sdf

    def spawn(
        self, position: tuple, roll: float = 0.0, pitch: float = 0.0, yaw: float = 0.0
    ):
        """Spawn the model at the given position."""
        rospy.wait_for_service("/gazebo/spawn_sdf_model")
        try:
            spawn_model_service = rospy.ServiceProxy(
                "/gazebo/spawn_sdf_model", SpawnModel
            )
            pose = Pose()
            pose.position.x = position[0]
            pose.position.y = position[1]
            pose.position.z = position[2]
            quaternion = quaternion_from_euler(roll, pitch, yaw)
            pose.orientation.x = quaternion[0]
            pose.orientation.y = quaternion[1]
            pose.orientation.z = quaternion[2]
            pose.orientation.w = quaternion[3]
            spawn_model_service(self.model_name, self.model_sdf, "", pose, "world")
            rospy.loginfo(f"Model '{self.model_name}' spawned at position: {position}")
        except rospy.ServiceException as e:
            rospy.logerr(f"Failed to spawn model: {e}")

    def teleport(
        self, new_position, roll: float = 0.0, pitch: float = 0.0, yaw: float = 0.0
    ):
        """Teleport the model to a new position."""
        rospy.wait_for_service("/gazebo/set_model_state")
        try:
            set_model_state_service = rospy.ServiceProxy(
                "/gazebo/set_model_state", SetModelState
            )
            model_state = ModelState()
            model_state.model_name = self.model_name
            model_state.pose = Pose()
            model_state.pose.position.x = new_position[0]
            model_state.pose.position.y = new_position[1]
            model_state.pose.position.z = new_position[2]
            quaternion = quaternion_from_euler(roll, pitch, yaw)
            model_state.pose.orientation.x = quaternion[0]
            model_state.pose.orientation.y = quaternion[1]
            model_state.pose.orientation.z = quaternion[2]
            model_state.pose.orientation.w = quaternion[3]
            model_state.twist = Twist()  # Stop any velocity
            set_model_state_service(model_state)
        except rospy.ServiceException as e:
            rospy.logerr(f"Failed to teleport model: {e}")

    def delete(self):
        """Delete the model from the simulation."""
        rospy.wait_for_service("/gazebo/delete_model")
        try:
            delete_model_service = rospy.ServiceProxy(
                "/gazebo/delete_model", DeleteModel
            )
            delete_model_service(self.model_name)
            rospy.loginfo(f"Model '{self.model_name}' deleted.")
        except rospy.ServiceException as e:
            rospy.logerr(f"Failed to delete model: {e}")

    def get_current_position(self):
        """Retrieve the current position (x, y, z) of the model in the simulation."""
        return get_gazebo_model_pose(self.model_name)


class PX100GazeboClient:
    WAIST_CMD_TOPIC = "/px100/waist_controller/command"
    SHOULDER_CMD_TOPIC = "/px100/shoulder_controller/command"
    ELBOW_CMD_TOPIC = "/px100/elbow_controller/command"
    WRIST_ANGLE_CMD_TOPIC = "/px100/wrist_angle_controller/command"
    RIGHT_FINGER_CMD_TOPIC = "/px100/right_finger_controller/command"
    LEFT_FINGER_CMD_TOPIC = "/px100/left_finger_controller/command"

    WAIST_STATE_TOPIC = "/px100/waist_controller/state"
    SHOULDER_STATE_TOPIC = "/px100/shoulder_controller/state"
    ELBOW_STATE_TOPIC = "/px100/elbow_controller/state"
    WRIST_ANGLE_STATE_TOPIC = "/px100/wrist_angle_controller/state"
    RIGHT_FINGER_STATE_TOPIC = "/px100/right_finger_controller/state"
    LEFT_FINGER_STATE_TOPIC = "/px100/left_finger_controller/state"

    CLOSENESS_TOL = 0.01
    MAX_WAIT_ITERS = 40

    GRIPPER_LIM = 0.2

    def __init__(self, bot):
        self.rate = rospy.Rate(15)

        self.tf_listener = tf.TransformListener()
        self.bot = bot
        self.joint_states_sub = rospy.Subscriber(
            "/px100/joint_states", JointState, self.joint_state_cb
        )
        self.joint_states = (
            None  # NOTE: (WAIST, SHOULDER, EBLOW, WRIST, RIGHT_FINGER, LEFT_FINGER)
        )
        self.finger_state = 1


    # def _await_subscriptions(self):
    #     while any(
    #         [
    #             self.waist_state is None,
    #             self.shoulder_state is None,
    #             self.elbow_state is None,
    #             self.wrist_angle_state is None,
    #             self.right_finger_state is None,
    #             # HACK: Left finger never publishes state
    #             # self.left_finger_state is None,
    #         ]
    #     ):
    #         self.rate.sleep()

    def joint_state_cb(self, msg):
        self.joint_states = msg.position

    def _wait_until_set_points_reached(self):
        # TODO: Add timeout?
        iters_waited = 0
        while (
            not rospy.is_shutdown()
            and iters_waited < self.MAX_WAIT_ITERS
            and not all(
                [
                    self.waist_state is not None
                    and math.isclose(
                        self.waist_state.process_value,
                        self.waist_state.set_point,
                        abs_tol=self.CLOSENESS_TOL,
                    ),
                    self.shoulder_state is not None
                    and math.isclose(
                        self.shoulder_state.process_value,
                        self.shoulder_state.set_point,
                        abs_tol=self.CLOSENESS_TOL,
                    ),
                    self.elbow_state is not None
                    and math.isclose(
                        self.elbow_state.process_value,
                        self.elbow_state.set_point,
                        abs_tol=self.CLOSENESS_TOL,
                    ),
                    self.wrist_angle_state is not None
                    and math.isclose(
                        self.wrist_angle_state.process_value,
                        self.wrist_angle_state.set_point,
                        abs_tol=self.CLOSENESS_TOL,
                    ),
                ]
            )
        ):
            self.rate.sleep()
            iters_waited += 1

    def set_joint_positions(
        self,
        waist=None,
        shoulder=None,
        elbow=None,
        wrist_angle=None,
        gripper=None,
    ):
        """
        Set the joint positions for the PX100 arm.
        :param waist: Position for the waist joint (in radians).
        :param shoulder: Position for the shoulder joint (in radians).
        :param elbow: Position for the elbow joint (in radians).
        :param wrist_angle: Position for the wrist angle joint (in radians).
        :param right_finger: Position for the right finger joint (normalized between 0 and 1).
        :param left_finger: Position for the left finger joint (normalized between 0 and 1).
        """
        self._await_subscriptions()

        self.bot.arm.set_joint_positions([clip_value(waist, WAIST_LIM), clip_value(shoulder, SHOULDER_LIM), clip_value(elbow, ELBOW_LIM), clip_value(wrist_angle, WRIST_ANGLE_LIM)])
        if gripper == 1:
            self.bot.gripper.close()
        else:
            self.bot.gripper.open()

        self.rate.sleep()
        self._wait_until_set_points_reached()


    def get_joint_positions(self) -> np.ndarray:
        """Returns the current (most recent) joint positions as a numpy array.

        NOTE: Order is [waist, should, elbow, wrist_angle, gripper_state]
        """
        self._await_subscriptions()
        self.finger_state = 1 if self.get_finger_position() < self.GRIPPER_LIM else 0
        return np.concatenate(np.array(self.joint_states)[:4], [self.finger_state])


class PX100PickEnv(Env):
    MAX_STEPS_PER_EPISODE = 15
    PICKABLE_OBJ_START_POS = (0.2835, 0.0, 0.041)
    PICKABLE_OBJ_START_YAW = 1.5707963  # Make the "T" shape face the claw
    PICKABLE_OBJ_TARGET_POS = np.array([0.26, 0.0, 0.16])
    OBJ_TARGET_DIST_CLIP = (
        np.linalg.norm(np.array(PICKABLE_OBJ_START_POS) - PICKABLE_OBJ_TARGET_POS) * 1.3
    )
    GRABBER_OBJ_DIST_CLIP = 0.25
    GRABBER_OBJ_DIST_REWARD_EXP_FACTOR = 2.5
    LIFT_CLEARANCE_TOL = 0.005

    def __init__(self, bot):
        super(PX100PickEnv, self).__init__()

        self.action_space = spaces.Dict({
            "arm": spaces.Box(
                low=np.array(ACTION_SPACE_LOW[:4]),
                high=np.array(ACTION_SPACE_HIGH[:4]),
                dtype=np.float32,
            ),
            "gripper": spaces.Discrete(2),  # 0 = open, 1 = closed
        })
        self.observation_space = spaces.Box(
            low=np.concatenate([OBS_SPACE_LOW[:4], [0]]),  # 0 for open
            high=np.concatenate([OBS_SPACE_HIGH[:4], [1]]),  # 1 for closed
            dtype=np.float32,
        )
        self.tf_listener = tf.TransformListener()
        self.px100 = PX100GazeboClient(bot)
        self.pickable_object = PickableGazeboObjectClient(
            model_name=PICKABLE_OBJ_MODEL_NAME,
            model_sdf=PICKABLE_OBJ_SDF,
        )
        self.pickable_object.spawn(
            position=self.PICKABLE_OBJ_START_POS, yaw=self.PICKABLE_OBJ_START_YAW
        )

        # Episode state tracking variables
        self.n_steps_elapsed = 0
        self.n_steps_object_off_ground = 0

        # Reward tracking
        self.reward_history = []

    def get_randomized_object_start_state(self) -> Tuple[Tuple, float]:
        """Return slightly randomized version of the pickable object's start state.

        Returns:
            (x,y,z), yaw
        """
        return self.PICKABLE_OBJ_START_POS, self.PICKABLE_OBJ_START_YAW  # FIXME

    def reset(self, seed=None, options=None):
        """
        Reset the environment to the initial state and return the first observation.

        Args:
            seed (int, optional): Random seed for reproducibility.
            options (dict, optional): Additional options for resetting the environment.

        Returns:
            observation (np.ndarray): The first observation after reset.
            info (dict): Any additional info (can be empty).
        """
        # Move arm to home position
        self.bot.go_to_home_pose()
        # Move object to start location
        start_pos, start_yaw = self.get_randomized_object_start_state()
        self.pickable_object.teleport(new_position=start_pos, yaw=start_yaw)

        # Get the joint positions as the observation
        observation = self.px100.get_joint_positions()
        # Reset episode state tracking variables
        self.n_steps_elapsed = 0

        # self.save_reward_history() #TODO: make this better, only save last reward to file

        # Return the observation and an empty dictionary (for reset info)
        return observation, {}

    def step(self, action):
        """
        Take a step in the environment based on the given action.
        Args:
            action (np.ndarray): The action taken by the agent.
        Returns:
            observation (np.ndarray): The next observation after taking the action.
            reward (float): The reward received for taking the action.
            terminated (bool): Whether the episode has terminated.
            truncated (bool): Whether the episode was truncated (e.g., due to time limit).
            info (dict): Additional information about the step.
        """
        current_joint_positions = self.px100.get_joint_positions()

        arm_actions = action["arm"]
        gripper_action = action["gripper"]

        # Take action
        self.px100.set_joint_positions(
            waist=current_joint_positions[0] + arm_actions[0],
            shoulder=current_joint_positions[1] + arm_actions[1],
            elbow=current_joint_positions[2] + arm_actions[2],
            wrist_angle=current_joint_positions[3] + arm_actions[3],
            gripper=gripper_action[0]
        )

        # Update episode state tracking variables
        self.n_steps_elapsed += 1

        # Make observation of environment
        joint_positions = self.px100.get_joint_positions()
        
        object_position = get_gazebo_model_pose(PICKABLE_OBJ_MODEL_NAME)
        # Object->target distance reward component
        obj_target_dist = np.linalg.norm(
            np.array(object_position) - self.PICKABLE_OBJ_TARGET_POS
        )
        clipped_obj_target_dist = clip_value(
            obj_target_dist, limits=(0, self.OBJ_TARGET_DIST_CLIP)
        )
        obj_target_dist_reward = (  # Normalize to b/w 0 and 1
            self.OBJ_TARGET_DIST_CLIP - clipped_obj_target_dist
        ) / self.OBJ_TARGET_DIST_CLIP

        # Grabber->object distance reward component
        gripper_prop_link_position = get_link_position(
            GRIPPER_PROP_LINK_NAME, self.tf_listener
        )
        right_finger_link_position = get_link_position(
            RIGHT_FINGER_LINK_NAME, self.tf_listener
        )
        left_finger_link_position = get_link_position(
            LEFT_FINGER_LINK_NAME, self.tf_listener
        )
        if any(
            [
                pos is None
                for pos in [
                    gripper_prop_link_position,
                    right_finger_link_position,
                    left_finger_link_position,
                ]
            ]
        ):
            grabber_object_dist_reward = 0
        else:
            grabber_base_dist = np.linalg.norm(
                gripper_prop_link_position - object_position
            )
            left_finger_dist = np.linalg.norm(
                left_finger_link_position - object_position
            )
            right_finger_dist = np.linalg.norm(
                right_finger_link_position - object_position
            )

            grabber_obj_dist = np.mean(
                [
                    grabber_base_dist,
                    grabber_base_dist,  # Weight the base distance more
                    left_finger_dist,
                    right_finger_dist,
                ],
                axis=0,
            )
            clipped_grabber_obj_dist = clip_value(
                grabber_obj_dist, limits=(0, self.GRABBER_OBJ_DIST_CLIP)
            )
            grabber_object_dist_reward = (
                self.GRABBER_OBJ_DIST_CLIP - clipped_grabber_obj_dist
            ) / self.GRABBER_OBJ_DIST_CLIP  # Normalize to b/w 0 and 1
            # Exponentiate to make high rewards more potent and weak rewards less potent
            grabber_object_dist_reward = (
                grabber_object_dist_reward**self.GRABBER_OBJ_DIST_REWARD_EXP_FACTOR
            )

        # Combine reward components
        reward = obj_target_dist_reward + grabber_object_dist_reward

        # Check for episode exit conditions
        done = self.n_steps_elapsed >= self.MAX_STEPS_PER_EPISODE
        truncated = False  # NOTE: False--we don't need to use this gymnasium flag

        self.reward_history.append(reward)

        return joint_positions, reward, done, truncated, {}

    def save_reward_history(self, filename="reward_history.txt"):
        with open(filename, "w") as f:
            for reward in self.reward_history:
                f.write(f"{reward}\n")


# NOTE: Run the following two commands in their own terminals before running this script:
#   1. `roscore`
#   2. `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true`
#       or
#      `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true gui:=false use_rviz:=true`

if __name__ == "__main__":
    # rospy.init_node("px100_training")
    bot = InterbotixManipulatorXS("px100", "arm", "gripper")
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpausing gazebo
    env = PX100PickEnv()
    model = SAC("MlpPolicy", env, verbose=1, tensorboard_log=TENSORBOARD_LOG_DIR)
    # model = SAC.load(
    #     f"{CHECKPOINT_DIR}/px100_checkpoint_3200000_steps",
    #     env=env,
    #     verbose=1,
    #     tensorboard_log=TENSORBOARD_LOG_DIR,
    # )

    checkpoint_callback = CheckpointCallback(
        save_freq=10000,
        save_path=CHECKPOINT_DIR,
        name_prefix="px100_checkpoint",
        save_replay_buffer=True,
        save_vecnormalize=True,
    )

    model.learn(
        log_interval=20, total_timesteps=1_000_000, callback=checkpoint_callback
    )  # , progress_bar=True)
    try:
        model.save("temp.model")
    except:
        pass
    print("success")
