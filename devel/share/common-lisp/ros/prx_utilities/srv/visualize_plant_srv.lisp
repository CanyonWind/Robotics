; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude visualize_plant_srv-request.msg.html

(cl:defclass <visualize_plant_srv-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type cl:string
    :initform "")
   (flag
    :reader flag
    :initarg :flag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass visualize_plant_srv-request (<visualize_plant_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_plant_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_plant_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_plant_srv-request> is deprecated: use prx_utilities-srv:visualize_plant_srv-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <visualize_plant_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:path-val is deprecated.  Use prx_utilities-srv:path instead.")
  (path m))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <visualize_plant_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:flag-val is deprecated.  Use prx_utilities-srv:flag instead.")
  (flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_plant_srv-request>) ostream)
  "Serializes a message object of type '<visualize_plant_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path))
  (cl:let* ((signed (cl:slot-value msg 'flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_plant_srv-request>) istream)
  "Deserializes a message object of type '<visualize_plant_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flag) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_plant_srv-request>)))
  "Returns string type for a service object of type '<visualize_plant_srv-request>"
  "prx_utilities/visualize_plant_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_plant_srv-request)))
  "Returns string type for a service object of type 'visualize_plant_srv-request"
  "prx_utilities/visualize_plant_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_plant_srv-request>)))
  "Returns md5sum for a message object of type '<visualize_plant_srv-request>"
  "32452e89350b0fbc1c1de51eda1e9deb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_plant_srv-request)))
  "Returns md5sum for a message object of type 'visualize_plant_srv-request"
  "32452e89350b0fbc1c1de51eda1e9deb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_plant_srv-request>)))
  "Returns full string definition for message of type '<visualize_plant_srv-request>"
  (cl:format cl:nil "string path~%int16 flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_plant_srv-request)))
  "Returns full string definition for message of type 'visualize_plant_srv-request"
  (cl:format cl:nil "string path~%int16 flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_plant_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_plant_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_plant_srv-request
    (cl:cons ':path (path msg))
    (cl:cons ':flag (flag msg))
))
;//! \htmlinclude visualize_plant_srv-response.msg.html

(cl:defclass <visualize_plant_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass visualize_plant_srv-response (<visualize_plant_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <visualize_plant_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'visualize_plant_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<visualize_plant_srv-response> is deprecated: use prx_utilities-srv:visualize_plant_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <visualize_plant_srv-response>) ostream)
  "Serializes a message object of type '<visualize_plant_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <visualize_plant_srv-response>) istream)
  "Deserializes a message object of type '<visualize_plant_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<visualize_plant_srv-response>)))
  "Returns string type for a service object of type '<visualize_plant_srv-response>"
  "prx_utilities/visualize_plant_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_plant_srv-response)))
  "Returns string type for a service object of type 'visualize_plant_srv-response"
  "prx_utilities/visualize_plant_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<visualize_plant_srv-response>)))
  "Returns md5sum for a message object of type '<visualize_plant_srv-response>"
  "32452e89350b0fbc1c1de51eda1e9deb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'visualize_plant_srv-response)))
  "Returns md5sum for a message object of type 'visualize_plant_srv-response"
  "32452e89350b0fbc1c1de51eda1e9deb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<visualize_plant_srv-response>)))
  "Returns full string definition for message of type '<visualize_plant_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'visualize_plant_srv-response)))
  "Returns full string definition for message of type 'visualize_plant_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <visualize_plant_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <visualize_plant_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'visualize_plant_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'visualize_plant_srv)))
  'visualize_plant_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'visualize_plant_srv)))
  'visualize_plant_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'visualize_plant_srv)))
  "Returns string type for a service object of type '<visualize_plant_srv>"
  "prx_utilities/visualize_plant_srv")