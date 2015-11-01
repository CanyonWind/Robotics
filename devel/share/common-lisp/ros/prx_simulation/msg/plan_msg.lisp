; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude plan_msg.msg.html

(cl:defclass <plan_msg> (roslisp-msg-protocol:ros-message)
  ((plan
    :reader plan
    :initarg :plan
    :type (cl:vector prx_simulation-msg:control_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:control_msg :initial-element (cl:make-instance 'prx_simulation-msg:control_msg)))
   (end_state
    :reader end_state
    :initarg :end_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (system_name
    :reader system_name
    :initarg :system_name
    :type cl:string
    :initform ""))
)

(cl:defclass plan_msg (<plan_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <plan_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'plan_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<plan_msg> is deprecated: use prx_simulation-msg:plan_msg instead.")))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <plan_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:plan-val is deprecated.  Use prx_simulation-msg:plan instead.")
  (plan m))

(cl:ensure-generic-function 'end_state-val :lambda-list '(m))
(cl:defmethod end_state-val ((m <plan_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:end_state-val is deprecated.  Use prx_simulation-msg:end_state instead.")
  (end_state m))

(cl:ensure-generic-function 'system_name-val :lambda-list '(m))
(cl:defmethod system_name-val ((m <plan_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:system_name-val is deprecated.  Use prx_simulation-msg:system_name instead.")
  (system_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <plan_msg>) ostream)
  "Serializes a message object of type '<plan_msg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'plan))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'end_state))))
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
   (cl:slot-value msg 'end_state))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'system_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'system_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <plan_msg>) istream)
  "Deserializes a message object of type '<plan_msg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plan) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plan)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:control_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'end_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'end_state)))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'system_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'system_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<plan_msg>)))
  "Returns string type for a message object of type '<plan_msg>"
  "prx_simulation/plan_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'plan_msg)))
  "Returns string type for a message object of type 'plan_msg"
  "prx_simulation/plan_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<plan_msg>)))
  "Returns md5sum for a message object of type '<plan_msg>"
  "c573b368b2e096f9b53f72769f6a278f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'plan_msg)))
  "Returns md5sum for a message object of type 'plan_msg"
  "c573b368b2e096f9b53f72769f6a278f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<plan_msg>)))
  "Returns full string definition for message of type '<plan_msg>"
  (cl:format cl:nil "prx_simulation/control_msg[] plan~%float64[] end_state~%string system_name~%~%================================================================================~%MSG: prx_simulation/control_msg~%float64[] control~%float64 duration~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'plan_msg)))
  "Returns full string definition for message of type 'plan_msg"
  (cl:format cl:nil "prx_simulation/control_msg[] plan~%float64[] end_state~%string system_name~%~%================================================================================~%MSG: prx_simulation/control_msg~%float64[] control~%float64 duration~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <plan_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plan) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'end_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:length (cl:slot-value msg 'system_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <plan_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'plan_msg
    (cl:cons ':plan (plan msg))
    (cl:cons ':end_state (end_state msg))
    (cl:cons ':system_name (system_name msg))
))
