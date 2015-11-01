; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude world_config_msg.msg.html

(cl:defclass <world_config_msg> (roslisp-msg-protocol:ros-message)
  ((plant_configs
    :reader plant_configs
    :initarg :plant_configs
    :type (cl:vector prx_simulation-msg:state_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:state_msg :initial-element (cl:make-instance 'prx_simulation-msg:state_msg)))
   (obstacle_configs
    :reader obstacle_configs
    :initarg :obstacle_configs
    :type (cl:vector prx_simulation-msg:state_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:state_msg :initial-element (cl:make-instance 'prx_simulation-msg:state_msg)))
   (node_name
    :reader node_name
    :initarg :node_name
    :type cl:string
    :initform "")
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:float
    :initform 0.0))
)

(cl:defclass world_config_msg (<world_config_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <world_config_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'world_config_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<world_config_msg> is deprecated: use prx_simulation-msg:world_config_msg instead.")))

(cl:ensure-generic-function 'plant_configs-val :lambda-list '(m))
(cl:defmethod plant_configs-val ((m <world_config_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:plant_configs-val is deprecated.  Use prx_simulation-msg:plant_configs instead.")
  (plant_configs m))

(cl:ensure-generic-function 'obstacle_configs-val :lambda-list '(m))
(cl:defmethod obstacle_configs-val ((m <world_config_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:obstacle_configs-val is deprecated.  Use prx_simulation-msg:obstacle_configs instead.")
  (obstacle_configs m))

(cl:ensure-generic-function 'node_name-val :lambda-list '(m))
(cl:defmethod node_name-val ((m <world_config_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:node_name-val is deprecated.  Use prx_simulation-msg:node_name instead.")
  (node_name m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <world_config_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:timestamp-val is deprecated.  Use prx_simulation-msg:timestamp instead.")
  (timestamp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <world_config_msg>) ostream)
  "Serializes a message object of type '<world_config_msg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plant_configs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'plant_configs))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacle_configs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacle_configs))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <world_config_msg>) istream)
  "Deserializes a message object of type '<world_config_msg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plant_configs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plant_configs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:state_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacle_configs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacle_configs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:state_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<world_config_msg>)))
  "Returns string type for a message object of type '<world_config_msg>"
  "prx_simulation/world_config_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'world_config_msg)))
  "Returns string type for a message object of type 'world_config_msg"
  "prx_simulation/world_config_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<world_config_msg>)))
  "Returns md5sum for a message object of type '<world_config_msg>"
  "95a57da07d2f6a3f3c1e6a8109a5aa38")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'world_config_msg)))
  "Returns md5sum for a message object of type 'world_config_msg"
  "95a57da07d2f6a3f3c1e6a8109a5aa38")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<world_config_msg>)))
  "Returns full string definition for message of type '<world_config_msg>"
  (cl:format cl:nil "prx_simulation/state_msg[] plant_configs~%prx_simulation/state_msg[] obstacle_configs~%string node_name~%float64 timestamp~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'world_config_msg)))
  "Returns full string definition for message of type 'world_config_msg"
  (cl:format cl:nil "prx_simulation/state_msg[] plant_configs~%prx_simulation/state_msg[] obstacle_configs~%string node_name~%float64 timestamp~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <world_config_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plant_configs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacle_configs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'node_name))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <world_config_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'world_config_msg
    (cl:cons ':plant_configs (plant_configs msg))
    (cl:cons ':obstacle_configs (obstacle_configs msg))
    (cl:cons ':node_name (node_name msg))
    (cl:cons ':timestamp (timestamp msg))
))
