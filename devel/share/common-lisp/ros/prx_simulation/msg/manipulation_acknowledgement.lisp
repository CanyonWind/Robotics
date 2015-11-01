; Auto-generated. Do not edit!


(cl:in-package prx_simulation-msg)


;//! \htmlinclude manipulation_acknowledgement.msg.html

(cl:defclass <manipulation_acknowledgement> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (done
    :reader done
    :initarg :done
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass manipulation_acknowledgement (<manipulation_acknowledgement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <manipulation_acknowledgement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'manipulation_acknowledgement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-msg:<manipulation_acknowledgement> is deprecated: use prx_simulation-msg:manipulation_acknowledgement instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <manipulation_acknowledgement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:time-val is deprecated.  Use prx_simulation-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'done-val :lambda-list '(m))
(cl:defmethod done-val ((m <manipulation_acknowledgement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-msg:done-val is deprecated.  Use prx_simulation-msg:done instead.")
  (done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <manipulation_acknowledgement>) ostream)
  "Serializes a message object of type '<manipulation_acknowledgement>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'done) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <manipulation_acknowledgement>) istream)
  "Deserializes a message object of type '<manipulation_acknowledgement>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'done) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<manipulation_acknowledgement>)))
  "Returns string type for a message object of type '<manipulation_acknowledgement>"
  "prx_simulation/manipulation_acknowledgement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'manipulation_acknowledgement)))
  "Returns string type for a message object of type 'manipulation_acknowledgement"
  "prx_simulation/manipulation_acknowledgement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<manipulation_acknowledgement>)))
  "Returns md5sum for a message object of type '<manipulation_acknowledgement>"
  "244152839b648407f2c4e9a846036ed5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'manipulation_acknowledgement)))
  "Returns md5sum for a message object of type 'manipulation_acknowledgement"
  "244152839b648407f2c4e9a846036ed5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<manipulation_acknowledgement>)))
  "Returns full string definition for message of type '<manipulation_acknowledgement>"
  (cl:format cl:nil "float64 time~%bool done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'manipulation_acknowledgement)))
  "Returns full string definition for message of type 'manipulation_acknowledgement"
  (cl:format cl:nil "float64 time~%bool done~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <manipulation_acknowledgement>))
  (cl:+ 0
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <manipulation_acknowledgement>))
  "Converts a ROS message object to a list"
  (cl:list 'manipulation_acknowledgement
    (cl:cons ':time (time msg))
    (cl:cons ':done (done msg))
))
