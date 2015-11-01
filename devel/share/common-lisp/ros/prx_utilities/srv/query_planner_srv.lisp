; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude query_planner_srv-request.msg.html

(cl:defclass <query_planner_srv-request> (roslisp-msg-protocol:ros-message)
  ((planned_system
    :reader planned_system
    :initarg :planned_system
    :type cl:string
    :initform "")
   (goal_state
    :reader goal_state
    :initarg :goal_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (start_state
    :reader start_state
    :initarg :start_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (smooth
    :reader smooth
    :initarg :smooth
    :type cl:boolean
    :initform cl:nil)
   (time_limit
    :reader time_limit
    :initarg :time_limit
    :type cl:float
    :initform 0.0))
)

(cl:defclass query_planner_srv-request (<query_planner_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <query_planner_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'query_planner_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<query_planner_srv-request> is deprecated: use prx_utilities-srv:query_planner_srv-request instead.")))

(cl:ensure-generic-function 'planned_system-val :lambda-list '(m))
(cl:defmethod planned_system-val ((m <query_planner_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:planned_system-val is deprecated.  Use prx_utilities-srv:planned_system instead.")
  (planned_system m))

(cl:ensure-generic-function 'goal_state-val :lambda-list '(m))
(cl:defmethod goal_state-val ((m <query_planner_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:goal_state-val is deprecated.  Use prx_utilities-srv:goal_state instead.")
  (goal_state m))

(cl:ensure-generic-function 'start_state-val :lambda-list '(m))
(cl:defmethod start_state-val ((m <query_planner_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:start_state-val is deprecated.  Use prx_utilities-srv:start_state instead.")
  (start_state m))

(cl:ensure-generic-function 'smooth-val :lambda-list '(m))
(cl:defmethod smooth-val ((m <query_planner_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:smooth-val is deprecated.  Use prx_utilities-srv:smooth instead.")
  (smooth m))

(cl:ensure-generic-function 'time_limit-val :lambda-list '(m))
(cl:defmethod time_limit-val ((m <query_planner_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:time_limit-val is deprecated.  Use prx_utilities-srv:time_limit instead.")
  (time_limit m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <query_planner_srv-request>) ostream)
  "Serializes a message object of type '<query_planner_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'planned_system))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'planned_system))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal_state))))
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
   (cl:slot-value msg 'goal_state))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'start_state))))
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
   (cl:slot-value msg 'start_state))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'smooth) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time_limit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <query_planner_srv-request>) istream)
  "Deserializes a message object of type '<query_planner_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planned_system) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'planned_system) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal_state)))
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
  (cl:setf (cl:slot-value msg 'start_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'start_state)))
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
    (cl:setf (cl:slot-value msg 'smooth) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time_limit) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<query_planner_srv-request>)))
  "Returns string type for a service object of type '<query_planner_srv-request>"
  "prx_utilities/query_planner_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'query_planner_srv-request)))
  "Returns string type for a service object of type 'query_planner_srv-request"
  "prx_utilities/query_planner_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<query_planner_srv-request>)))
  "Returns md5sum for a message object of type '<query_planner_srv-request>"
  "2b33061955e07f2075794f74beed8286")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'query_planner_srv-request)))
  "Returns md5sum for a message object of type 'query_planner_srv-request"
  "2b33061955e07f2075794f74beed8286")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<query_planner_srv-request>)))
  "Returns full string definition for message of type '<query_planner_srv-request>"
  (cl:format cl:nil "string planned_system~%float64[] goal_state~%float64[] start_state~%bool smooth~%float64 time_limit~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'query_planner_srv-request)))
  "Returns full string definition for message of type 'query_planner_srv-request"
  (cl:format cl:nil "string planned_system~%float64[] goal_state~%float64[] start_state~%bool smooth~%float64 time_limit~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <query_planner_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'planned_system))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'start_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <query_planner_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'query_planner_srv-request
    (cl:cons ':planned_system (planned_system msg))
    (cl:cons ':goal_state (goal_state msg))
    (cl:cons ':start_state (start_state msg))
    (cl:cons ':smooth (smooth msg))
    (cl:cons ':time_limit (time_limit msg))
))
;//! \htmlinclude query_planner_srv-response.msg.html

(cl:defclass <query_planner_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass query_planner_srv-response (<query_planner_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <query_planner_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'query_planner_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<query_planner_srv-response> is deprecated: use prx_utilities-srv:query_planner_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <query_planner_srv-response>) ostream)
  "Serializes a message object of type '<query_planner_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <query_planner_srv-response>) istream)
  "Deserializes a message object of type '<query_planner_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<query_planner_srv-response>)))
  "Returns string type for a service object of type '<query_planner_srv-response>"
  "prx_utilities/query_planner_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'query_planner_srv-response)))
  "Returns string type for a service object of type 'query_planner_srv-response"
  "prx_utilities/query_planner_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<query_planner_srv-response>)))
  "Returns md5sum for a message object of type '<query_planner_srv-response>"
  "2b33061955e07f2075794f74beed8286")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'query_planner_srv-response)))
  "Returns md5sum for a message object of type 'query_planner_srv-response"
  "2b33061955e07f2075794f74beed8286")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<query_planner_srv-response>)))
  "Returns full string definition for message of type '<query_planner_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'query_planner_srv-response)))
  "Returns full string definition for message of type 'query_planner_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <query_planner_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <query_planner_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'query_planner_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'query_planner_srv)))
  'query_planner_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'query_planner_srv)))
  'query_planner_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'query_planner_srv)))
  "Returns string type for a service object of type '<query_planner_srv>"
  "prx_utilities/query_planner_srv")