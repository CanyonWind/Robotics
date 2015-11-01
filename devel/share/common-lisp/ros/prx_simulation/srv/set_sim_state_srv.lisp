; Auto-generated. Do not edit!


(cl:in-package prx_simulation-srv)


;//! \htmlinclude set_sim_state_srv-request.msg.html

(cl:defclass <set_sim_state_srv-request> (roslisp-msg-protocol:ros-message)
  ((sim_state
    :reader sim_state
    :initarg :sim_state
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (node_name
    :reader node_name
    :initarg :node_name
    :type cl:string
    :initform ""))
)

(cl:defclass set_sim_state_srv-request (<set_sim_state_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_sim_state_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_sim_state_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<set_sim_state_srv-request> is deprecated: use prx_simulation-srv:set_sim_state_srv-request instead.")))

(cl:ensure-generic-function 'sim_state-val :lambda-list '(m))
(cl:defmethod sim_state-val ((m <set_sim_state_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:sim_state-val is deprecated.  Use prx_simulation-srv:sim_state instead.")
  (sim_state m))

(cl:ensure-generic-function 'node_name-val :lambda-list '(m))
(cl:defmethod node_name-val ((m <set_sim_state_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:node_name-val is deprecated.  Use prx_simulation-srv:node_name instead.")
  (node_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_sim_state_srv-request>) ostream)
  "Serializes a message object of type '<set_sim_state_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sim_state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'sim_state))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'node_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'node_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_sim_state_srv-request>) istream)
  "Deserializes a message object of type '<set_sim_state_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sim_state) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sim_state)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_sim_state_srv-request>)))
  "Returns string type for a service object of type '<set_sim_state_srv-request>"
  "prx_simulation/set_sim_state_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_sim_state_srv-request)))
  "Returns string type for a service object of type 'set_sim_state_srv-request"
  "prx_simulation/set_sim_state_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_sim_state_srv-request>)))
  "Returns md5sum for a message object of type '<set_sim_state_srv-request>"
  "33a7b8b2ef07b59c7ef6feae729bf484")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_sim_state_srv-request)))
  "Returns md5sum for a message object of type 'set_sim_state_srv-request"
  "33a7b8b2ef07b59c7ef6feae729bf484")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_sim_state_srv-request>)))
  "Returns full string definition for message of type '<set_sim_state_srv-request>"
  (cl:format cl:nil "float64[] sim_state~%string node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_sim_state_srv-request)))
  "Returns full string definition for message of type 'set_sim_state_srv-request"
  (cl:format cl:nil "float64[] sim_state~%string node_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_sim_state_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sim_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:length (cl:slot-value msg 'node_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_sim_state_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_sim_state_srv-request
    (cl:cons ':sim_state (sim_state msg))
    (cl:cons ':node_name (node_name msg))
))
;//! \htmlinclude set_sim_state_srv-response.msg.html

(cl:defclass <set_sim_state_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_sim_state_srv-response (<set_sim_state_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_sim_state_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_sim_state_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<set_sim_state_srv-response> is deprecated: use prx_simulation-srv:set_sim_state_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_sim_state_srv-response>) ostream)
  "Serializes a message object of type '<set_sim_state_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_sim_state_srv-response>) istream)
  "Deserializes a message object of type '<set_sim_state_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_sim_state_srv-response>)))
  "Returns string type for a service object of type '<set_sim_state_srv-response>"
  "prx_simulation/set_sim_state_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_sim_state_srv-response)))
  "Returns string type for a service object of type 'set_sim_state_srv-response"
  "prx_simulation/set_sim_state_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_sim_state_srv-response>)))
  "Returns md5sum for a message object of type '<set_sim_state_srv-response>"
  "33a7b8b2ef07b59c7ef6feae729bf484")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_sim_state_srv-response)))
  "Returns md5sum for a message object of type 'set_sim_state_srv-response"
  "33a7b8b2ef07b59c7ef6feae729bf484")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_sim_state_srv-response>)))
  "Returns full string definition for message of type '<set_sim_state_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_sim_state_srv-response)))
  "Returns full string definition for message of type 'set_sim_state_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_sim_state_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_sim_state_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_sim_state_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_sim_state_srv)))
  'set_sim_state_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_sim_state_srv)))
  'set_sim_state_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_sim_state_srv)))
  "Returns string type for a service object of type '<set_sim_state_srv>"
  "prx_simulation/set_sim_state_srv")