; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude update_info_geoms_srv-request.msg.html

(cl:defclass <update_info_geoms_srv-request> (roslisp-msg-protocol:ros-message)
  ((info_names
    :reader info_names
    :initarg :info_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (info_configs
    :reader info_configs
    :initarg :info_configs
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (info_colors
    :reader info_colors
    :initarg :info_colors
    :type (cl:vector prx_utilities-msg:Vec4_msg)
   :initform (cl:make-array 0 :element-type 'prx_utilities-msg:Vec4_msg :initial-element (cl:make-instance 'prx_utilities-msg:Vec4_msg)))
   (poll_tf
    :reader poll_tf
    :initarg :poll_tf
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass update_info_geoms_srv-request (<update_info_geoms_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <update_info_geoms_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'update_info_geoms_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<update_info_geoms_srv-request> is deprecated: use prx_utilities-srv:update_info_geoms_srv-request instead.")))

(cl:ensure-generic-function 'info_names-val :lambda-list '(m))
(cl:defmethod info_names-val ((m <update_info_geoms_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:info_names-val is deprecated.  Use prx_utilities-srv:info_names instead.")
  (info_names m))

(cl:ensure-generic-function 'info_configs-val :lambda-list '(m))
(cl:defmethod info_configs-val ((m <update_info_geoms_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:info_configs-val is deprecated.  Use prx_utilities-srv:info_configs instead.")
  (info_configs m))

(cl:ensure-generic-function 'info_colors-val :lambda-list '(m))
(cl:defmethod info_colors-val ((m <update_info_geoms_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:info_colors-val is deprecated.  Use prx_utilities-srv:info_colors instead.")
  (info_colors m))

(cl:ensure-generic-function 'poll_tf-val :lambda-list '(m))
(cl:defmethod poll_tf-val ((m <update_info_geoms_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:poll_tf-val is deprecated.  Use prx_utilities-srv:poll_tf instead.")
  (poll_tf m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <update_info_geoms_srv-request>) ostream)
  "Serializes a message object of type '<update_info_geoms_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'info_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'info_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'info_configs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'info_configs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'info_colors))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'info_colors))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'poll_tf) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <update_info_geoms_srv-request>) istream)
  "Deserializes a message object of type '<update_info_geoms_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'info_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'info_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'info_configs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'info_configs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'info_colors) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'info_colors)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_utilities-msg:Vec4_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:setf (cl:slot-value msg 'poll_tf) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<update_info_geoms_srv-request>)))
  "Returns string type for a service object of type '<update_info_geoms_srv-request>"
  "prx_utilities/update_info_geoms_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_info_geoms_srv-request)))
  "Returns string type for a service object of type 'update_info_geoms_srv-request"
  "prx_utilities/update_info_geoms_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<update_info_geoms_srv-request>)))
  "Returns md5sum for a message object of type '<update_info_geoms_srv-request>"
  "d9d148dce7970f17962a58c3b26ffd0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'update_info_geoms_srv-request)))
  "Returns md5sum for a message object of type 'update_info_geoms_srv-request"
  "d9d148dce7970f17962a58c3b26ffd0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<update_info_geoms_srv-request>)))
  "Returns full string definition for message of type '<update_info_geoms_srv-request>"
  (cl:format cl:nil "string[] info_names~%geometry_msgs/Pose[] info_configs~%Vec4_msg[] info_colors~%bool poll_tf~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: prx_utilities/Vec4_msg~%float64 r~%float64 g~%float64 b~%float64 a~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'update_info_geoms_srv-request)))
  "Returns full string definition for message of type 'update_info_geoms_srv-request"
  (cl:format cl:nil "string[] info_names~%geometry_msgs/Pose[] info_configs~%Vec4_msg[] info_colors~%bool poll_tf~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: prx_utilities/Vec4_msg~%float64 r~%float64 g~%float64 b~%float64 a~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <update_info_geoms_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'info_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'info_configs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'info_colors) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <update_info_geoms_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'update_info_geoms_srv-request
    (cl:cons ':info_names (info_names msg))
    (cl:cons ':info_configs (info_configs msg))
    (cl:cons ':info_colors (info_colors msg))
    (cl:cons ':poll_tf (poll_tf msg))
))
;//! \htmlinclude update_info_geoms_srv-response.msg.html

(cl:defclass <update_info_geoms_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass update_info_geoms_srv-response (<update_info_geoms_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <update_info_geoms_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'update_info_geoms_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<update_info_geoms_srv-response> is deprecated: use prx_utilities-srv:update_info_geoms_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <update_info_geoms_srv-response>) ostream)
  "Serializes a message object of type '<update_info_geoms_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <update_info_geoms_srv-response>) istream)
  "Deserializes a message object of type '<update_info_geoms_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<update_info_geoms_srv-response>)))
  "Returns string type for a service object of type '<update_info_geoms_srv-response>"
  "prx_utilities/update_info_geoms_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_info_geoms_srv-response)))
  "Returns string type for a service object of type 'update_info_geoms_srv-response"
  "prx_utilities/update_info_geoms_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<update_info_geoms_srv-response>)))
  "Returns md5sum for a message object of type '<update_info_geoms_srv-response>"
  "d9d148dce7970f17962a58c3b26ffd0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'update_info_geoms_srv-response)))
  "Returns md5sum for a message object of type 'update_info_geoms_srv-response"
  "d9d148dce7970f17962a58c3b26ffd0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<update_info_geoms_srv-response>)))
  "Returns full string definition for message of type '<update_info_geoms_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'update_info_geoms_srv-response)))
  "Returns full string definition for message of type 'update_info_geoms_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <update_info_geoms_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <update_info_geoms_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'update_info_geoms_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'update_info_geoms_srv)))
  'update_info_geoms_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'update_info_geoms_srv)))
  'update_info_geoms_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_info_geoms_srv)))
  "Returns string type for a service object of type '<update_info_geoms_srv>"
  "prx_utilities/update_info_geoms_srv")