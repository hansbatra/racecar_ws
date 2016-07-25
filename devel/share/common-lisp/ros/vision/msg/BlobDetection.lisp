; Auto-generated. Do not edit!


(cl:in-package vision-msg)


;//! \htmlinclude BlobDetection.msg.html

(cl:defclass <BlobDetection> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (colors
    :reader colors
    :initarg :colors
    :type (cl:vector std_msgs-msg:ColorRGBA)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:ColorRGBA :initial-element (cl:make-instance 'std_msgs-msg:ColorRGBA)))
   (sizes
    :reader sizes
    :initarg :sizes
    :type (cl:vector std_msgs-msg:Float64)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Float64 :initial-element (cl:make-instance 'std_msgs-msg:Float64)))
   (locations
    :reader locations
    :initarg :locations
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point))))
)

(cl:defclass BlobDetection (<BlobDetection>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BlobDetection>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BlobDetection)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision-msg:<BlobDetection> is deprecated: use vision-msg:BlobDetection instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BlobDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:header-val is deprecated.  Use vision-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'colors-val :lambda-list '(m))
(cl:defmethod colors-val ((m <BlobDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:colors-val is deprecated.  Use vision-msg:colors instead.")
  (colors m))

(cl:ensure-generic-function 'sizes-val :lambda-list '(m))
(cl:defmethod sizes-val ((m <BlobDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:sizes-val is deprecated.  Use vision-msg:sizes instead.")
  (sizes m))

(cl:ensure-generic-function 'locations-val :lambda-list '(m))
(cl:defmethod locations-val ((m <BlobDetection>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:locations-val is deprecated.  Use vision-msg:locations instead.")
  (locations m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BlobDetection>) ostream)
  "Serializes a message object of type '<BlobDetection>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'colors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'colors))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sizes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sizes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'locations))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'locations))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BlobDetection>) istream)
  "Deserializes a message object of type '<BlobDetection>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'colors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'colors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:ColorRGBA))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sizes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sizes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Float64))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'locations) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'locations)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BlobDetection>)))
  "Returns string type for a message object of type '<BlobDetection>"
  "vision/BlobDetection")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BlobDetection)))
  "Returns string type for a message object of type 'BlobDetection"
  "vision/BlobDetection")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BlobDetection>)))
  "Returns md5sum for a message object of type '<BlobDetection>"
  "4757db88dec50fec01a1ad0746758859")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BlobDetection)))
  "Returns md5sum for a message object of type 'BlobDetection"
  "4757db88dec50fec01a1ad0746758859")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BlobDetection>)))
  "Returns full string definition for message of type '<BlobDetection>"
  (cl:format cl:nil "Header header~%std_msgs/ColorRGBA[] colors~%std_msgs/Float64[] sizes~%geometry_msgs/Point[] locations~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BlobDetection)))
  "Returns full string definition for message of type 'BlobDetection"
  (cl:format cl:nil "Header header~%std_msgs/ColorRGBA[] colors~%std_msgs/Float64[] sizes~%geometry_msgs/Point[] locations~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BlobDetection>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'colors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sizes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'locations) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BlobDetection>))
  "Converts a ROS message object to a list"
  (cl:list 'BlobDetection
    (cl:cons ':header (header msg))
    (cl:cons ':colors (colors msg))
    (cl:cons ':sizes (sizes msg))
    (cl:cons ':locations (locations msg))
))
