#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
from beginner_tutorials.msg import *
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class perception:

  def __init__(self):
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/left/image_rect_color",Image,self.callback)
    #Make callback for depth as well, need to integrate into this code
    self.pub = rospy.Publisher('output', Object, queue_size=10)
    self.ball = Object()
    rospy.init_node('perception',anonymous=True)

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)
    #Code for ball detection goes here
    #Code for calculating distance and angle goes here
    self.ball.distance = 1 #Set these to the proper values
    self.ball.angle = 0.3
    #Rest of the function can be removed, simply for testing
    (rows,cols,channels) = cv_image.shape
    if cols > 60 and rows > 60 :
      cv2.circle(cv_image, (50,50), 10, 255)

    cv2.imshow("Image window", cv_image)
    cv2.waitKey(0)

  def output(self):
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
      rospy.loginfo(self.ball)
      self.pub.publish(self.ball)
      rate.sleep()


def main(args):
  ic = perception()
  rospy.init_node('perception', anonymous=True)
  try:
    ic.output()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
