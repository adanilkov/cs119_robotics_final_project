import rospy
from stable_baselines3 import SAC
import numpy as np
from std_msgs.msg import Float64MultiArray, Float64
from sensor_msgs.msg import JointState
from control_msgs.msg import JointControllerState
import math

from interbotix_xs_modules.arm import InterbotixManipulatorXS

#  `roslaunch interbotix_xsarm_control xsarm_control.launch robot_model:=px100 use_position_controllers:=true use_sim:=false`


def clip_value(value, limits):
    """
    Clips the input value to the specified limits.
    :param value: The input value to clip.
    :param limits: A tuple (min, max) representing the joint limits.
    :return: The clipped value.
    """
    min_limit, max_limit = limits
    return max(min(value, max_limit), min_limit)


class PX100_REAL:

    CLOSENESS_TOL = 0.01
    MAX_WAIT_ITERS = 40

    WAIST_LIM = (-3.141583, 3.141583)
    SHOULDER_LIM = (-1.937315, 1.867502)
    ELBOW_LIM = (-2.111848, 1.605703)
    WRIST_ANGLE_LIM = (-1.745329, 2.146755)
    RIGHT_FINGER_LIM = (-0.029, -0.0139)
    LEFT_FINGER_LIM = (0.0139, 0.029)

    MODEL_PATH = "./src/object_picker/checkpoints/px100_checkpoint_670000_steps.zip"

    def __init__(self, bot):
        self.rate = rospy.Rate(0.25)
        self.bot = bot

        self.joint_states_sub = rospy.Subscriber(
            "/px100/joint_states", JointState, self.joint_state_cb
        )

        self.joint_states = (
            None  # NOTE: (WAIST, SHOULDER, EBLOW, WRIST, RIGHT_FINGER, LEFT_FINGER)
        )

        self.model = SAC.load(self.MODEL_PATH)

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
        # positions = [
        #     self.waist_state.process_value,
        #     self.shoulder_state.process_value,
        #     self.elbow_state.process_value,
        #     self.wrist_angle_state.process_value,
        #     self.right_finger_state.process_value,
        #     # HACK: Left finger never publishes state
        #     # self.left_finger_state.process_value,
        #     self.current_approx_left_finger_position,
        # ]
        joint_positions = np.array(self.joint_states)
        joint_positions = np.delete(joint_positions, 4)  # Delete gripper value (extra)
        return joint_positions

    def run(self):
        bot.arm.go_to_home_pose()

        self.rate.sleep()

        while not rospy.is_shutdown():
            action, _ = self.model.predict(
                self.get_joint_positions(), deterministic=True
            )
            print(f"Action: {action}")
            # bot.arm.go_to_home_pose()
            self.bot.arm.set_joint_positions(action[:-2] * 2)
            # self.bot.gripper.open()
            self.rate.sleep()


if __name__ == "__main__":
    # rospy.init_node("PX100_Real_RL")
    bot = InterbotixManipulatorXS("px100", "arm", "gripper")
    px100 = PX100_REAL(bot)
    px100.run()
