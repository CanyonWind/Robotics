; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude remove_plant_srv-request.msg.html

(cl:defclass <remove_plant_srv-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform ""))
)

(cl:defclass remove_plant_srv-request (<remove_plant_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <remove_plant_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'remove_plant_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<remove_plant_srv-request> is deprecated: use prx_utilities-srv:remove_plant_srv-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <remove_plant_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:path-val is deprecated.  Use prx_utilities-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <remove_plant_srv-request>) ostream)
  "Serializes a message object of type '<remove_plant_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <remove_plant_srv-request>) istream)
  "Deserializes a message object of type '<remove_plant_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<remove_plant_srv-request>)))
  "Returns string type for a service object of type '<remove_plant_srv-request>"
  "prx_utilities/remove_plant_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'remove_plant_srv-request)))
  "Returns string type for a service object of type 'remove_plant_srv-request"
  "prx_utilities/remove_plant_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<remove_plant_srv-request>)))
  "Returns md5sum for a message object of type '<remove_plant_srv-request>"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'remove_plant_srv-request)))
  "Returns md5sum for a message object of type 'remove_plant_srv-request"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<remove_plant_srv-request>)))
  "Returns full string definition for message of type '<remove_plant_srv-request>"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'remove_plant_srv-request)))
  "Returns full string definition for message of type 'remove_plant_srv-request"
  (cl:format cl:nil "string path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <remove_plant_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <remove_plant_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'remove_plant_srv-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude remove_plant_srv-response.msg.html

(cl:defclass <remove_plant_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass remove_plant_srv-response (<remove_plant_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <remove_plant_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'remove_plant_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<remove_plant_srv-response> is deprecated: use prx_utilities-srv:remove_plant_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <remove_plant_srv-response>) ostream)
  "Serializes a message object of type '<remove_plant_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <remove_plant_srv-response>) istream)
  "Deserializes a message object of type '<remove_plant_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<remove_plant_srv-response>)))
  "Returns string type for a service object of type '<remove_plant_srv-response>"
  "prx_utilities/remove_plant_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'remove_plant_srv-response)))
  "Returns string type for a service object of type 'remove_plant_srv-response"
  "prx_utilities/remove_plant_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<remove_plant_srv-response>)))
  "Returns md5sum for a message object of type '<remove_plant_srv-response>"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'remove_plant_srv-response)))
  "Returns md5sum for a message object of type 'remove_plant_srv-response"
  "1d00cd540af97efeb6b1589112fab63e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<remove_plant_srv-response>)))
  "Returns full string definition for message of type '<remove_plant_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'remove_plant_srv-response)))
  "Returns full string definition for message of type 'remove_plant_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <remove_plant_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <remove_plant_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'remove_plant_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'remove_plant_srv)))
  'remove_plant_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'remove_plant_srv)))
  'remove_plant_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'remove_plant_srv)))
  "Returns string type for a service object of type '<remove_plant_srv>"
  "prx_utilities/remove_plant_srv")