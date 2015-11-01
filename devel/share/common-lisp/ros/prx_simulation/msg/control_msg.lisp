; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude control_msg.msg.html

(cl:defclass <control_msg> (roslisp-msg-protocol:ros-message)
  ((control
    :reader control
    :initarg :control
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0))
)

(cl:defclass control_msg (<control_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <control_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'control_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<control_msg> is deprecated: use prx_simulation-msg:control_msg instead.")))

(cl:ensure-generic-function 'control-val :lambda-list '(m))
(cl:defmethod control-val ((m <control_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:control-val is deprecated.  Use prx_simulation-msg:control instead.")
  (control m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <control_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:duration-val is deprecated.  Use prx_simulation-msg:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <control_msg>) ostream)
  "Serializes a message object of type '<control_msg>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'control))))
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
   (cl:slot-value msg 'control))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <control_msg>) istream)
  "Deserializes a message object of type '<control_msg>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'control) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'control)))
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
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<control_msg>)))
  "Returns string type for a message object of type '<control_msg>"
  "prx_simulation/control_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'control_msg)))
  "Returns string type for a message object of type 'control_msg"
  "prx_simulation/control_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<control_msg>)))
  "Returns md5sum for a message object of type '<control_msg>"
  "3c57b554b9870eeadc85065bffba6021")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'control_msg)))
  "Returns md5sum for a message object of type 'control_msg"
  "3c57b554b9870eeadc85065bffba6021")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<control_msg>)))
  "Returns full string definition for message of type '<control_msg>"
  (cl:format cl:nil "float64[] control~%float64 duration~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'control_msg)))
  "Returns full string definition for message of type 'control_msg"
  (cl:format cl:nil "float64[] control~%float64 duration~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <control_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'control) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <control_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'control_msg
    (cl:cons ':control (control msg))
    (cl:cons ':duration (duration msg))
))
