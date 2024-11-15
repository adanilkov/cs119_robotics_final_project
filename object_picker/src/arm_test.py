#! /usr/bin/env python3
import rospy

from brl_pxh_api.brl_pxh_client import BrlPxhClient 
import gymnasium as gym

env = gym.make("ros_gazebo_gym:PandaReach-v1", max_episode_steps=1000, positive_reward=False, control_type="effort")

# def test():
#     api_client = BrlPxhClient()
#     # api_client.brl_go_to_home_pose()
#     api_client.brl_set_ee_pose_components(x=0.3, z=0.1)
    
# if __name__ == '__main__':
#     rospy.init_node('brl_api_tester')
#     test()