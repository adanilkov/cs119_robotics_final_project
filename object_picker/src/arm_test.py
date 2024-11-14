#! /usr/bin/env python3
import rospy

from brl_pxh_api.brl_pxh_client import BrlPxhClient 

def test():
    api_client = BrlPxhClient()
    # api_client.brl_go_to_home_pose()
    api_client.brl_set_ee_pose_components(x=0.3, z=0.1)
    
if __name__ == '__main__':
    rospy.init_node('brl_api_tester')
    test()