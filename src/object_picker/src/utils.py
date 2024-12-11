#!/usr/bin/env python
"""Helper functions"""
from typing import Tuple, Optional

import numpy as np
import rospy
import tf
from gazebo_msgs.srv import GetModelState
from std_srvs.srv import Empty

from config import (
    WAIST_LIM,
    SHOULDER_LIM,
    ELBOW_LIM,
    WRIST_ANGLE_LIM,
    RIGHT_FINGER_LIM,
    LEFT_FINGER_LIM,
    MAX_WAIST_DELTA, 
    MAX_SHOULDER_DELTA,
    MAX_ELBOW_DELTA,
    MAX_WRIST_ANGLE_DELTA,
)


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


def normalize_joint_positions(
    waist: Optional[float] = None,
    shoulder: Optional[float] = None,
    elbow: Optional[float] = None,
    wrist_angle: Optional[float] = None,
    right_finger: Optional[float] = None,
    left_finger: Optional[float] = None,
) -> Tuple[
    Optional[float],
    Optional[float],
    Optional[float],
    Optional[float],
    Optional[float],
    Optional[float],
]:
    """Normalize joint positiont to value between 0 and 1."""
    if waist is None:
        norm_waist = None
    else:
        norm_waist = (waist - WAIST_LIM[0]) / (WAIST_LIM[1] - WAIST_LIM[0])

    if shoulder is None:
        norm_shoulder = None
    else:
        norm_shoulder = (shoulder - SHOULDER_LIM[0]) / (
            SHOULDER_LIM[1] - SHOULDER_LIM[0]
        )

    if elbow is None:
        norm_elbow = None
    else:
        norm_elbow = (elbow - ELBOW_LIM[0]) / (ELBOW_LIM[1] - ELBOW_LIM[0])

    if wrist_angle is None:
        norm_wrist_angle = None
    else:
        norm_wrist_angle = (wrist_angle - WRIST_ANGLE_LIM[0]) / (WRIST_ANGLE_LIM[1] - WRIST_ANGLE_LIM[0])

    if right_finger is None:
        norm_right_finger = None
    else:
        norm_right_finger = (right_finger - RIGHT_FINGER_LIM[0]) / (
            RIGHT_FINGER_LIM[1] - RIGHT_FINGER_LIM[0]
        )

    if left_finger is None:
        norm_left_finger = None
    else:
        norm_left_finger = (left_finger - LEFT_FINGER_LIM[0]) / (
            LEFT_FINGER_LIM[1] - LEFT_FINGER_LIM[0]
        )

    return (
        norm_waist,
        norm_shoulder,
        norm_elbow,
        norm_wrist_angle,
        norm_right_finger,
        norm_left_finger,
    )

MAX_DELTAS_NP_ARRAY = np.array([  #Pre-convert to ndarray for efficiency
    MAX_WAIST_DELTA,
    MAX_SHOULDER_DELTA,
    MAX_ELBOW_DELTA,
    MAX_WRIST_ANGLE_DELTA
])

def denormalize_action_vector(action: np.ndarray) -> np.ndarray:
    """Converts the normalized action outputs (b/w -1 & 1) back to joint-delta scale"""
    return -MAX_DELTAS_NP_ARRAY + (action + 1) * MAX_DELTAS_NP_ARRAY