; Auto-generated. Do not edit!


(cl:in-package prx_simulation-srv)


;//! \htmlinclude request_ground_truth_srv-request.msg.html

(cl:defclass <request_ground_truth_srv-request> (roslisp-msg-protocol:ros-message)
  ((timestamp_request
    :reader timestamp_request
    :initarg :timestamp_request
    :type cl:float
    :initform 0.0)
   (node_name
    :reader node_name
    :initarg :node_name
    :type cl:string
    :initform ""))
)

(cl:defclass request_ground_truth_srv-request (<request_ground_truth_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <request_ground_truth_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'request_ground_truth_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<request_ground_truth_srv-request> is deprecated: use prx_simulation-srv:request_ground_truth_srv-request instead.")))

(cl:ensure-generic-function 'timestamp_request-val :lambda-list '(m))
(cl:defmethod timestamp_request-val ((m <request_ground_truth_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:timestamp_request-val is deprecated.  Use prx_simulation-srv:timestamp_request instead.")
  (timestamp_request m))

(cl:ensure-generic-function 'node_name-val :lambda-list '(m))
(cl:defmethod node_name-val ((m <request_ground_truth_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:node_name-val is deprecated.  Use prx_simulation-srv:node_name instead.")
  (node_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <request_ground_truth_srv-request>) ostream)
  "Serializes a message object of type '<request_ground_truth_srv-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp_request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <request_ground_truth_srv-request>) istream)
  "Deserializes a message object of type '<request_ground_truth_srv-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp_request) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'node_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<request_ground_truth_srv-request>)))
  "Returns string type for a service object of type '<request_ground_truth_srv-request>"
  "prx_simulation/request_ground_truth_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_ground_truth_srv-request)))
  "Returns string type for a service object of type 'request_ground_truth_srv-request"
  "prx_simulation/request_ground_truth_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<request_ground_truth_srv-request>)))
  "Returns md5sum for a message object of type '<request_ground_truth_srv-request>"
  "90956c8a9d3ec220b03ff5bfba854f58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'request_ground_truth_srv-request)))
  "Returns md5sum for a message object of type 'request_ground_truth_srv-request"
  "90956c8a9d3ec220b03ff5bfba854f58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<request_ground_truth_srv-request>)))
  "Returns full string definition for message of type '<request_ground_truth_srv-request>"
  (cl:format cl:nil "float64 timestamp_request~%string node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'request_ground_truth_srv-request)))
  "Returns full string definition for message of type 'request_ground_truth_srv-request"
  (cl:format cl:nil "float64 timestamp_request~%string node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <request_ground_truth_srv-request>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'node_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <request_ground_truth_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'request_ground_truth_srv-request
    (cl:cons ':timestamp_request (timestamp_request msg))
    (cl:cons ':node_name (node_name msg))
))
;//! \htmlinclude request_ground_truth_srv-response.msg.html

(cl:defclass <request_ground_truth_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass request_ground_truth_srv-response (<request_ground_truth_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <request_ground_truth_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'request_ground_truth_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<request_ground_truth_srv-response> is deprecated: use prx_simulation-srv:request_ground_truth_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <request_ground_truth_srv-response>) ostream)
  "Serializes a message object of type '<request_ground_truth_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <request_ground_truth_srv-response>) istream)
  "Deserializes a message object of type '<request_ground_truth_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<request_ground_truth_srv-response>)))
  "Returns string type for a service object of type '<request_ground_truth_srv-response>"
  "prx_simulation/request_ground_truth_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_ground_truth_srv-response)))
  "Returns string type for a service object of type 'request_ground_truth_srv-response"
  "prx_simulation/request_ground_truth_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<request_ground_truth_srv-response>)))
  "Returns md5sum for a message object of type '<request_ground_truth_srv-response>"
  "90956c8a9d3ec220b03ff5bfba854f58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'request_ground_truth_srv-response)))
  "Returns md5sum for a message object of type 'request_ground_truth_srv-response"
  "90956c8a9d3ec220b03ff5bfba854f58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<request_ground_truth_srv-response>)))
  "Returns full string definition for message of type '<request_ground_truth_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'request_ground_truth_srv-response)))
  "Returns full string definition for message of type 'request_ground_truth_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <request_ground_truth_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <request_ground_truth_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'request_ground_truth_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'request_ground_truth_srv)))
  'request_ground_truth_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'request_ground_truth_srv)))
  'request_ground_truth_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_ground_truth_srv)))
  "Returns string type for a service object of type '<request_ground_truth_srv>"
  "prx_simulation/request_ground_truth_srv")