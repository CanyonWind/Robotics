; Auto-generated. Do not edit!


(cl:in-package prx_simulation-srv)


;//! \htmlinclude request_space_information_srv-request.msg.html

(cl:defclass <request_space_information_srv-request> (roslisp-msg-protocol:ros-message)
  ((consumer_pathname
    :reader consumer_pathname
    :initarg :consumer_pathname
    :type cl:string
    :initform ""))
)

(cl:defclass request_space_information_srv-request (<request_space_information_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <request_space_information_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'request_space_information_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<request_space_information_srv-request> is deprecated: use prx_simulation-srv:request_space_information_srv-request instead.")))

(cl:ensure-generic-function 'consumer_pathname-val :lambda-list '(m))
(cl:defmethod consumer_pathname-val ((m <request_space_information_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:consumer_pathname-val is deprecated.  Use prx_simulation-srv:consumer_pathname instead.")
  (consumer_pathname m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <request_space_information_srv-request>) ostream)
  "Serializes a message object of type '<request_space_information_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'consumer_pathname))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'consumer_pathname))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <request_space_information_srv-request>) istream)
  "Deserializes a message object of type '<request_space_information_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'consumer_pathname) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'consumer_pathname) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<request_space_information_srv-request>)))
  "Returns string type for a service object of type '<request_space_information_srv-request>"
  "prx_simulation/request_space_information_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_space_information_srv-request)))
  "Returns string type for a service object of type 'request_space_information_srv-request"
  "prx_simulation/request_space_information_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<request_space_information_srv-request>)))
  "Returns md5sum for a message object of type '<request_space_information_srv-request>"
  "34ab1b4f7fee73bcfc9b3f4de4f117fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'request_space_information_srv-request)))
  "Returns md5sum for a message object of type 'request_space_information_srv-request"
  "34ab1b4f7fee73bcfc9b3f4de4f117fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<request_space_information_srv-request>)))
  "Returns full string definition for message of type '<request_space_information_srv-request>"
  (cl:format cl:nil "string consumer_pathname~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'request_space_information_srv-request)))
  "Returns full string definition for message of type 'request_space_information_srv-request"
  (cl:format cl:nil "string consumer_pathname~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <request_space_information_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'consumer_pathname))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <request_space_information_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'request_space_information_srv-request
    (cl:cons ':consumer_pathname (consumer_pathname msg))
))
;//! \htmlinclude request_space_information_srv-response.msg.html

(cl:defclass <request_space_information_srv-response> (roslisp-msg-protocol:ros-message)
  ((state_space_intervals
    :reader state_space_intervals
    :initarg :state_space_intervals
    :type (cl:vector prx_simulation-msg:interval_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:interval_msg :initial-element (cl:make-instance 'prx_simulation-msg:interval_msg)))
   (control_space_intervals
    :reader control_space_intervals
    :initarg :control_space_intervals
    :type (cl:vector prx_simulation-msg:interval_msg)
   :initform (cl:make-array 0 :element-type 'prx_simulation-msg:interval_msg :initial-element (cl:make-instance 'prx_simulation-msg:interval_msg))))
)

(cl:defclass request_space_information_srv-response (<request_space_information_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <request_space_information_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'request_space_information_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_simulation-srv:<request_space_information_srv-response> is deprecated: use prx_simulation-srv:request_space_information_srv-response instead.")))

(cl:ensure-generic-function 'state_space_intervals-val :lambda-list '(m))
(cl:defmethod state_space_intervals-val ((m <request_space_information_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:state_space_intervals-val is deprecated.  Use prx_simulation-srv:state_space_intervals instead.")
  (state_space_intervals m))

(cl:ensure-generic-function 'control_space_intervals-val :lambda-list '(m))
(cl:defmethod control_space_intervals-val ((m <request_space_information_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_simulation-srv:control_space_intervals-val is deprecated.  Use prx_simulation-srv:control_space_intervals instead.")
  (control_space_intervals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <request_space_information_srv-response>) ostream)
  "Serializes a message object of type '<request_space_information_srv-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'state_space_intervals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'state_space_intervals))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'control_space_intervals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'control_space_intervals))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <request_space_information_srv-response>) istream)
  "Deserializes a message object of type '<request_space_information_srv-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'state_space_intervals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'state_space_intervals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:interval_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'control_space_intervals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'control_space_intervals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_simulation-msg:interval_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<request_space_information_srv-response>)))
  "Returns string type for a service object of type '<request_space_information_srv-response>"
  "prx_simulation/request_space_information_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_space_information_srv-response)))
  "Returns string type for a service object of type 'request_space_information_srv-response"
  "prx_simulation/request_space_information_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<request_space_information_srv-response>)))
  "Returns md5sum for a message object of type '<request_space_information_srv-response>"
  "34ab1b4f7fee73bcfc9b3f4de4f117fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'request_space_information_srv-response)))
  "Returns md5sum for a message object of type 'request_space_information_srv-response"
  "34ab1b4f7fee73bcfc9b3f4de4f117fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<request_space_information_srv-response>)))
  "Returns full string definition for message of type '<request_space_information_srv-response>"
  (cl:format cl:nil "~%interval_msg[] state_space_intervals~%interval_msg[] control_space_intervals~%~%~%================================================================================~%MSG: prx_simulation/interval_msg~%float64 lower~%float64 upper~%string pathname~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'request_space_information_srv-response)))
  "Returns full string definition for message of type 'request_space_information_srv-response"
  (cl:format cl:nil "~%interval_msg[] state_space_intervals~%interval_msg[] control_space_intervals~%~%~%================================================================================~%MSG: prx_simulation/interval_msg~%float64 lower~%float64 upper~%string pathname~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <request_space_information_srv-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'state_space_intervals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'control_space_intervals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <request_space_information_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'request_space_information_srv-response
    (cl:cons ':state_space_intervals (state_space_intervals msg))
    (cl:cons ':control_space_intervals (control_space_intervals msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'request_space_information_srv)))
  'request_space_information_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'request_space_information_srv)))
  'request_space_information_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'request_space_information_srv)))
  "Returns string type for a service object of type '<request_space_information_srv>"
  "prx_simulation/request_space_information_srv")