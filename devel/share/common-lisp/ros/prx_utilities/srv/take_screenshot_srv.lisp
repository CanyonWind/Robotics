; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude take_screenshot_srv-request.msg.html

(cl:defclass <take_screenshot_srv-request> (roslisp-msg-protocol:ros-message)
  ((destination_node
    :reader destination_node
    :initarg :destination_node
    :type cl:string
    :initform "")
   (screen_num
    :reader screen_num
    :initarg :screen_num
    :type cl:integer
    :initform 0)
   (number_of_screenshots
    :reader number_of_screenshots
    :initarg :number_of_screenshots
    :type cl:integer
    :initform 0))
)

(cl:defclass take_screenshot_srv-request (<take_screenshot_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <take_screenshot_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'take_screenshot_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<take_screenshot_srv-request> is deprecated: use prx_utilities-srv:take_screenshot_srv-request instead.")))

(cl:ensure-generic-function 'destination_node-val :lambda-list '(m))
(cl:defmethod destination_node-val ((m <take_screenshot_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:destination_node-val is deprecated.  Use prx_utilities-srv:destination_node instead.")
  (destination_node m))

(cl:ensure-generic-function 'screen_num-val :lambda-list '(m))
(cl:defmethod screen_num-val ((m <take_screenshot_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:screen_num-val is deprecated.  Use prx_utilities-srv:screen_num instead.")
  (screen_num m))

(cl:ensure-generic-function 'number_of_screenshots-val :lambda-list '(m))
(cl:defmethod number_of_screenshots-val ((m <take_screenshot_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:number_of_screenshots-val is deprecated.  Use prx_utilities-srv:number_of_screenshots instead.")
  (number_of_screenshots m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <take_screenshot_srv-request>) ostream)
  "Serializes a message object of type '<take_screenshot_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'destination_node))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'destination_node))
  (cl:let* ((signed (cl:slot-value msg 'screen_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'number_of_screenshots)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <take_screenshot_srv-request>) istream)
  "Deserializes a message object of type '<take_screenshot_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'destination_node) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'destination_node) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'screen_num) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'number_of_screenshots) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<take_screenshot_srv-request>)))
  "Returns string type for a service object of type '<take_screenshot_srv-request>"
  "prx_utilities/take_screenshot_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'take_screenshot_srv-request)))
  "Returns string type for a service object of type 'take_screenshot_srv-request"
  "prx_utilities/take_screenshot_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<take_screenshot_srv-request>)))
  "Returns md5sum for a message object of type '<take_screenshot_srv-request>"
  "7549dad931fa848fc767a55b74b0961b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'take_screenshot_srv-request)))
  "Returns md5sum for a message object of type 'take_screenshot_srv-request"
  "7549dad931fa848fc767a55b74b0961b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<take_screenshot_srv-request>)))
  "Returns full string definition for message of type '<take_screenshot_srv-request>"
  (cl:format cl:nil "string destination_node~%int32 screen_num~%int32 number_of_screenshots~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'take_screenshot_srv-request)))
  "Returns full string definition for message of type 'take_screenshot_srv-request"
  (cl:format cl:nil "string destination_node~%int32 screen_num~%int32 number_of_screenshots~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <take_screenshot_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'destination_node))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <take_screenshot_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'take_screenshot_srv-request
    (cl:cons ':destination_node (destination_node msg))
    (cl:cons ':screen_num (screen_num msg))
    (cl:cons ':number_of_screenshots (number_of_screenshots msg))
))
;//! \htmlinclude take_screenshot_srv-response.msg.html

(cl:defclass <take_screenshot_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass take_screenshot_srv-response (<take_screenshot_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <take_screenshot_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'take_screenshot_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<take_screenshot_srv-response> is deprecated: use prx_utilities-srv:take_screenshot_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <take_screenshot_srv-response>) ostream)
  "Serializes a message object of type '<take_screenshot_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <take_screenshot_srv-response>) istream)
  "Deserializes a message object of type '<take_screenshot_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<take_screenshot_srv-response>)))
  "Returns string type for a service object of type '<take_screenshot_srv-response>"
  "prx_utilities/take_screenshot_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'take_screenshot_srv-response)))
  "Returns string type for a service object of type 'take_screenshot_srv-response"
  "prx_utilities/take_screenshot_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<take_screenshot_srv-response>)))
  "Returns md5sum for a message object of type '<take_screenshot_srv-response>"
  "7549dad931fa848fc767a55b74b0961b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'take_screenshot_srv-response)))
  "Returns md5sum for a message object of type 'take_screenshot_srv-response"
  "7549dad931fa848fc767a55b74b0961b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<take_screenshot_srv-response>)))
  "Returns full string definition for message of type '<take_screenshot_srv-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'take_screenshot_srv-response)))
  "Returns full string definition for message of type 'take_screenshot_srv-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <take_screenshot_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <take_screenshot_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'take_screenshot_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'take_screenshot_srv)))
  'take_screenshot_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'take_screenshot_srv)))
  'take_screenshot_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'take_screenshot_srv)))
  "Returns string type for a service object of type '<take_screenshot_srv>"
  "prx_utilities/take_screenshot_srv")