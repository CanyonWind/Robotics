; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude interval_msg.msg.html

(cl:defclass <interval_msg> (roslisp-msg-protocol:ros-message)
  ((lower
    :reader lower
    :initarg :lower
    :type cl:float
    :initform 0.0)
   (upper
    :reader upper
    :initarg :upper
    :type cl:float
    :initform 0.0)
   (pathname
    :reader pathname
    :initarg :pathname
    :type cl:string
    :initform ""))
)

(cl:defclass interval_msg (<interval_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <interval_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'interval_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<interval_msg> is deprecated: use prx_simulation-msg:interval_msg instead.")))

(cl:ensure-generic-function 'lower-val :lambda-list '(m))
(cl:defmethod lower-val ((m <interval_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:lower-val is deprecated.  Use prx_simulation-msg:lower instead.")
  (lower m))

(cl:ensure-generic-function 'upper-val :lambda-list '(m))
(cl:defmethod upper-val ((m <interval_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:upper-val is deprecated.  Use prx_simulation-msg:upper instead.")
  (upper m))

(cl:ensure-generic-function 'pathname-val :lambda-list '(m))
(cl:defmethod pathname-val ((m <interval_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:pathname-val is deprecated.  Use prx_simulation-msg:pathname instead.")
  (pathname m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <interval_msg>) ostream)
  "Serializes a message object of type '<interval_msg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lower))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'upper))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'pathname))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'pathname))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <interval_msg>) istream)
  "Deserializes a message object of type '<interval_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lower) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'upper) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pathname) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'pathname) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<interval_msg>)))
  "Returns string type for a message object of type '<interval_msg>"
  "prx_simulation/interval_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'interval_msg)))
  "Returns string type for a message object of type 'interval_msg"
  "prx_simulation/interval_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<interval_msg>)))
  "Returns md5sum for a message object of type '<interval_msg>"
  "e2d4b99d90c7c074a31d7977d2e3a7f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'interval_msg)))
  "Returns md5sum for a message object of type 'interval_msg"
  "e2d4b99d90c7c074a31d7977d2e3a7f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<interval_msg>)))
  "Returns full string definition for message of type '<interval_msg>"
  (cl:format cl:nil "float64 lower~%float64 upper~%string pathname~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'interval_msg)))
  "Returns full string definition for message of type 'interval_msg"
  (cl:format cl:nil "float64 lower~%float64 upper~%string pathname~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <interval_msg>))
  (cl:+ 0
     8
     8
     4 (cl:length (cl:slot-value msg 'pathname))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <interval_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'interval_msg
    (cl:cons ':lower (lower msg))
    (cl:cons ':upper (upper msg))
    (cl:cons ':pathname (pathname msg))
))
