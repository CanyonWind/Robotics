; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude plant_locations_msg.msg.html

(cl:defclass <plant_locations_msg> (roslisp-msg-protocol:ros-message)
  ((plant_states
    :reader plant_states
    :initarg :plant_states
    :type (cl:vector prx_simulation-msg:state_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:state_msg :initial-element (cl:make-instance 'prx_simulation-msg:state_msg)))
   (plant_paths
    :reader plant_paths
    :initarg :plant_paths
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (node_name
    :reader node_name
    :initarg :node_name
    :type cl:string
    :initform ""))
)

(cl:defclass plant_locations_msg (<plant_locations_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plant_locations_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plant_locations_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<plant_locations_msg> is deprecated: use prx_simulation-msg:plant_locations_msg instead.")))

(cl:ensure-generic-function 'plant_states-val :lambda-list '(m))
(cl:defmethod plant_states-val ((m <plant_locations_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:plant_states-val is deprecated.  Use prx_simulation-msg:plant_states instead.")
  (plant_states m))

(cl:ensure-generic-function 'plant_paths-val :lambda-list '(m))
(cl:defmethod plant_paths-val ((m <plant_locations_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:plant_paths-val is deprecated.  Use prx_simulation-msg:plant_paths instead.")
  (plant_paths m))

(cl:ensure-generic-function 'node_name-val :lambda-list '(m))
(cl:defmethod node_name-val ((m <plant_locations_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:node_name-val is deprecated.  Use prx_simulation-msg:node_name instead.")
  (node_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plant_locations_msg>) ostream)
  "Serializes a message object of type '<plant_locations_msg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plant_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'plant_states))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plant_locations_msg>) istream)
  "Deserializes a message object of type '<plant_locations_msg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plant_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plant_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:state_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plant_locations_msg>)))
  "Returns string type for a message object of type '<plant_locations_msg>"
  "prx_simulation/plant_locations_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plant_locations_msg)))
  "Returns string type for a message object of type 'plant_locations_msg"
  "prx_simulation/plant_locations_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plant_locations_msg>)))
  "Returns md5sum for a message object of type '<plant_locations_msg>"
  "ecf23f5bb28cd312a2dba6ce7fc3b0ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plant_locations_msg)))
  "Returns md5sum for a message object of type 'plant_locations_msg"
  "ecf23f5bb28cd312a2dba6ce7fc3b0ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plant_locations_msg>)))
  "Returns full string definition for message of type '<plant_locations_msg>"
  (cl:format cl:nil "state_msg[] plant_states~%string[] plant_paths~%string node_name~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plant_locations_msg)))
  "Returns full string definition for message of type 'plant_locations_msg"
  (cl:format cl:nil "state_msg[] plant_states~%string[] plant_paths~%string node_name~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plant_locations_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plant_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plant_paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:length (cl:slot-value msg 'node_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plant_locations_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'plant_locations_msg
    (cl:cons ':plant_states (plant_states msg))
    (cl:cons ':plant_paths (plant_paths msg))
    (cl:cons ':node_name (node_name msg))
))
