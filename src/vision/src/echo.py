#!/usr/bin/env python
import cv2
import rospy
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import threading


class Echo:
    def __init__(self):
        self.node_name = "Echo"
        self.thread_lock = threading.Lock()
        self.sub_image = rospy.Subscriber("/camera/rgb/image_rect_color",\
                Image, self.cbImage, queue_size=1)
        self.pub_image = rospy.Publisher("~echo_image",\
                Image, queue_size=1)
        self.bridge = CvBridge()

        rospy.loginfo("[%s] Initialized." %(self.node_name))

    def cbImage(self,image_msg):
        thread = threading.Thread(target=self.processImage,args=(image_msg,))
        thread.setDaemon(True)
        thread.start()


    def processImage(self, image_msg):
        if not self.thread_lock.acquire(False):
            return
        image_cv = self.bridge.imgmsg_to_cv2(image_msg)
        
        hsv = cv2.cvtColor(image_cv, cv2.COLOR_BGR2HSV)
        msk_target = cv2.inRange(hsv, np.array([0,0,20]),np.array([15, 255, 235]))
        output_target = cv2.bitwise_and(image_cv,image_cv, mask=msk_target)

	# Setup SimpleBlobDetector parameters.
	params = cv2.SimpleBlobDetector_Params()
	 
	# Change thresholds

	params.minThreshold = 10;
	params.maxThreshold = 200;
	 
	# Filter by Area.
	params.filterByArea = True
	params.minArea = 5000
	params.maxArea = 10000

	# don't need these parameters, but could be useful in the future
	# Filter by Color --manual says does not work??
	params.filterByColor = False
	params.blobColor = 40

	# Filter by Circularity
	params.filterByCircularity = False
	params.minCircularity = 0.1
	 
	# Filter by Convexity
	params.filterByConvexity = False
	params.minConvexity = 0.87
	 
	# Filter by Inertia
	params.filterByInertia = False
	params.minInertiaRatio = 0.01

	detector = cv2.SimpleBlobDetector(params)
	

	# Detect blobs.
	keypoints_target = detector.detect(output_target)


        im_with_keypoints_target = cv2.drawKeypoints(output_target, keypoints_target, np.array([]), (0,0,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)






        try:
            self.pub_image.publish(\
                    self.bridge.cv2_to_imgmsg(im_with_keypoints_target, "bgr8"))
        except CvBridgeError as e:
            print(e)
        self.thread_lock.release()


if __name__=="__main__":
    rospy.init_node('Echo')
    e = Echo()
    rospy.spin()

