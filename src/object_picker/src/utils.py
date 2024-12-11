import numpy as np
import rospy
import tf

from gazebo_msgs.srv import GetModelState

from std_srvs.srv import Empty

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
