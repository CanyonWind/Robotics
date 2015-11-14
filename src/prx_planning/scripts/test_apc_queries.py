#!/usr/bin/env python

import sys 
import rospy
import actionlib
from actionlib_msgs.msg import *
from prx_planning.msg import apc_queryAction, apc_queryGoal

def send_goal(cclient,cgoal):
    cclient.send_goal(cgoal)
    cclient.wait_for_result()
    # rospy.sleep(5)

    if cclient.get_state() != GoalStatus.SUCCEEDED:
        print "@@@ Failed to plan to target configuration"
        return False
    return True

def right_move(cclient):
    cgoal = apc_queryGoal()
    cgoal.goal_state = [0, 1.57,0,0,-1.70,0,0,0,0, 1.57,0,0,-1.7,0,0,0,1,1]
    # cgoal.goal_state = [0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1,1]
    cgoal.stage = apc_queryGoal.MOVE
    if not send_goal(cclient,cgoal):
        return

    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.MOVE_AND_DETECT
    cgoal.bin = "B"
    cgoal.hand = "right"
    if not send_goal(cclient,cgoal):
        return

    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.PERFORM_GRASP
    cgoal.object = "crayola"
    cgoal.hand = "right"
    cgoal.bin = "B"
    # cgoal.object_state = [ 1.1125, 0, 1.3725, 0.707107, 0, 0, 0.707107]
    # cgoal.object_state = [ 1.1075, 0, 1.4175, 0, 0, 0.707107, 0.707107]
    cgoal.object_state = [ 1.1125, 0, 1.4175, 0, 0, 0,1]
    if not send_goal(cclient,cgoal):
        return

    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.MOVE_TO_ORDER_BIN
    cgoal.hand = "right"
    if not send_goal(cclient,cgoal):
        return

def left_move(cclient):

    # while True:
    cgoal = apc_queryGoal()
    cgoal.goal_state = [0, 1.57,0,0,-1.70,0,0,0,0, 1.57,0,0,-1.7,0,0,0,1,1]
    # cgoal.goal_state = [0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1,1]
    cgoal.stage = apc_queryGoal.MOVE
    if not send_goal(cclient,cgoal):
        return


    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.MOVE_AND_DETECT
    cgoal.bin = "B"
    cgoal.hand = "left"
    if not send_goal(cclient,cgoal):
        return

    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.PERFORM_GRASP
    cgoal.object = "crayola"
    cgoal.hand = "left"
    cgoal.bin = "B"
    cgoal.object_state = [ 1.1125, 0, 1.3725, 0.707107, 0, 0, 0.707107]
    if not send_goal(cclient,cgoal):
        return

    cgoal = apc_queryGoal()
    cgoal.stage = apc_queryGoal.MOVE_TO_ORDER_BIN
    cgoal.hand = "left"
    if not send_goal(cclient,cgoal):
        return

if __name__ == '__main__':

    rospy.init_node('test_apc', anonymous=False)
    
    cclient = actionlib.SimpleActionClient('prx/apc_action', apc_queryAction)
    cclient.wait_for_server()


    # while True:
    #     cgoal = apc_queryGoal()
    #     # cgoal.goal_state = [0, 1.57,0,0,-1.70,0,0,0,0, 1.57,0,0,-1.7,0,0,0,1,1]
    #     cgoal.goal_state = [0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1,1]
    #     cgoal.stage = apc_queryGoal.MOVE
    #     send_goal(cclient,cgoal)

    #     cgoal = apc_queryGoal()
    #     cgoal.goal_state = [0, 1.57,0,0,-1.70,0,0,0,0, 1.57,0,0,-1.7,0,0,0,1,1]
    #     # cgoal.goal_state = [0, 0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,1,1]
    #     cgoal.stage = apc_queryGoal.MOVE
    #     send_goal(cclient,cgoal)
    

    while True:
        right_move(cclient)
        # left_move(cclient)



