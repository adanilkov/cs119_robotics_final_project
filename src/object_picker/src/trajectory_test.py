import rospy
import time
from control_msgs.msg import FollowJointTrajectoryActionGoal, FollowJointTrajectoryGoal
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from std_msgs.msg import Header


# from interbotix_xs_modules import InterbotixManipulatorXS

# Initialize ROS node
rospy.init_node("px100_pick_and_place")

# Publishers for arm and gripper controllers
arm_trajectory_pub = rospy.Publisher(
    "/px100/arm_controller/follow_joint_trajectory/goal",
    FollowJointTrajectoryActionGoal,
    queue_size=10,
)

gripper_trajectory_pub = rospy.Publisher(
    "/px100/gripper_controller/follow_joint_trajectory/goal",
    FollowJointTrajectoryActionGoal,
    queue_size=10,
)

# Define the joint positions for each movement
HOME_POSITION = {
    "waist": 0.0,
    "shoulder": 0.0,
    "elbow": 0.0,
    "wrist_angle": 0.0,
    "right_finger": 0.0,
    "left_finger": 0.0,
}

OBJECT_POSITION = {
    "waist": 0.0,
    "shoulder": 0.33,
    "elbow": 0.35,
    "wrist_angle": 0.1,
    "right_finger": 0.0,
    "left_finger": 0.0,
}

PICK_POSITION = {
    "waist": 0.05,
    "shoulder": 0.15,
    "elbow": -0.1,
    "wrist_angle": 0.05,
    "right_finger": 0.0,
    "left_finger": 0.0,
}

GOAL_ID = 0


# Helper function to create and publish trajectory messages
def create_and_publish_trajectory(pub, joint_names, positions, duration=2.0):
    traj = JointTrajectory()
    traj.header = Header()
    traj.header.stamp = rospy.Time.now()
    traj.joint_names = joint_names

    point = JointTrajectoryPoint()
    point.positions = positions
    point.time_from_start = rospy.Duration(duration)

    traj.points.append(point)

    # Create and populate FollowJointTrajectoryActionGoal
    goal = FollowJointTrajectoryActionGoal()
    goal.header = Header()
    # goal.goal_id = 1
    g = FollowJointTrajectoryGoal()

    g.goal_time_tolerance = rospy.Duration(
        0.5
    )  # Optional tolerance for goal completion time
    g.trajectory = traj

    goal.goal = g

    # Publish the action goal
    pub.publish(goal)


# Function to move the arm and gripper to pick up an object
def move_to_pick_object():
    try:
        # Step 1: Move the arm to the home position
        print("Moving arm to home position...")
        create_and_publish_trajectory(
            arm_trajectory_pub,
            ["waist", "shoulder", "elbow", "wrist_angle"],
            [
                HOME_POSITION["waist"],
                HOME_POSITION["shoulder"],
                HOME_POSITION["elbow"],
                HOME_POSITION["wrist_angle"],
            ],
            GOAL_ID,
        )
        time.sleep(2)

        # Step 2: Move the arm to the above-object position
        print("Moving arm to above object...")
        create_and_publish_trajectory(
            arm_trajectory_pub,
            ["waist", "shoulder", "elbow", "wrist_angle"],
            [
                OBJECT_POSITION["waist"],
                OBJECT_POSITION["shoulder"],
                OBJECT_POSITION["elbow"],
                OBJECT_POSITION["wrist_angle"],
            ],
        )
        time.sleep(2)

        # Step 3: Close the gripper to start picking
        print("Closing gripper...")
        create_and_publish_trajectory(
            gripper_trajectory_pub,
            ["left_finger", "right_finger"],
            [PICK_POSITION["left_finger"], PICK_POSITION["right_finger"]],
        )
        time.sleep(1)

        # Step 4: Move the arm to pick the object (closer to the object)
        print("Moving arm closer to the object...")
        create_and_publish_trajectory(
            arm_trajectory_pub,
            ["waist", "shoulder", "elbow", "wrist_angle"],
            [
                PICK_POSITION["waist"],
                PICK_POSITION["shoulder"],
                PICK_POSITION["elbow"],
                PICK_POSITION["wrist_angle"],
            ],
        )
        time.sleep(2)

        # Step 5: Open the gripper to release the object (optional for testing)
        print("Opening gripper to release object...")
        create_and_publish_trajectory(
            gripper_trajectory_pub,
            ["left_finger", "right_finger"],
            [HOME_POSITION["left_finger"], HOME_POSITION["right_finger"]],
        )
        time.sleep(1)

        print("Object picking process completed!")

    except Exception as e:
        print(f"Error during object manipulation: {e}")


# Main function to run the pick and place task
if __name__ == "__main__":
    GOAL_ID = 0
    move_to_pick_object()
