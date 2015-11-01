; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude visualize_ghost_plants_srv-request.msg.html

(cl:defclass <visualize_ghost_plants_srv-request> (roslisp-msg-protocol:ros-message)
  ((plant_paths
    :reader plant_paths
    :initarg :plant_paths
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (ghost_configs
    :reader ghost_configs
    :initarg :ghost_configs
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass visualize_ghost_plants_srv-request (<visualize_ghost_plants_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_ghost_plants_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_ghost_plants_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_ghost_plants_srv-request> is deprecated: use prx_utilities-srv:visualize_ghost_plants_srv-request instead.")))

(cl:ensure-generic-function 'plant_paths-val :lambda-list '(m))
(cl:defmethod plant_paths-val ((m <visualize_ghost_plants_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:plant_paths-val is deprecated.  Use prx_utilities-srv:plant_paths instead.")
  (plant_paths m))

(cl:ensure-generic-function 'ghost_configs-val :lambda-list '(m))
(cl:defmethod ghost_configs-val ((m <visualize_ghost_plants_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:ghost_configs-val is deprecated.  Use prx_utilities-srv:ghost_configs instead.")
  (ghost_configs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_ghost_plants_srv-request>) ostream)
  "Serializes a message object of type '<visualize_ghost_plants_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plant_paths))))
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
   (cl:slot-value msg 'plant_paths))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ghost_configs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ghost_configs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_ghost_plants_srv-request>) istream)
  "Deserializes a message object of type '<visualize_ghost_plants_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plant_paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plant_paths)))
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
  (cl:setf (cl:slot-value msg 'ghost_configs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ghost_configs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_ghost_plants_srv-request>)))
  "Returns string type for a service object of type '<visualize_ghost_plants_srv-request>"
  "prx_utilities/visualize_ghost_plants_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_ghost_plants_srv-request)))
  "Returns string type for a service object of type 'visualize_ghost_plants_srv-request"
  "prx_utilities/visualize_ghost_plants_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_ghost_plants_srv-request>)))
  "Returns md5sum for a message object of type '<visualize_ghost_plants_srv-request>"
  "5c1d97362737c2f9457429d28485d6b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_ghost_plants_srv-request)))
  "Returns md5sum for a message object of type 'visualize_ghost_plants_srv-request"
  "5c1d97362737c2f9457429d28485d6b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_ghost_plants_srv-request>)))
  "Returns full string definition for message of type '<visualize_ghost_plants_srv-request>"
  (cl:format cl:nil "string[] plant_paths~%geometry_msgs/Pose[] ghost_configs~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_ghost_plants_srv-request)))
  "Returns full string definition for message of type 'visualize_ghost_plants_srv-request"
  (cl:format cl:nil "string[] plant_paths~%geometry_msgs/Pose[] ghost_configs~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_ghost_plants_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plant_paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ghost_configs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_ghost_plants_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_ghost_plants_srv-request
    (cl:cons ':plant_paths (plant_paths msg))
    (cl:cons ':ghost_configs (ghost_configs msg))
))
;//! \htmlinclude visualize_ghost_plants_srv-response.msg.html

(cl:defclass <visualize_ghost_plants_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass visualize_ghost_plants_srv-response (<visualize_ghost_plants_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_ghost_plants_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_ghost_plants_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_ghost_plants_srv-response> is deprecated: use prx_utilities-srv:visualize_ghost_plants_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_ghost_plants_srv-response>) ostream)
  "Serializes a message object of type '<visualize_ghost_plants_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_ghost_plants_srv-response>) istream)
  "Deserializes a message object of type '<visualize_ghost_plants_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_ghost_plants_srv-response>)))
  "Returns string type for a service object of type '<visualize_ghost_plants_srv-response>"
  "prx_utilities/visualize_ghost_plants_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_ghost_plants_srv-response)))
  "Returns string type for a service object of type 'visualize_ghost_plants_srv-response"
  "prx_utilities/visualize_ghost_plants_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_ghost_plants_srv-response>)))
  "Returns md5sum for a message object of type '<visualize_ghost_plants_srv-response>"
  "5c1d97362737c2f9457429d28485d6b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_ghost_plants_srv-response)))
  "Returns md5sum for a message object of type 'visualize_ghost_plants_srv-response"
  "5c1d97362737c2f9457429d28485d6b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_ghost_plants_srv-response>)))
  "Returns full string definition for message of type '<visualize_ghost_plants_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_ghost_plants_srv-response)))
  "Returns full string definition for message of type 'visualize_ghost_plants_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_ghost_plants_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_ghost_plants_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_ghost_plants_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'visualize_ghost_plants_srv)))
  'visualize_ghost_plants_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'visualize_ghost_plants_srv)))
  'visualize_ghost_plants_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_ghost_plants_srv)))
  "Returns string type for a service object of type '<visualize_ghost_plants_srv>"
  "prx_utilities/visualize_ghost_plants_srv")