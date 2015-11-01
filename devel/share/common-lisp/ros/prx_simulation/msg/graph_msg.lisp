; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude graph_msg.msg.html

(cl:defclass <graph_msg> (roslisp-msg-protocol:ros-message)
  ((sender_name
    :reader sender_name
    :initarg :sender_name
    :type cl:string
    :initform "")
   (graph_name
    :reader graph_name
    :initarg :graph_name
    :type cl:string
    :initform "")
   (graph
    :reader graph
    :initarg :graph
    :type cl:string
    :initform "")
   (start_time
    :reader start_time
    :initarg :start_time
    :type cl:float
    :initform 0.0)
   (start_msg_time
    :reader start_msg_time
    :initarg :start_msg_time
    :type cl:float
    :initform 0.0)
   (deserialize_time
    :reader deserialize_time
    :initarg :deserialize_time
    :type cl:float
    :initform 0.0)
   (start_send_time
    :reader start_send_time
    :initarg :start_send_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass graph_msg (<graph_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <graph_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'graph_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<graph_msg> is deprecated: use prx_simulation-msg:graph_msg instead.")))

(cl:ensure-generic-function 'sender_name-val :lambda-list '(m))
(cl:defmethod sender_name-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:sender_name-val is deprecated.  Use prx_simulation-msg:sender_name instead.")
  (sender_name m))

(cl:ensure-generic-function 'graph_name-val :lambda-list '(m))
(cl:defmethod graph_name-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:graph_name-val is deprecated.  Use prx_simulation-msg:graph_name instead.")
  (graph_name m))

(cl:ensure-generic-function 'graph-val :lambda-list '(m))
(cl:defmethod graph-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:graph-val is deprecated.  Use prx_simulation-msg:graph instead.")
  (graph m))

(cl:ensure-generic-function 'start_time-val :lambda-list '(m))
(cl:defmethod start_time-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:start_time-val is deprecated.  Use prx_simulation-msg:start_time instead.")
  (start_time m))

(cl:ensure-generic-function 'start_msg_time-val :lambda-list '(m))
(cl:defmethod start_msg_time-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:start_msg_time-val is deprecated.  Use prx_simulation-msg:start_msg_time instead.")
  (start_msg_time m))

(cl:ensure-generic-function 'deserialize_time-val :lambda-list '(m))
(cl:defmethod deserialize_time-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:deserialize_time-val is deprecated.  Use prx_simulation-msg:deserialize_time instead.")
  (deserialize_time m))

(cl:ensure-generic-function 'start_send_time-val :lambda-list '(m))
(cl:defmethod start_send_time-val ((m <graph_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:start_send_time-val is deprecated.  Use prx_simulation-msg:start_send_time instead.")
  (start_send_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <graph_msg>) ostream)
  "Serializes a message object of type '<graph_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sender_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sender_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'graph_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'graph_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'graph))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'graph))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'start_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'start_msg_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'deserialize_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'start_send_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <graph_msg>) istream)
  "Deserializes a message object of type '<graph_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sender_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sender_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'graph_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'graph_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'graph) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'graph) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'start_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'start_msg_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'deserialize_time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'start_send_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<graph_msg>)))
  "Returns string type for a message object of type '<graph_msg>"
  "prx_simulation/graph_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'graph_msg)))
  "Returns string type for a message object of type 'graph_msg"
  "prx_simulation/graph_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<graph_msg>)))
  "Returns md5sum for a message object of type '<graph_msg>"
  "41d3c9e903eaba24a718b1d5cbda5332")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'graph_msg)))
  "Returns md5sum for a message object of type 'graph_msg"
  "41d3c9e903eaba24a718b1d5cbda5332")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<graph_msg>)))
  "Returns full string definition for message of type '<graph_msg>"
  (cl:format cl:nil "string sender_name~%string graph_name~%string graph~%float64 start_time~%float64 start_msg_time~%float64 deserialize_time~%float64 start_send_time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'graph_msg)))
  "Returns full string definition for message of type 'graph_msg"
  (cl:format cl:nil "string sender_name~%string graph_name~%string graph~%float64 start_time~%float64 start_msg_time~%float64 deserialize_time~%float64 start_send_time~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <graph_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sender_name))
     4 (cl:length (cl:slot-value msg 'graph_name))
     4 (cl:length (cl:slot-value msg 'graph))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <graph_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'graph_msg
    (cl:cons ':sender_name (sender_name msg))
    (cl:cons ':graph_name (graph_name msg))
    (cl:cons ':graph (graph msg))
    (cl:cons ':start_time (start_time msg))
    (cl:cons ':start_msg_time (start_msg_time msg))
    (cl:cons ':deserialize_time (deserialize_time msg))
    (cl:cons ':start_send_time (start_send_time msg))
))
