; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude send_plants_srv-request.msg.html

(cl:defclass <send_plants_srv-request> (roslisp-msg-protocol:ros-message)
  ((paths
    :reader paths
    :initarg :paths
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (system_path
    :reader system_path
    :initarg :system_path
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (source_node_name
    :reader source_node_name
    :initarg :source_node_name
    :type cl:string
    :initform ""))
)

(cl:defclass send_plants_srv-request (<send_plants_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <send_plants_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'send_plants_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<send_plants_srv-request> is deprecated: use prx_utilities-srv:send_plants_srv-request instead.")))

(cl:ensure-generic-function 'paths-val :lambda-list '(m))
(cl:defmethod paths-val ((m <send_plants_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:paths-val is deprecated.  Use prx_utilities-srv:paths instead.")
  (paths m))

(cl:ensure-generic-function 'system_path-val :lambda-list '(m))
(cl:defmethod system_path-val ((m <send_plants_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:system_path-val is deprecated.  Use prx_utilities-srv:system_path instead.")
  (system_path m))

(cl:ensure-generic-function 'source_node_name-val :lambda-list '(m))
(cl:defmethod source_node_name-val ((m <send_plants_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:source_node_name-val is deprecated.  Use prx_utilities-srv:source_node_name instead.")
  (source_node_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <send_plants_srv-request>) ostream)
  "Serializes a message object of type '<send_plants_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'paths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'paths))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'system_path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'system_path))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source_node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source_node_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <send_plants_srv-request>) istream)
  "Deserializes a message object of type '<send_plants_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'paths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'paths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'system_path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'system_path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<send_plants_srv-request>)))
  "Returns string type for a service object of type '<send_plants_srv-request>"
  "prx_utilities/send_plants_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_plants_srv-request)))
  "Returns string type for a service object of type 'send_plants_srv-request"
  "prx_utilities/send_plants_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<send_plants_srv-request>)))
  "Returns md5sum for a message object of type '<send_plants_srv-request>"
  "48b570b62ff85364915797407df6efaf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'send_plants_srv-request)))
  "Returns md5sum for a message object of type 'send_plants_srv-request"
  "48b570b62ff85364915797407df6efaf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<send_plants_srv-request>)))
  "Returns full string definition for message of type '<send_plants_srv-request>"
  (cl:format cl:nil "string[] paths~%string[] system_path~%string source_node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'send_plants_srv-request)))
  "Returns full string definition for message of type 'send_plants_srv-request"
  (cl:format cl:nil "string[] paths~%string[] system_path~%string source_node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <send_plants_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'paths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'system_path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:length (cl:slot-value msg 'source_node_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <send_plants_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'send_plants_srv-request
    (cl:cons ':paths (paths msg))
    (cl:cons ':system_path (system_path msg))
    (cl:cons ':source_node_name (source_node_name msg))
))
;//! \htmlinclude send_plants_srv-response.msg.html

(cl:defclass <send_plants_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass send_plants_srv-response (<send_plants_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <send_plants_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'send_plants_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<send_plants_srv-response> is deprecated: use prx_utilities-srv:send_plants_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <send_plants_srv-response>) ostream)
  "Serializes a message object of type '<send_plants_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <send_plants_srv-response>) istream)
  "Deserializes a message object of type '<send_plants_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<send_plants_srv-response>)))
  "Returns string type for a service object of type '<send_plants_srv-response>"
  "prx_utilities/send_plants_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_plants_srv-response)))
  "Returns string type for a service object of type 'send_plants_srv-response"
  "prx_utilities/send_plants_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<send_plants_srv-response>)))
  "Returns md5sum for a message object of type '<send_plants_srv-response>"
  "48b570b62ff85364915797407df6efaf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'send_plants_srv-response)))
  "Returns md5sum for a message object of type 'send_plants_srv-response"
  "48b570b62ff85364915797407df6efaf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<send_plants_srv-response>)))
  "Returns full string definition for message of type '<send_plants_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'send_plants_srv-response)))
  "Returns full string definition for message of type 'send_plants_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <send_plants_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <send_plants_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'send_plants_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'send_plants_srv)))
  'send_plants_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'send_plants_srv)))
  'send_plants_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'send_plants_srv)))
  "Returns string type for a service object of type '<send_plants_srv>"
  "prx_utilities/send_plants_srv")