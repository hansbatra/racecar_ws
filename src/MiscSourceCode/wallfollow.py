#!/usr/bin/env python
# general imports for all python nodes
import rospy
import math
import numpy

 # node specific imports
from ackermann_msgs.msg import AckermannDriveStamped # steering messages
from sensor_msgs.msg import LaserScan, Joy # joystick and laser scanner msgs

class WallE():
     # variable to return distance to wall from callback
     # (at 90 and 60 degrees to left of vehicle)
     scan = [0.0, 0.0]           # Ensure it is created before being used

     def __init__(self):
        rospy.init_node('wall_bang', anonymous=False)
        rospy.on_shutdown(self.shutdown)

        rate = 10             # output messages/sec (also impacts latency)
        r = rospy.Rate(rate)

         # node specific topics (remap on command line or in launch file)
        self.drive = rospy.Publisher('/drive', AckermannDriveStamped, queue_size=5)
        rospy.Subscriber('scan', LaserScan, self.callback)

        
        # set control parameters
        speed = 0.5          # constant travel speed in meters/second
        dist_wall = 0.333    # start and stay at ~1ft from wall
        dist_trav = 5.0      # meters to travel in time travel mode

         # fill out fields in ackermann steering message (to go straight)
        drive_cmd = AckermannDriveStamped()
        drive_cmd.drive.speed = speed
        drive_cmd.drive.steering_angle = 0.0
        
        r60 = dist_wall / math.cos(math.radians(30.0))  # expected distance if parallel to wall
        scan = [dist_wall, r60]                         # assume correct vehicle pose (at start)
