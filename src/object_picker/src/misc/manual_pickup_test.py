import time
import rospy
from train import (
    PX100GazeboClient,
    PickableGazeboObjectClient,
    PICKABLE_OBJ_SDF,
    PICKABLE_OBJ_MODEL_NAME,
    unpause_gazebo,
    pause_gazebo,
)


def move_to_pick_object():
    rospy.init_node("manual_pickup_test")
    client = PX100GazeboClient()
    pickable_object = PickableGazeboObjectClient(
        model_name=PICKABLE_OBJ_MODEL_NAME, model_sdf=PICKABLE_OBJ_SDF
    )
    pickable_object.delete()

    try:
        client.set_joint_positions(
            **{
                "waist": 0.0,
                "shoulder": 0.0,
                "elbow": 0.0,
                "wrist_angle": 0.0,
                "right_finger": 0.0,
                "left_finger": 0.0,
            }
        )
        time.sleep(2)

        pickable_object.spawn(position=(0.2835, 0.0, 0.041), yaw=1.5707963)

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 0.95,
            "elbow": 0.35,
            "wrist_angle": -1.29,
            "right_finger": -0.036,
            "left_finger": 0.036,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 1.2,
            "elbow": -0.25,
            "wrist_angle": -0.95,
            "right_finger": -0.036,
            "left_finger": 0.036,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 1.2,
            "elbow": -0.25,
            "wrist_angle": -0.95,
            "right_finger": -0.017,
            "left_finger": 0.017,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 1.2,
            "elbow": -0.5,
            "wrist_angle": -0.95,
            "right_finger": -0.017,
            "left_finger": 0.017,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)

    except Exception as e:
        print(f"Error during object manipulation: {e}")


if __name__ == "__main__":
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpausing gazebo
    move_to_pick_object()
