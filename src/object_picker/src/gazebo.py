#!/usr/bin/env python
"""Objects handling the interface between the gazebo simulation and training code"""
import math

import numpy as np
import rospy
import tf
from geometry_msgs.msg import Pose
from control_msgs.msg import JointControllerState
from std_msgs.msg import Float64
from gazebo_msgs.srv import (
    SpawnModel,
    SetModelState,
    DeleteModel,
)
from tf.transformations import quaternion_from_euler
from gazebo_msgs.msg import ModelState
from geometry_msgs.msg import Pose, Twist

from config import (
    WAIST_LIM,
    SHOULDER_LIM,
    ELBOW_LIM,
    WRIST_ANGLE_LIM,
    RIGHT_FINGER_LIM,
    LEFT_FINGER_LIM,
)
from utils import (
    clip_value,
    get_gazebo_model_pose,
)


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


def test_pickable_gazebo_object_client():
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpause
    pickable_object = PickableGazeboObjectClient(
        model_name=PICKABLE_OBJ_MODEL_NAME, model_sdf=PICKABLE_OBJ_SDF
    )
    pickable_object.spawn(position=(1, 1, 1))
    pickable_object.delete()
    pickable_object.spawn(
        position=(0.25, 0.0, PICKABLE_OBJECT_FRAME_ORIGIN_Z_OFFSET + 0.001)
    )
    pickable_object.teleport(
        new_position=(0.4, 0.0, PICKABLE_OBJECT_FRAME_ORIGIN_Z_OFFSET + 0.3)
    )
    time.sleep(1)


def test_px100_gazebo_client():
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpause
    client = PX100GazeboClient()
    print(client.get_gripper_prop_link_position())
    print(client.get_right_finger_link_position())
    print(client.get_left_finger_link_position())
    client.set_joint_positions(
        waist=random.uniform(*WAIST_LIM),
        shoulder=random.uniform(*SHOULDER_LIM) / 2,
        elbow=random.uniform(*ELBOW_LIM) / 2,
        wrist_angle=random.uniform(*WRIST_ANGLE_LIM) / 2,
        right_finger=random.uniform(*RIGHT_FINGER_LIM) / 2,
        left_finger=random.uniform(*LEFT_FINGER_LIM) / 2,
    )


if __name__ == "__main__":
    test_pickable_gazebo_object_client()
    test_px100_gazebo_client()