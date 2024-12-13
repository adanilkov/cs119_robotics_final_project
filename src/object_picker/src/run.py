#!/usr/bin/env python
import rospy
from stable_baselines3 import SAC, PPO
import numpy as np
from std_msgs.msg import Float64MultiArray, Float64
from sensor_msgs.msg import JointState
from control_msgs.msg import JointControllerState
import math
from config import WAIST_LIM, SHOULDER_LIM, ELBOW_LIM, WRIST_ANGLE_LIM

from interbotix_xs_modules.arm import InterbotixManipulatorXS

# FIXME: denormalize action vector b4 enacting
from utils import denormalize_action_vector, clip_value

#  `roslaunch interbotix_xsarm_control xsarm_control.launch robot_model:=px100 use_position_controllers:=true use_sim:=false`


class PX100_REAL:

    CLOSENESS_TOL = 0.01
    MAX_WAIT_ITERS = 40
    HOME_POSE = [0, -0.15, 0, 0.0]

    LIMITS = [WAIST_LIM, SHOULDER_LIM, ELBOW_LIM, WRIST_ANGLE_LIM]

    MODEL_PATH = "src/object_picker/src/models/px100_PPO_static-pos_imit-learning_85000_steps.zip"

    def __init__(self, bot):
        self.rate = rospy.Rate(0.6)
        self.bot = bot

        self.joint_states_sub = rospy.Subscriber(
            "/px100/joint_states", JointState, self.joint_state_cb
        )

        self.joint_states = (
            None  # NOTE: (WAIST, SHOULDER, EBLOW, WRIST, RIGHT_FINGER, LEFT_FINGER)
        )

        self.model = PPO.load(self.MODEL_PATH)

    def joint_state_cb(self, msg):
        self.joint_states = msg.position

    def _await_subscriptions(self):
        while self.joint_states is None:
            self.rate.sleep()

    def get_joint_positions(self) -> np.ndarray:
        """Returns the current (most recent) joint positions as a numpy array.

        NOTE: Order is [waist, should, elbow, wrist_angle, right_finger, left_finger]
        """
        self._await_subscriptions()
        joint_positions = np.array(self.joint_states)
        joint_positions = np.delete(joint_positions, 4)  # Delete gripper value (extra)
        return joint_positions

    def run(self):
        # bot.arm.go_to_home_pose()
        bot.arm.set_joint_positions(self.HOME_POSE)

        self.rate.sleep()

        while not rospy.is_shutdown():
            action, _ = self.model.predict(
                self.get_joint_positions()[:-2], deterministic=True
            )

            denormalized_action = denormalize_action_vector(action)

            for i, joint_lim in enumerate(self.LIMITS):
                denormalized_action[i] = clip_value(
                    denormalized_action[i] * 2.5, joint_lim
                )

            print(f"Action: {denormalized_action}")
            # bot.arm.go_to_home_pose()
            self.bot.arm.set_joint_positions(
                denormalized_action + self.get_joint_positions()[:-2]
            )

            self.rate.sleep()


if __name__ == "__main__":
    bot = InterbotixManipulatorXS("px100", "arm", "gripper")  # This inits the node
    px100 = PX100_REAL(bot)
    px100.run()
