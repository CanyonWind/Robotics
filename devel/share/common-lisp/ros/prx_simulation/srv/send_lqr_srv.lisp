; Auto-generated. Do not edit!


(cl:in-package prx_simulation-srv)


;//! \htmlinclude send_lqr_srv-request.msg.html

(cl:defclass <send_lqr_srv-request> (roslisp-msg-protocol:ros-message)
  ((all_lqrs
    :reader all_lqrs
    :initarg :all_lqrs
    :type (cl:vector prx_simulation-msg:lqr_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:lqr_msg :initial-element (cl:make-instance 'prx_simulation-msg:lqr_msg)))
   (system_name
    :reader system_name
    :initarg :system_name
    :type cl:string
    :initform ""))
)

(cl:defclass send_lqr_srv-request (<send_lqr_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <send_lqr_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'send_lqr_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<send_lqr_srv-request> is deprecated: use prx_simulation-srv:send_lqr_srv-request instead.")))

(cl:ensure-generic-function 'all_lqrs-val :lambda-list '(m))
(cl:defmethod all_lqrs-val ((m <send_lqr_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:all_lqrs-val is deprecated.  Use prx_simulation-srv:all_lqrs instead.")
  (all_lqrs m))

(cl:ensure-generic-function 'system_name-val :lambda-list '(m))
(cl:defmethod system_name-val ((m <send_lqr_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:system_name-val is deprecated.  Use prx_simulation-srv:system_name instead.")
  (system_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <send_lqr_srv-request>) ostream)
  "Serializes a message object of type '<send_lqr_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'all_lqrs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'all_lqrs))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'system_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'system_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <send_lqr_srv-request>) istream)
  "Deserializes a message object of type '<send_lqr_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'all_lqrs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'all_lqrs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:lqr_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<send_lqr_srv-request>)))
  "Returns string type for a service object of type '<send_lqr_srv-request>"
  "prx_simulation/send_lqr_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_lqr_srv-request)))
  "Returns string type for a service object of type 'send_lqr_srv-request"
  "prx_simulation/send_lqr_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<send_lqr_srv-request>)))
  "Returns md5sum for a message object of type '<send_lqr_srv-request>"
  "f3975634644201b15c64815224657220")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'send_lqr_srv-request)))
  "Returns md5sum for a message object of type 'send_lqr_srv-request"
  "f3975634644201b15c64815224657220")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<send_lqr_srv-request>)))
  "Returns full string definition for message of type '<send_lqr_srv-request>"
  (cl:format cl:nil "prx_simulation/lqr_msg[] all_lqrs~%string system_name~%~%================================================================================~%MSG: prx_simulation/lqr_msg~%float64[] gain_matrix~%float64[] center~%float64[] control~%float64[] cost~%float64 radius~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'send_lqr_srv-request)))
  "Returns full string definition for message of type 'send_lqr_srv-request"
  (cl:format cl:nil "prx_simulation/lqr_msg[] all_lqrs~%string system_name~%~%================================================================================~%MSG: prx_simulation/lqr_msg~%float64[] gain_matrix~%float64[] center~%float64[] control~%float64[] cost~%float64 radius~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <send_lqr_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'all_lqrs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'system_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <send_lqr_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'send_lqr_srv-request
    (cl:cons ':all_lqrs (all_lqrs msg))
    (cl:cons ':system_name (system_name msg))
))
;//! \htmlinclude send_lqr_srv-response.msg.html

(cl:defclass <send_lqr_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass send_lqr_srv-response (<send_lqr_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <send_lqr_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'send_lqr_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<send_lqr_srv-response> is deprecated: use prx_simulation-srv:send_lqr_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <send_lqr_srv-response>) ostream)
  "Serializes a message object of type '<send_lqr_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <send_lqr_srv-response>) istream)
  "Deserializes a message object of type '<send_lqr_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<send_lqr_srv-response>)))
  "Returns string type for a service object of type '<send_lqr_srv-response>"
  "prx_simulation/send_lqr_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_lqr_srv-response)))
  "Returns string type for a service object of type 'send_lqr_srv-response"
  "prx_simulation/send_lqr_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<send_lqr_srv-response>)))
  "Returns md5sum for a message object of type '<send_lqr_srv-response>"
  "f3975634644201b15c64815224657220")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'send_lqr_srv-response)))
  "Returns md5sum for a message object of type 'send_lqr_srv-response"
  "f3975634644201b15c64815224657220")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<send_lqr_srv-response>)))
  "Returns full string definition for message of type '<send_lqr_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'send_lqr_srv-response)))
  "Returns full string definition for message of type 'send_lqr_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <send_lqr_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <send_lqr_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'send_lqr_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'send_lqr_srv)))
  'send_lqr_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'send_lqr_srv)))
  'send_lqr_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_lqr_srv)))
  "Returns string type for a service object of type '<send_lqr_srv>"
  "prx_simulation/send_lqr_srv")