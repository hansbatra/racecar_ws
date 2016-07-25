#!/usr/bin/env python

from vision.msg import BlobDetection
import numpy as np
import cv2
import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point

from cv_bridge import CvBridge, CvBridgeError
import threading



class Echo:
    def __init__(self):
        self.node_name = "Echo"
        self.thread_lock = threading.Lock()
        self.sub_image = rospy.Subscriber("/camera/rgb/image_rect_color", Image, self.cbImage, queue_size=1)
        self.pub_image = rospy.Publisher("/vision/image", Image, queue_size=1)
        self.pub_blobs = rospy.Publisher("/vision/blobs", BlobDetection, queue_size=1)
        self.bridge = CvBridge()

        rospy.loginfo("[%s] Initialized." % (self.node_name))

    def cbImage(self, image_msg):
        thread = threading.Thread(target=self.processImage, args=(image_msg,))
        thread.setDaemon(True)
        thread.start()


    def processImage(self, image_msg):
        if not self.thread_lock.acquire(False): return
        im = self.bridge.imgmsg_to_cv2(image_msg)
        hsv = cv2.cvtColor(im, cv2.COLOR_BGR2HSV)
        self.find_color(im, hsv, (200, 200, 255), np.array([0, 100, 200]), np.array([15, 255, 255]))  # red
        #self.find_color(im, hsv, (200, 255, 200), np.array([50, 20, 35]), np.array([85, 210, 215]))  # green
        try:
            self.pub_image.publish(self.bridge.cv2_to_imgmsg(im, "bgr8"))
        except CvBridgeError as e:
            print e
        self.thread_lock.release()

    def find_color(self, im, hsv, label_color, min_thresh, max_thresh):
        mask = cv2.inRange(hsv, min_thresh, max_thresh)
        contours = cv2.findContours(mask, cv2.cv.CV_RETR_TREE, cv2.cv.CV_CHAIN_APPROX_SIMPLE)[0]
        #cv2.drawContours(im, contours, -1, (255, 255, 255), 2)
        approx_contours = []
        for c in contours:
            area = cv2.contourArea(c)
            if area < 500: continue
            perim = cv2.arcLength(c, True)
            approx = cv2.approxPolyDP(c, .05*perim, True)
            #if len(approx) == 4 and len(cv2.convexityDefects(c, cv2.convexHull(c))) <= 1:
            if len(approx) == 4:
                approx_contours.append(approx)
                moments = cv2.moments(c)
                center = (int(moments['m10']/moments['m00']), int(moments['m01']/moments['m00']))
                cv2.circle(im, center, 4, (255, 100, 100), 4)
                print "Moment:  ({}, {})".format(center[0], center[1])

                print "Number of sides:  {}".format(len(approx))
                cv2.drawContours(im, approx_contours, -1, label_color, 3)
        	bd = BlobDetection()
                dim = im.shape
                #print dim
        	bd.locations = [Point(float(center[0])/dim[1],float(center[1])/dim[0],0.0)]
        	self.pub_blobs.publish(bd)

if __name__ == "__main__":
    rospy.init_node("Echo")
    e = Echo()
    rospy.spin()
