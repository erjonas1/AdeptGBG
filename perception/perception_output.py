#!/usr/bin/env python

from beginner_tutorials.msg import *
import rospy

def output ():
	pub = rospy.Publisher('output', Object, queue_size=10)
	rospy.init_node('perception',anonymous=True)
	rate = rospy.Rate(10) # 10hz
        while not rospy.is_shutdown():
             ball = Object()
	     ball.distance = 1
             ball.angle = 0.3
  	     rospy.loginfo(ball)
             pub.publish(ball)
             rate.sleep()

if __name__ == '__main__':
    try:
        output()
    except rospy.ROSInterruptException:
        pass
