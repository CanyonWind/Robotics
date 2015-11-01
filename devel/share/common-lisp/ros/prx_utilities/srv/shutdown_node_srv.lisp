; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude shutdown_node_srv-request.msg.html

(cl:defclass <shutdown_node_srv-request> (roslisp-msg-protocol:ros-message)
  ((destination_node_name
    :reader destination_node_name
    :initarg :destination_node_name
    :type cl:string
    :initform "")
   (source_node_name
    :reader source_node_name
    :initarg :source_node_name
    :type cl:string
    :initform ""))
)

(cl:defclass shutdown_node_srv-request (<shutdown_node_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <shutdown_node_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'shutdown_node_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<shutdown_node_srv-request> is deprecated: use prx_utilities-srv:shutdown_node_srv-request instead.")))

(cl:ensure-generic-function 'destination_node_name-val :lambda-list '(m))
(cl:defmethod destination_node_name-val ((m <shutdown_node_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:destination_node_name-val is deprecated.  Use prx_utilities-srv:destination_node_name instead.")
  (destination_node_name m))

(cl:ensure-generic-function 'source_node_name-val :lambda-list '(m))
(cl:defmethod source_node_name-val ((m <shutdown_node_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:source_node_name-val is deprecated.  Use prx_utilities-srv:source_node_name instead.")
  (source_node_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <shutdown_node_srv-request>) ostream)
  "Serializes a message object of type '<shutdown_node_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'destination_node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'destination_node_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source_node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source_node_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <shutdown_node_srv-request>) istream)
  "Deserializes a message object of type '<shutdown_node_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'destination_node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'destination_node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source_node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'source_node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<shutdown_node_srv-request>)))
  "Returns string type for a service object of type '<shutdown_node_srv-request>"
  "prx_utilities/shutdown_node_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'shutdown_node_srv-request)))
  "Returns string type for a service object of type 'shutdown_node_srv-request"
  "prx_utilities/shutdown_node_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<shutdown_node_srv-request>)))
  "Returns md5sum for a message object of type '<shutdown_node_srv-request>"
  "6b261e5b15df599b49cbecb3c73fa812")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'shutdown_node_srv-request)))
  "Returns md5sum for a message object of type 'shutdown_node_srv-request"
  "6b261e5b15df599b49cbecb3c73fa812")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<shutdown_node_srv-request>)))
  "Returns full string definition for message of type '<shutdown_node_srv-request>"
  (cl:format cl:nil "string destination_node_name~%string source_node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'shutdown_node_srv-request)))
  "Returns full string definition for message of type 'shutdown_node_srv-request"
  (cl:format cl:nil "string destination_node_name~%string source_node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <shutdown_node_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'destination_node_name))
     4 (cl:length (cl:slot-value msg 'source_node_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <shutdown_node_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'shutdown_node_srv-request
    (cl:cons ':destination_node_name (destination_node_name msg))
    (cl:cons ':source_node_name (source_node_name msg))
))
;//! \htmlinclude shutdown_node_srv-response.msg.html

(cl:defclass <shutdown_node_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass shutdown_node_srv-response (<shutdown_node_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <shutdown_node_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'shutdown_node_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<shutdown_node_srv-response> is deprecated: use prx_utilities-srv:shutdown_node_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <shutdown_node_srv-response>) ostream)
  "Serializes a message object of type '<shutdown_node_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <shutdown_node_srv-response>) istream)
  "Deserializes a message object of type '<shutdown_node_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<shutdown_node_srv-response>)))
  "Returns string type for a service object of type '<shutdown_node_srv-response>"
  "prx_utilities/shutdown_node_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'shutdown_node_srv-response)))
  "Returns string type for a service object of type 'shutdown_node_srv-response"
  "prx_utilities/shutdown_node_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<shutdown_node_srv-response>)))
  "Returns md5sum for a message object of type '<shutdown_node_srv-response>"
  "6b261e5b15df599b49cbecb3c73fa812")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'shutdown_node_srv-response)))
  "Returns md5sum for a message object of type 'shutdown_node_srv-response"
  "6b261e5b15df599b49cbecb3c73fa812")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<shutdown_node_srv-response>)))
  "Returns full string definition for message of type '<shutdown_node_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'shutdown_node_srv-response)))
  "Returns full string definition for message of type 'shutdown_node_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <shutdown_node_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <shutdown_node_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'shutdown_node_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'shutdown_node_srv)))
  'shutdown_node_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'shutdown_node_srv)))
  'shutdown_node_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'shutdown_node_srv)))
  "Returns string type for a service object of type '<shutdown_node_srv>"
  "prx_utilities/shutdown_node_srv")