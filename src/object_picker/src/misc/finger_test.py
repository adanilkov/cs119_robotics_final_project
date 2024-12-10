import time
import random
import rospy
from train import PX100GazeboClient  # Import your Gazebo client
from std_msgs.msg import Float64
import numpy as np

# Initialize ROS node
rospy.init_node("px100_finger_test")

# Instantiate the PX100 Gazebo Client
client = PX100GazeboClient()

# Define positions
HOME_POSITION = {
    "waist": 0.0,
    "shoulder": 0.0,
    "elbow": 0.0,
    "wrist_angle": 0.0,
    "right_finger": 0.0,
    "left_finger": 0.0,
}

OBJECT_POSITION = (0.25, 0.0, 0.2)  # Example target position for the object


# Test function to move fingers, arm, and pick the object
def move_to_pick_object():
    try:
        # Step 1: Move the arm to the home position (for initial state)
        print("Moving arm to home position...")
        client.set_joint_positions(
            waist=HOME_POSITION["waist"],
            shoulder=HOME_POSITION["shoulder"],
            elbow=HOME_POSITION["elbow"],
            wrist_angle=HOME_POSITION["wrist_angle"],
            right_finger=HOME_POSITION["right_finger"],
            left_finger=HOME_POSITION["left_finger"],
        )
        time.sleep(2)  # Wait for movement to complete

        # Step 2: Move the arm to a position above the object
        print("Moving arm above the object...")
        arm_target_position = {
            "waist": 0.0,
            "shoulder": 0.33,
            "elbow": 0.35,
            "wrist_angle": 0.1,
            "right_finger": -1,
            "left_finger": 1,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)  # Wait for the arm to reach above the object

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 0.33,
            "elbow": 0.35,
            "wrist_angle": 0.1,
            "right_finger": 0,
            "left_finger": 0,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)  # Wait for the arm to reach above the object

        arm_target_position = {
            "waist": 0.0,
            "shoulder": 0.3,
            "elbow": 0.3,
            "wrist_angle": 0.1,
            "right_finger": 0,
            "left_finger": 0,
        }
        client.set_joint_positions(**arm_target_position)
        time.sleep(0)  # Wait for the arm to reach above the object
        # Step 3: Move the gripper (fingers) close to the object
        print("Moving arm closer to the object...")
        arm_target_position.update(
            {
                "waist": 0.05,  # Adjust the waist for more precise movement
                "shoulder": 0.15,
                "elbow": -0.1,
                "wrist_angle": 0.05,
            }
        )
        client.set_joint_positions(**arm_target_position)
        time.sleep(2)

        # # Step 4: Adjust finger positions to pick up the object
        # print("Closing fingers to pick up the object...")
        # client.set_joint_positions(
        #     right_finger=0.05,  # Close right finger slightly
        #     left_finger=-0.05,  # Close left finger in opposite direction
        # )
        # time.sleep(1)

        # # Step 5: Move to pick the object (slightly close the arm to grasp it)
        # print("Grasping the object...")
        # arm_target_position.update(
        #     {
        #         "waist": 0.0,
        #         "shoulder": 0.1,
        #         "elbow": -0.05,
        #         "wrist_angle": 0.0,
        #     }
        # )
        # client.set_joint_positions(**arm_target_position)
        # time.sleep(1)

        # # Step 6: Open fingers to release the object
        # print("Opening fingers to release the object...")
        # client.set_joint_positions(
        #     right_finger=0.0,  # Open the right finger
        #     left_finger=0.0,  # Open the left finger
        # )
        # time.sleep(1)

        # print("Object picking process completed!")

    except Exception as e:
        print(f"Error during object manipulation: {e}")


# Main function to test the object picking
if __name__ == "__main__":
    move_to_pick_object()
