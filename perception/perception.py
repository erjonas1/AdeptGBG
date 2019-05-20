#!/usr/bin/env python
from __future__ import print_function

import roslib
import sys
import rospy
import cv2
import math
import struct
#from beginner_tutorials.msg import Object
from ball_follower.msg import ballpos
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import PointCloud2

class perception:

  def __init__(self):
    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/left/image_rect_color",Image,self.callback)
    self.image_sub = rospy.Subscriber("point_cloud/cloud_registered",PointCloud2,self.callback2)
    #Make callback for depth as well, need to integrate into this code
    self.pub = rospy.Publisher('output', ballpos, queue_size=10)
    self.ball = ballpos()
    rospy.init_node('perception',anonymous=True)
    #rospy.spin()

  #def callback2(self,data):
    #try:
     # self.depth_image = self.bridge.imgmsg_to_cv2(data)
    #except CVBridgeError as e:
    #  print(e)

  def callback2(self,data):
    self.point_cloud = data 
   
  def findCoordinates(self,pCloud, u, v):
    height = pCloud.height
    width = pCloud.width

    arraypos = v*pCloud.row_step + u*pCloud.point_step
    arrayposX = arraypos + pCloud.fields[0].offset
    arrayposY = arraypos + pCloud.fields[1].offset
    arrayposZ = arraypos + pCloud.fields[2].offset
    
 
    X = pCloud.data[arrayposX:arrayposX+4]
    Y = pCloud.data[arrayposY:arrayposY+4]
    Z = pCloud.data[arrayposZ:arrayposZ+4]

    A = bytearray(X)
    B = bytearray(Y)
    C = bytearray(Z)

    x = struct.unpack('<f',A)
    y = struct.unpack('<f',B)
    z = struct.unpack('<f',C)
	
    #length = len(data.data[0])
    #length2 = len(data.data)

    #print (x, y, z) 		
    #print (arraypos)
    #print (height, width)
    #print (length2,length)
    #print (data.is_bigendian)

    return [x, y, z]

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)
    #Code for ball detection goes here
    #Code for calculating distance and angle goes here
    self.balldetection(cv_image)
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
    cx=662.109
    cy=369.552
    fx=700.25
    fy=700.25
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    greenLower = (hue,sat,val)
    greenUpper = (Hue,Sat,Val)

    mask = cv2.inRange(hsv, greenLower, greenUpper)
    mask = cv2.erode(mask, None, iterations=3)
    mask = cv2.dilate(mask, None, iterations=3)
    (height,width) = mask.shape
    halfmask = mask[0:height,0:width]
    rect = cv2.boundingRect(halfmask)

    cnts = cv2.findContours(halfmask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]
    center = None

    self.ball.distance = 0
    self.ball.angle = 0

    if len(cnts) > 0:
        c = max(cnts, key=cv2.contourArea)
        ((u, v), radius) = cv2.minEnclosingCircle(c)

        if radius > 5:
            cv2.circle(frame, (int(u), int(v)), int(radius), (0, 255, 255), 2)
	    cv2.circle(frame, (int(u), int(v)), 2, (0, 255, 255), 5)
	    cv2.rectangle(frame,(rect[0],rect[1]),(rect[0]+rect[2],rect[1]+rect[3]), (255, 0, 0), 2)
	    cv2.circle(frame, (rect[0]+rect[2]/2,rect[1]+rect[3]/2), 2, (255, 0, 0), 5)
            #cv2.circle(frame, (660, 360), 2, (0, 0, 255), 5)
            #z = self.depth_image[int(x),int(y)] #Set these to the proper value

	    ls = self.findCoordinates(self.point_cloud, int(u),int(v)) #Set these to the proper value
            x = ls[0][0]
	    y = ls[1][0]
	    z = ls[2][0]

	    #print(x, y, z)

	    #print(z)
            #u = (u-cx)*z*(1/fx)
	    #v = (v-cy)*z*(1/fy)
            #print(x,y)
            self.ball.distance = math.sqrt(x**2+y**2+z**2)
            self.ball.angle = math.atan(y/x)
           
    #cv2.circle(frame,(600,300),2,(0,0,255),3)
    cv2.imshow("Frame", frame)
    cv2.waitKey(3)

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
