; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude query_msg.msg.html

(cl:defclass <query_msg> (roslisp-msg-protocol:ros-message)
  ((consumer
    :reader consumer
    :initarg :consumer
    :type cl:string
    :initform "")
   (start
    :reader start
    :initarg :start
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (goal
    :reader goal
    :initarg :goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (goal_region_radius
    :reader goal_region_radius
    :initarg :goal_region_radius
    :type cl:float
    :initform 0.0)
   (smooth_plan
    :reader smooth_plan
    :initarg :smooth_plan
    :type cl:boolean
    :initform cl:nil)
   (set_goal_criterion
    :reader set_goal_criterion
    :initarg :set_goal_criterion
    :type cl:boolean
    :initform cl:nil)
   (plant_locations
    :reader plant_locations
    :initarg :plant_locations
    :type prx_simulation-msg:plant_locations_msg
    :initform (cl:make-instance 'prx_simulation-msg:plant_locations_msg)))
)

(cl:defclass query_msg (<query_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <query_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'query_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<query_msg> is deprecated: use prx_simulation-msg:query_msg instead.")))

(cl:ensure-generic-function 'consumer-val :lambda-list '(m))
(cl:defmethod consumer-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:consumer-val is deprecated.  Use prx_simulation-msg:consumer instead.")
  (consumer m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:start-val is deprecated.  Use prx_simulation-msg:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:goal-val is deprecated.  Use prx_simulation-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'goal_region_radius-val :lambda-list '(m))
(cl:defmethod goal_region_radius-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:goal_region_radius-val is deprecated.  Use prx_simulation-msg:goal_region_radius instead.")
  (goal_region_radius m))

(cl:ensure-generic-function 'smooth_plan-val :lambda-list '(m))
(cl:defmethod smooth_plan-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:smooth_plan-val is deprecated.  Use prx_simulation-msg:smooth_plan instead.")
  (smooth_plan m))

(cl:ensure-generic-function 'set_goal_criterion-val :lambda-list '(m))
(cl:defmethod set_goal_criterion-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:set_goal_criterion-val is deprecated.  Use prx_simulation-msg:set_goal_criterion instead.")
  (set_goal_criterion m))

(cl:ensure-generic-function 'plant_locations-val :lambda-list '(m))
(cl:defmethod plant_locations-val ((m <query_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:plant_locations-val is deprecated.  Use prx_simulation-msg:plant_locations instead.")
  (plant_locations m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <query_msg>) ostream)
  "Serializes a message object of type '<query_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'consumer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'consumer))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'start))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'start))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'goal))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'goal_region_radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'smooth_plan) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'set_goal_criterion) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'plant_locations) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <query_msg>) istream)
  "Deserializes a message object of type '<query_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'consumer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'consumer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'start) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'start)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'goal_region_radius) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'smooth_plan) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'set_goal_criterion) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'plant_locations) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<query_msg>)))
  "Returns string type for a message object of type '<query_msg>"
  "prx_simulation/query_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'query_msg)))
  "Returns string type for a message object of type 'query_msg"
  "prx_simulation/query_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<query_msg>)))
  "Returns md5sum for a message object of type '<query_msg>"
  "fb31a10de45da54e6e1d08424cc04ea2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'query_msg)))
  "Returns md5sum for a message object of type 'query_msg"
  "fb31a10de45da54e6e1d08424cc04ea2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<query_msg>)))
  "Returns full string definition for message of type '<query_msg>"
  (cl:format cl:nil "string consumer~%float64[] start~%float64[] goal~%float64 goal_region_radius~%bool smooth_plan~%bool set_goal_criterion~%plant_locations_msg plant_locations~%================================================================================~%MSG: prx_simulation/plant_locations_msg~%state_msg[] plant_states~%string[] plant_paths~%string node_name~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'query_msg)))
  "Returns full string definition for message of type 'query_msg"
  (cl:format cl:nil "string consumer~%float64[] start~%float64[] goal~%float64 goal_region_radius~%bool smooth_plan~%bool set_goal_criterion~%plant_locations_msg plant_locations~%================================================================================~%MSG: prx_simulation/plant_locations_msg~%state_msg[] plant_states~%string[] plant_paths~%string node_name~%================================================================================~%MSG: prx_simulation/state_msg~%float64[] elements~%string node_name~%string consumer_name~%float64 timestamp~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <query_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'consumer))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'start) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'plant_locations))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <query_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'query_msg
    (cl:cons ':consumer (consumer msg))
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':goal_region_radius (goal_region_radius msg))
    (cl:cons ':smooth_plan (smooth_plan msg))
    (cl:cons ':set_goal_criterion (set_goal_criterion msg))
    (cl:cons ':plant_locations (plant_locations msg))
))
