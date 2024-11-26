#!/usr/bin/env python

from datetime import datetime
import math
import random

import numpy as np
import time
import rospy
from gymnasium import spaces, utils, Env
from stable_baselines3 import SAC
import actionlib
import tf2_ros
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
from gazebo_msgs.srv import SetPhysicsProperties
from std_srvs.srv import Empty


# Valid position ranges
WAIST_LIM = (-3.141583, 3.141583)
SHOULDER_LIM = (-1.937315, 1.867502)
ELBOW_LIM = (-2.111848, 1.605703)
WRIST_ANGLE_LIM = (-1.745329, 2.146755)
RIGHT_FINGER_LIM = (-0.036, -0.017)
LEFT_FINGER_LIM = (0.017, 0.036)

# Max position change per step
MAX_WAIST_DELTA = (WAIST_LIM[1] - WAIST_LIM[0]) / 25
MAX_SHOULDER_DELTA = (SHOULDER_LIM[1] - SHOULDER_LIM[0]) / 30
MAX_ELBOW_DELTA = (ELBOW_LIM[1] - ELBOW_LIM[0]) / 15
MAX_WRIST_ANGLE_DELTA = (WRIST_ANGLE_LIM[1] - WRIST_ANGLE_LIM[0]) / 15
MAX_RIGHT_FINGER_DELTA = (RIGHT_FINGER_LIM[1] - RIGHT_FINGER_LIM[0]) / 5
MAX_LEFT_FINGER_DELTA = (LEFT_FINGER_LIM[1] - LEFT_FINGER_LIM[0]) / 5

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

    def __init__(self):
        rospy.init_node("px100_gazebo_client", anonymous=True)
        self.rate = rospy.Rate(15)

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

    def _clip_value(self, value, limits):
        """
        Clips the input value to the specified limits.
        :param value: The input value to clip.
        :param limits: A tuple (min, max) representing the joint limits.
        :return: The clipped value.
        """
        min_limit, max_limit = limits
        return max(min(value, max_limit), min_limit)

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
        while not rospy.is_shutdown() and not all(
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
        ):
            print("\nJoint Progress:")
            for joint in [
                ("Waist", self.waist_state),
                ("Shoulder", self.shoulder_state),
                ("Elbow", self.elbow_state),
                ("Wrist Angle", self.wrist_angle_state),
                ("Right Finger", self.right_finger_state),
                ("Left Finger", self.left_finger_state),
            ]:
                joint_name, joint_state = joint

                if joint_state is not None:
                    # Calculate the difference between the set point and current position
                    difference = abs(joint_state.set_point - joint_state.process_value)
                    print(
                        f"{joint_name} - Set Point: {joint_state.set_point:.4f}, "
                        f"Current Position: {joint_state.process_value:.4f}, "
                        f"Tol: {self.CLOSENESS_TOL:.4f}, Difference: {difference:.4f}"
                    )
                else:
                    print(f"{joint_name} - State: None")
            self.rate.sleep()

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
        rospy.loginfo(
            f"Setting joint positions:\n{waist:.4f}, {shoulder:.4f}, {elbow:.4f}, "
            f"{wrist_angle:.4f}, {right_finger:.4f}, {left_finger:.4f}"
        )
        self.rate.sleep()
        if waist is not None:
            waist_position = self._clip_value(waist, WAIST_LIM)
            self.waist_pub.publish(waist_position)
            self.rate.sleep()
        if shoulder is not None:
            shoulder_position = self._clip_value(shoulder, SHOULDER_LIM)
            self.shoulder_pub.publish(shoulder_position)
            self.rate.sleep()
        if elbow is not None:
            elbow_position = self._clip_value(elbow, ELBOW_LIM)
            self.elbow_pub.publish(elbow_position)
            self.rate.sleep()
        if wrist_angle is not None:
            wrist_angle_position = self._clip_value(wrist_angle, WRIST_ANGLE_LIM)
            self.wrist_angle_pub.publish(wrist_angle_position)
            self.rate.sleep()
        if right_finger is not None:
            right_finger_position = self._clip_value(right_finger, RIGHT_FINGER_LIM)
            self.right_finger_pub.publish(right_finger_position)
            self.rate.sleep()
        if left_finger is not None:
            left_finger_position = self._clip_value(left_finger, LEFT_FINGER_LIM)
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

        self.px100 = PX100GazeboClient()

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
        # TODO: Refer to brl_pxh_api to figure out what home position should be
        self.px100.set_joint_positions(
            waist=0.0,
            shoulder=0.0,
            elbow=0.0,
            wrist_angle=0.0,
            right_finger=RIGHT_FINGER_LIM[0],
            left_finger=LEFT_FINGER_LIM[1],
        )
        # TODO: Move object to start location

        # Get the joint positions as the observation
        observation = self.px100.get_joint_positions()

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
        # Take action
        self.px100.set_joint_positions(
            waist=target_joint_positions[0],
            shoulder=target_joint_positions[1],
            elbow=target_joint_positions[2],
            wrist_angle=target_joint_positions[3],
            right_finger=target_joint_positions[4],
            left_finger=target_joint_positions[5],
        )
        # Make observation of resulting state ("next_state")
        next_state = self.px100.get_joint_positions()

        # TODO: Determine if episode should be flagged as done or truncated
        done = random.choices([False, True], weights=[96, 4], k=1)[0]  # FIXME
        truncated = False  # FIXME

        # TODO: Calculate step reward
        reward = 1.0  # FIXME

        return next_state, reward, done, truncated, {}


def unpause_gazebo():
    rospy.wait_for_service("/gazebo/unpause_physics")
    unpause_gazebo = rospy.ServiceProxy("/gazebo/unpause_physics", Empty)
    unpause_gazebo()


def pause_gazebo():
    rospy.wait_for_service("/gazebo/pause_physics")
    pause_gazebo = rospy.ServiceProxy("/gazebo/pause_physics", Empty)
    pause_gazebo()


# IMPORTANT: Run the following two commands in their own terminals before running this script:
#   1. `roscore`
#   2. `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true`

if __name__ == "__main__":
    # Uncomment to test Gazebo Client
    # unpause_gazebo()
    # time.sleep(1)  # Necessary after unpause
    # client = PX100GazeboClient()
    # client.set_joint_positions(
    #     waist=random.uniform(*WAIST_LIM),
    #     shoulder=random.uniform(*SHOULDER_LIM) / 2,
    #     elbow=random.uniform(*ELBOW_LIM) / 2,
    #     wrist_angle=random.uniform(*WRIST_ANGLE_LIM) / 2,
    #     right_finger=random.uniform(*RIGHT_FINGER_LIM) / 2,
    #     left_finger=random.uniform(*LEFT_FINGER_LIM) / 2,
    # )

    unpause_gazebo()
    time.sleep(1)  # Necessary after unpause
    env = PX100PickEnv()
    model = SAC("MlpPolicy", env, verbose=1)
    model.learn(total_timesteps=1000)  # , progress_bar=True)
    model.save("temp.model")


# Major obstacles:
# 1. There is the possibility that the px100 moves in to a position such that it is jammed into the ground,
#    potentially rendering it unable to move back to its home position.

# TODO:
# 1. Add the ball model to the world and reset its position with each episode
