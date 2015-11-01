; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude visualize_obstacles_srv-request.msg.html

(cl:defclass <visualize_obstacles_srv-request> (roslisp-msg-protocol:ros-message)
  ((obstacles_path
    :reader obstacles_path
    :initarg :obstacles_path
    :type cl:string
    :initform ""))
)

(cl:defclass visualize_obstacles_srv-request (<visualize_obstacles_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_obstacles_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_obstacles_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_obstacles_srv-request> is deprecated: use prx_utilities-srv:visualize_obstacles_srv-request instead.")))

(cl:ensure-generic-function 'obstacles_path-val :lambda-list '(m))
(cl:defmethod obstacles_path-val ((m <visualize_obstacles_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:obstacles_path-val is deprecated.  Use prx_utilities-srv:obstacles_path instead.")
  (obstacles_path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_obstacles_srv-request>) ostream)
  "Serializes a message object of type '<visualize_obstacles_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'obstacles_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'obstacles_path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_obstacles_srv-request>) istream)
  "Deserializes a message object of type '<visualize_obstacles_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obstacles_path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'obstacles_path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_obstacles_srv-request>)))
  "Returns string type for a service object of type '<visualize_obstacles_srv-request>"
  "prx_utilities/visualize_obstacles_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_obstacles_srv-request)))
  "Returns string type for a service object of type 'visualize_obstacles_srv-request"
  "prx_utilities/visualize_obstacles_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_obstacles_srv-request>)))
  "Returns md5sum for a message object of type '<visualize_obstacles_srv-request>"
  "9981a66aae205a31636ef37b6da7095e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_obstacles_srv-request)))
  "Returns md5sum for a message object of type 'visualize_obstacles_srv-request"
  "9981a66aae205a31636ef37b6da7095e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_obstacles_srv-request>)))
  "Returns full string definition for message of type '<visualize_obstacles_srv-request>"
  (cl:format cl:nil "string obstacles_path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_obstacles_srv-request)))
  "Returns full string definition for message of type 'visualize_obstacles_srv-request"
  (cl:format cl:nil "string obstacles_path~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_obstacles_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'obstacles_path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_obstacles_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_obstacles_srv-request
    (cl:cons ':obstacles_path (obstacles_path msg))
))
;//! \htmlinclude visualize_obstacles_srv-response.msg.html

(cl:defclass <visualize_obstacles_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass visualize_obstacles_srv-response (<visualize_obstacles_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_obstacles_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_obstacles_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_obstacles_srv-response> is deprecated: use prx_utilities-srv:visualize_obstacles_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_obstacles_srv-response>) ostream)
  "Serializes a message object of type '<visualize_obstacles_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_obstacles_srv-response>) istream)
  "Deserializes a message object of type '<visualize_obstacles_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_obstacles_srv-response>)))
  "Returns string type for a service object of type '<visualize_obstacles_srv-response>"
  "prx_utilities/visualize_obstacles_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_obstacles_srv-response)))
  "Returns string type for a service object of type 'visualize_obstacles_srv-response"
  "prx_utilities/visualize_obstacles_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_obstacles_srv-response>)))
  "Returns md5sum for a message object of type '<visualize_obstacles_srv-response>"
  "9981a66aae205a31636ef37b6da7095e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_obstacles_srv-response)))
  "Returns md5sum for a message object of type 'visualize_obstacles_srv-response"
  "9981a66aae205a31636ef37b6da7095e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_obstacles_srv-response>)))
  "Returns full string definition for message of type '<visualize_obstacles_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_obstacles_srv-response)))
  "Returns full string definition for message of type 'visualize_obstacles_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_obstacles_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_obstacles_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_obstacles_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'visualize_obstacles_srv)))
  'visualize_obstacles_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'visualize_obstacles_srv)))
  'visualize_obstacles_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_obstacles_srv)))
  "Returns string type for a service object of type '<visualize_obstacles_srv>"
  "prx_utilities/visualize_obstacles_srv")