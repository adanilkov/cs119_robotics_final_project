import time
import random
import rospy
from train import PX100GazeboClient  # Import your Gazebo client
from std_msgs.msg import Float64

# Initialize ROS node
rospy.init_node("px100_finger_test")

# Instantiate the PX100 Gazebo Client
client = PX100GazeboClient()


# Test function to move fingers in opposite directions
def test_move_fingers():
    try:
        # Loop to test movement
        for i in range(10):
            # Generate random movement for the right finger (within limits)
            right_finger_movement = random.uniform(
                -0.05, 0.05
            )  # Random movement in range

            # Left finger should move in the opposite direction
            left_finger_movement = -right_finger_movement

            print(
                f"Step {i+1}: Moving Right Finger to {right_finger_movement:.3f}, Left Finger to {left_finger_movement:.3f}"
            )

            # Set the positions of the fingers
            client.set_joint_positions(
                right_finger=right_finger_movement,
                left_finger=left_finger_movement,
            )

            # Wait for a short period to observe movement
            time.sleep(1)

        print("Test completed successfully!")

    except Exception as e:
        print(f"Error during test: {e}")


if __name__ == "__main__":
    test_move_fingers()
