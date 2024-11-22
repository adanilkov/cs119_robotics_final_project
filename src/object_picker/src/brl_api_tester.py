#! /usr/bin/env python3
import rospy

from brl_pxh_api.brl_pxh_client import BrlPxhClient 

class BrlPxhApiTester:

    def __init__(self):
        self.api_client = BrlPxhClient()

    def _test_endpoints(self):
        # self.api_client.brl_go_to_home_pose()
        # self.api_client.brl_set_ee_pose_components(x=0.2, z=0.1)
        # self.api_client.brl_go_to_home_pose()
        # self.api_client.brl_set_single_joint_position(
        #         joint_name="waist",
        #         position=0.2)
        # self.api_client.brl_set_ee_cartesian_trajectory(z=-0.1)
        # self.api_client.brl_set_ee_cartesian_trajectory(x=-0.1)
        # self.api_client.brl_set_ee_cartesian_trajectory(z=0.1)
        # self.api_client.brl_set_ee_cartesian_trajectory(x=0.1)
        # self.api_client.brl_set_single_joint_position(
        #         joint_name="waist",
        #         position=0)

        # ------------------------------------------------------------
        # Uncomment the below to test the brl_set_gripper_pressure
        # endpoint with a value of 0. This causes the gripper to open
        # less than its full range of motion. I believe this is just
        # part of how the PX-100 sets the gripper strength.
        # self.api_client.brl_set_gripper_pressure(0)
        # self.api_client.brl_open_gripper()
        # self.api_client.brl_close_gripper()
        # ------------------------------------------------------------

        self.api_client.brl_set_gripper_pressure(0.5)
        self.api_client.brl_open_gripper()
        self.api_client.brl_close_gripper()
        # ------------------------------------------------------------
        
        # ------------------------------------------------------------
        # Uncomment the below to test the brl_set_joint_positions
        # endpoint.
        # self.api_client.brl_set_joint_positions(
        #         joint_positions=[0.2, 0.2, 0.2, 0.2])
        # ------------------------------------------------------------
        
        # ------------------------------------------------------------
        # Uncomment to see delayed open_gripper. The delay causes the
        # command after open_gripper to be delayed
        # by 2 seconds.
        # self.api_client.brl_open_gripper(delay=2.0)
        # ------------------------------------------------------------

        # ------------------------------------------------------------
        # Uncomment to see delayed close_gripper. The delay causes the
        # command after open_gripper to be delayed
        # by 2 seconds.

        # self.api_client.brl_close_gripper(delay=2.0)
        # ------------------------------------------------------------

        self.api_client.brl_go_to_sleep_pose()


    def _test_delta_increments(self):
        import random
        import time

        joint_0_limits = [-3.141583, 3.141583]
        joint_1_limits = [-1.937315, 1.867502]
        joint_2_limits = [-2.111848, 1.605703]
        joint_3_limits = [-1.745329, 2.146755]

        self.api_client.brl_go_to_home_pose()

        pos = [0, 0, 0, 0]
        self.api_client.brl_set_joint_positions(
                joint_positions=pos
            )

        for _ in range(3):
            delta = [random.uniform(-0.3, 0.3) for _ in range(4)] 
            pos = [p+d for p,d in zip(pos, delta)]


            print("\n", [f"{pos[i]:.2f}" for i in range(4)], "\n")

            self.api_client.brl_set_joint_positions(
                joint_positions=pos
            )
            time.sleep(0.5)
        
        self.api_client.brl_go_to_home_pose()
        self.api_client.brl_go_to_sleep_pose()


    def run(self):
        # rate = rospy.Rate(10)
        # while not rospy.is_shutdown():
        #    self._test_endpoints()
        #    rate.sleep()
        # self._test_endpoints()
        self._test_delta_increments()

if __name__ == '__main__':
    rospy.init_node('brl_api_tester')
    BrlPxhApiTester().run()
    
