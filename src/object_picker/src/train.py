#!/usr/bin/env python

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
WRIST_ANGLE_LIM = (-1.745329, 2.146755)
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

    def __init__(self):
        self.rate = rospy.Rate(15)

        self.tf_listener = tf.TransformListener()

        self.waist_pub = rospy.Publisher(self.WAIST_CMD_TOPIC, Float64, queue_size=10)
        self.shoulder_pub = rospy.Publisher(
            self.SHOULDER_CMD_TOPIC, Float64, queue_size=10
        )
        self.elbow_pub = rospy.Publisher(self.ELBOW_CMD_TOPIC, Float64, queue_size=10)
        self.wrist_angle_pub = rospy.Publisher(
            self.WRIST_ANGLE_CMD_TOPIC, Float64, queue_size=10
        )
        self.right_finger_pub = rospy.Publisher(
            self.RIGHT_FINGER_CMD_TOPIC, Float64, queue_size=10
        )
        self.left_finger_pub = rospy.Publisher(
            self.LEFT_FINGER_CMD_TOPIC, Float64, queue_size=10
        )

        self.waist_sub = rospy.Subscriber(
            self.WAIST_STATE_TOPIC, JointControllerState, self.waist_state_callback
        )
        self.shoulder_sub = rospy.Subscriber(
            self.SHOULDER_STATE_TOPIC,
            JointControllerState,
            self.shoulder_state_callback,
        )
        self.elbow_sub = rospy.Subscriber(
            self.ELBOW_STATE_TOPIC, JointControllerState, self.elbow_state_callback
        )
        self.wrist_angle_sub = rospy.Subscriber(
            self.WRIST_ANGLE_STATE_TOPIC,
            JointControllerState,
            self.wrist_angle_state_callback,
        )
        self.right_finger_sub = rospy.Subscriber(
            self.RIGHT_FINGER_STATE_TOPIC,
            JointControllerState,
            self.right_finger_state_callback,
        )
        self.left_finger_sub = rospy.Subscriber(
            self.LEFT_FINGER_STATE_TOPIC,
            JointControllerState,
            self.left_finger_state_callback,
        )

        self.waist_state = None
        self.shoulder_state = None
        self.elbow_state = None
        self.wrist_angle_state = None
        self.right_finger_state = None
        self.left_finger_state = None
        # HACK: Left finger never publishes state...
        # ...We use this attr instead
        self.current_approx_left_finger_position = None

    def waist_state_callback(self, msg):
        self.waist_state = msg

    def shoulder_state_callback(self, msg):
        self.shoulder_state = msg

    def elbow_state_callback(self, msg):
        self.elbow_state = msg

    def wrist_angle_state_callback(self, msg):
        self.wrist_angle_state = msg

    def right_finger_state_callback(self, msg):
        self.right_finger_state = msg

    def left_finger_state_callback(self, msg):
        self.left_waist_pos = msg

    def _await_subscriptions(self):
        while any(
            [
                self.waist_state is None,
                self.shoulder_state is None,
                self.elbow_state is None,
                self.wrist_angle_state is None,
                self.right_finger_state is None,
                # HACK: Left finger never publishes state
                # self.left_finger_state is None,
            ]
        ):
            self.rate.sleep()

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
                    self.right_finger_state is not None
                    and math.isclose(
                        self.right_finger_state.process_value,
                        self.right_finger_state.set_point,
                        abs_tol=self.CLOSENESS_TOL,
                    ),
                    # HACK: Left finger never publishes state
                    # self.left_finger_state is not None
                    # and math.isclose(
                    #     self.left_finger_state.process_value,
                    #     self.left_finger_state.set_point,
                    #     abs_tol=MAX_LEFT_FINGER_DELTA
                    #     * self.CLOSENESS_TOL_PROPORTION_OF_MAX_DELTA,
                    # ),
                ]
            )
        ):
            # print("\nJoint Progress:")
            # for joint in [
            #     ("Waist", self.waist_state),
            #     ("Shoulder", self.shoulder_state),
            #     ("Elbow", self.elbow_state),
            #     ("Wrist Angle", self.wrist_angle_state),
            #     ("Right Finger", self.right_finger_state),
            #     ("Left Finger", self.left_finger_state),
            # ]:
            #     joint_name, joint_state = joint

            #     if joint_state is not None:
            #         # Calculate the difference between the set point and current position
            #         difference = abs(joint_state.set_point - joint_state.process_value)
            #         print(
            #             f"{joint_name} - Set Point: {joint_state.set_point:.4f}, "
            #             f"Current Position: {joint_state.process_value:.4f}, "
            #             f"Tol: {self.CLOSENESS_TOL:.4f}, Difference: {difference:.4f}"
            #         )
            #     else:
            #         print(f"{joint_name} - State: None")
            self.rate.sleep()
            iters_waited += 1

    def set_joint_positions(
        self,
        waist=None,
        shoulder=None,
        elbow=None,
        wrist_angle=None,
        right_finger=None,
        left_finger=None,
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
        # rospy.loginfo(
        #     f"Setting joint positions:\n{waist:.4f}, {shoulder:.4f}, {elbow:.4f}, "
        #     f"{wrist_angle:.4f}, {right_finger:.4f}, {left_finger:.4f}"
        # )
        self.rate.sleep()
        if waist is not None:
            waist_position = clip_value(waist, WAIST_LIM)
            self.waist_pub.publish(waist_position)
            self.rate.sleep()
        if shoulder is not None:
            shoulder_position = clip_value(shoulder, SHOULDER_LIM)
            self.shoulder_pub.publish(shoulder_position)
            self.rate.sleep()
        if elbow is not None:
            elbow_position = clip_value(elbow, ELBOW_LIM)
            self.elbow_pub.publish(elbow_position)
            self.rate.sleep()
        if wrist_angle is not None:
            wrist_angle_position = clip_value(wrist_angle, WRIST_ANGLE_LIM)
            self.wrist_angle_pub.publish(wrist_angle_position)
            self.rate.sleep()
        if right_finger is not None:
            right_finger_position = clip_value(right_finger, RIGHT_FINGER_LIM)
            self.right_finger_pub.publish(right_finger_position)
            self.rate.sleep()
        if left_finger is not None:
            left_finger_position = clip_value(left_finger, LEFT_FINGER_LIM)
            self.left_finger_pub.publish(left_finger_position)
            self.rate.sleep()

        # Wait until set points have more or less been reached
        self._wait_until_set_points_reached()
        # HACK: Left finger never publishes state...
        # ...so we manually set this as an approximation of its position
        self.current_approx_left_finger_position = left_finger

    def get_joint_positions(self) -> np.ndarray:
        """Returns the current (most recent) joint positions as a numpy array.

        NOTE: Order is [waist, should, elbow, wrist_angle, right_finger, left_finger]
        """
        self._await_subscriptions()
        positions = [
            self.waist_state.process_value,
            self.shoulder_state.process_value,
            self.elbow_state.process_value,
            self.wrist_angle_state.process_value,
            self.right_finger_state.process_value,
            # HACK: Left finger never publishes state
            # self.left_finger_state.process_value,
            self.current_approx_left_finger_position,
        ]
        return np.array(positions)


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

    def __init__(self):
        super(PX100PickEnv, self).__init__()

        self.action_space = spaces.Box(
            low=np.array(ACTION_SPACE_LOW),
            high=np.array(ACTION_SPACE_HIGH),
            dtype=np.float32,
        )
        self.observation_space = spaces.Box(
            low=np.array(OBS_SPACE_LOW), high=np.array(OBS_SPACE_HIGH), dtype=np.float32
        )
        self.tf_listener = tf.TransformListener()
        self.px100 = PX100GazeboClient()
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
        self.px100.set_joint_positions(
            waist=0.0,
            shoulder=0.0,
            elbow=0.0,
            wrist_angle=0.0,
            right_finger=RIGHT_FINGER_LIM[0],
            left_finger=LEFT_FINGER_LIM[1],
        )
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
        target_joint_positions = current_joint_positions + action

        target_right_finger = target_joint_positions[4]  # Right finger target position
        target_left_finger = -target_right_finger

        # Take action
        self.px100.set_joint_positions(
            waist=target_joint_positions[0],
            shoulder=target_joint_positions[1],
            elbow=target_joint_positions[2],
            wrist_angle=target_joint_positions[3],
            right_finger=target_right_finger,
            left_finger=target_left_finger,
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
    rospy.init_node("px100_training")
    # Uncomment to test PX100 Gazebo Client
    # unpause_gazebo()
    # time.sleep(1)  # Necessary after unpause
    # client = PX100GazeboClient()
    # print(client.get_gripper_prop_link_position())
    # print(client.get_right_finger_link_position())
    # print(client.get_left_finger_link_position())
    # client.set_joint_positions(
    #     waist=random.uniform(*WAIST_LIM),
    #     shoulder=random.uniform(*SHOULDER_LIM) / 2,
    #     elbow=random.uniform(*ELBOW_LIM) / 2,
    #     wrist_angle=random.uniform(*WRIST_ANGLE_LIM) / 2,
    #     right_finger=random.uniform(*RIGHT_FINGER_LIM) / 2,
    #     left_finger=random.uniform(*LEFT_FINGER_LIM) / 2,
    # )

    # Uncomment to test PickableGazeboObjectClient
    # pickable_object = PickableGazeboObjectClient(
    #     model_name=PICKABLE_OBJ_MODEL_NAME, model_sdf=PICKABLE_OBJ_SDF
    # )
    # pickable_object.spawn(position=(1, 1, 1))
    # pickable_object.delete()
    # pickable_object.spawn(
    #     position=(0.25, 0.0, PICKABLE_OBJECT_FRAME_ORIGIN_Z_OFFSET + 0.001)
    # )
    # pickable_object.teleport(
    #     new_position=(0.4, 0.0, PICKABLE_OBJECT_FRAME_ORIGIN_Z_OFFSET + 0.3)
    # )
    # time.sleep(1)

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
