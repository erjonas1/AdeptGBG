#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
#from beginner_tutorials.msg import *
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class perception:

  def __init__(self):
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/left/image_rect_color",Image,self.callback)
    #Make callback for depth as well, need to integrate into this code
#    self.pub = rospy.Publisher('output', Object, queue_size=10)
#    self.ball = Object()
    rospy.init_node('perception',anonymous=True)
    rospy.spin()

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)
    #Code for ball detection goes here
    #Code for calculating distance and angle goes here
    self.balldetection(cv_image)
#    self.ball.distance = 1 #Set these to the proper values
#    self.ball.angle = 0.3
    #Rest of the function can be removed, simply for testing
    (rows,cols,channels) = cv_image.shape
    if cols > 60 and rows > 60 :
      cv2.circle(cv_image, (50,50), 10, 255)

    #cv2.imshow("Image window", cv_image)
    #cv2.waitKey(3)

  def balldetection(self,frame):
    hue = 147
    Hue = 255
    sat = 142
    Sat = 255
    val = 132
    Val = 255
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    greenLower = (hue,sat,val)
    greenUpper = (Hue,Sat,Val)

    mask = cv2.inRange(hsv, greenLower, greenUpper)
    mask = cv2.erode(mask, None, iterations=3)
    mask = cv2.dilate(mask, None, iterations=3)
    (height,width) = mask.shape
    halfmask = mask[0:height,0:int(width/2)]
    rect = cv2.boundingRect(halfmask)

    cnts = cv2.findContours(halfmask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]
    center = None

    if len(cnts) > 0:
        c = max(cnts, key=cv2.contourArea)
        ((x, y), radius) = cv2.minEnclosingCircle(c)

        if radius > 5:
            cv2.circle(frame, (int(x), int(y)), int(radius), (0, 255, 255), 2)
	    cv2.circle(frame, (int(x), int(y)), 2, (0, 255, 255), 5)
	    cv2.rectangle(frame,(rect[0],rect[1]),(rect[0]+rect[2],rect[1]+rect[3]), (255, 0, 0), 2)
	    cv2.circle(frame, (rect[0]+rect[2]/2,rect[1]+rect[3]/2), 2, (255, 0, 0), 5)
            print (x,y)
    
    cv2.imshow("Frame", frame)
    cv2.imshow("Mask", mask)

  def output(self):
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
      rospy.loginfo(self.ball)
      self.pub.publish(self.ball)
      rate.sleep()


def main(args):
  ic = perception()
  rospy.init_node('perception', anonymous=True)
#  try:
#    ic.output()
#  except KeyboardInterrupt:
#    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)
