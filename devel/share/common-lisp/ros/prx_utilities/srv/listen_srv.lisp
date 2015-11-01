; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude listen_srv-request.msg.html

(cl:defclass <listen_srv-request> (roslisp-msg-protocol:ros-message)
  ((topic
    :reader topic
    :initarg :topic
    :type cl:string
    :initform ""))
)

(cl:defclass listen_srv-request (<listen_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <listen_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'listen_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<listen_srv-request> is deprecated: use prx_utilities-srv:listen_srv-request instead.")))

(cl:ensure-generic-function 'topic-val :lambda-list '(m))
(cl:defmethod topic-val ((m <listen_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:topic-val is deprecated.  Use prx_utilities-srv:topic instead.")
  (topic m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <listen_srv-request>) ostream)
  "Serializes a message object of type '<listen_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topic))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topic))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <listen_srv-request>) istream)
  "Deserializes a message object of type '<listen_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topic) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topic) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<listen_srv-request>)))
  "Returns string type for a service object of type '<listen_srv-request>"
  "prx_utilities/listen_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'listen_srv-request)))
  "Returns string type for a service object of type 'listen_srv-request"
  "prx_utilities/listen_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<listen_srv-request>)))
  "Returns md5sum for a message object of type '<listen_srv-request>"
  "d8f94bae31b356b24d0427f80426d0c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'listen_srv-request)))
  "Returns md5sum for a message object of type 'listen_srv-request"
  "d8f94bae31b356b24d0427f80426d0c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<listen_srv-request>)))
  "Returns full string definition for message of type '<listen_srv-request>"
  (cl:format cl:nil "~%string topic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'listen_srv-request)))
  "Returns full string definition for message of type 'listen_srv-request"
  (cl:format cl:nil "~%string topic~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <listen_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topic))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <listen_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'listen_srv-request
    (cl:cons ':topic (topic msg))
))
;//! \htmlinclude listen_srv-response.msg.html

(cl:defclass <listen_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass listen_srv-response (<listen_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <listen_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'listen_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<listen_srv-response> is deprecated: use prx_utilities-srv:listen_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <listen_srv-response>) ostream)
  "Serializes a message object of type '<listen_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <listen_srv-response>) istream)
  "Deserializes a message object of type '<listen_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<listen_srv-response>)))
  "Returns string type for a service object of type '<listen_srv-response>"
  "prx_utilities/listen_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'listen_srv-response)))
  "Returns string type for a service object of type 'listen_srv-response"
  "prx_utilities/listen_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<listen_srv-response>)))
  "Returns md5sum for a message object of type '<listen_srv-response>"
  "d8f94bae31b356b24d0427f80426d0c3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'listen_srv-response)))
  "Returns md5sum for a message object of type 'listen_srv-response"
  "d8f94bae31b356b24d0427f80426d0c3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<listen_srv-response>)))
  "Returns full string definition for message of type '<listen_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'listen_srv-response)))
  "Returns full string definition for message of type 'listen_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <listen_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <listen_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'listen_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'listen_srv)))
  'listen_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'listen_srv)))
  'listen_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'listen_srv)))
  "Returns string type for a service object of type '<listen_srv>"
  "prx_utilities/listen_srv")