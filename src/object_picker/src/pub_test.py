#!/usr/bin/env python

import rospy
from std_msgs.msg import Float64


# Callback functions for each joint's position
def waist_callback(msg):
    rospy.loginfo(f"Waist Position Received: {msg.data}")


def shoulder_callback(msg):
    rospy.loginfo(f"Shoulder Position Received: {msg.data}")


def elbow_callback(msg):
    rospy.loginfo(f"Elbow Position Received: {msg.data}")


def wrist_angle_callback(msg):
    rospy.loginfo(f"Wrist Angle Position Received: {msg.data}")


def right_finger_callback(msg):
    rospy.loginfo(f"Right Finger Position Received: {msg.data}")


def left_finger_callback(msg):
    rospy.loginfo(f"Left Finger Position Received: {msg.data}")


def listener():
    rospy.init_node("px100_joint_listener", anonymous=True)

    # Subscribe to the topics where joint positions are being published
    rospy.Subscriber("/px100/waist_controller/command", Float64, waist_callback)
    rospy.Subscriber("/px100/shoulder_controller/command", Float64, shoulder_callback)
    rospy.Subscriber("/px100/elbow_controller/command", Float64, elbow_callback)
    rospy.Subscriber(
        "/px100/wrist_angle_controller/command", Float64, wrist_angle_callback
    )
    rospy.Subscriber(
        "/px100/right_finger_controller/command", Float64, right_finger_callback
    )
    rospy.Subscriber(
        "/px100/left_finger_controller/command", Float64, left_finger_callback
    )

    # Keep the subscriber running
    rospy.spin()


if __name__ == "__main__":
    try:
        listener()
    except rospy.ROSInterruptException:
        pass


class PX100GazeboClient:
    WAIST_CMD_TOPIC = "/px100/waist_controller/command"
    SHOULDER_CMD_TOPIC = "/px100/shoulder_controller/command"
    ELBOW_CMD_TOPIC = "/px100/elbow_controller/command"
    WRIST_ANGLE_CMD_TOPIC = "/px100/wrist_angle_controller/command"
    RIGHT_FINGER_CMD_TOPIC = "/px100/right_finger_controller/command"
    LEFT_FINGER_CMD_TOPIC = "/px100/left_finger_controller/command"

    def __init__(self):
        # rospy.init_node("px100_gazebo_client", anonymous=True)
        self.rate = rospy.Rate(10)

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

    def _clip_value(self, value, limits):
        """
        Clips the input value to the specified limits.
        :param value: The input value to clip.
        :param limits: A tuple (min, max) representing the joint limits.
        :return: The clipped value.
        """
        min_limit, max_limit = limits
        return max(min(value, max_limit), min_limit)

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
        rospy.loginfo(
            f"Setting joint positions: Waist={waist}, Shoulder={shoulder}, "
            f"Elbow={elbow}, Wrist={wrist_angle}, Right Finger={right_finger}, "
            f"Left Finger={left_finger}"
        )
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
