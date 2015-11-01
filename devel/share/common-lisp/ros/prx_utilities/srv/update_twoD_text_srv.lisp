; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude update_twoD_text_srv-request.msg.html

(cl:defclass <update_twoD_text_srv-request> (roslisp-msg-protocol:ros-message)
  ((our_name
    :reader our_name
    :initarg :our_name
    :type cl:string
    :initform "")
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (relative_position
    :reader relative_position
    :initarg :relative_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (color
    :reader color
    :initarg :color
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (delete_text
    :reader delete_text
    :initarg :delete_text
    :type cl:fixnum
    :initform 0))
)

(cl:defclass update_twoD_text_srv-request (<update_twoD_text_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <update_twoD_text_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'update_twoD_text_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<update_twoD_text_srv-request> is deprecated: use prx_utilities-srv:update_twoD_text_srv-request instead.")))

(cl:ensure-generic-function 'our_name-val :lambda-list '(m))
(cl:defmethod our_name-val ((m <update_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:our_name-val is deprecated.  Use prx_utilities-srv:our_name instead.")
  (our_name m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <update_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:text-val is deprecated.  Use prx_utilities-srv:text instead.")
  (text m))

(cl:ensure-generic-function 'relative_position-val :lambda-list '(m))
(cl:defmethod relative_position-val ((m <update_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:relative_position-val is deprecated.  Use prx_utilities-srv:relative_position instead.")
  (relative_position m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <update_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:color-val is deprecated.  Use prx_utilities-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'delete_text-val :lambda-list '(m))
(cl:defmethod delete_text-val ((m <update_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:delete_text-val is deprecated.  Use prx_utilities-srv:delete_text instead.")
  (delete_text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <update_twoD_text_srv-request>) ostream)
  "Serializes a message object of type '<update_twoD_text_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'our_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'our_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'relative_position))))
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
   (cl:slot-value msg 'relative_position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'color))))
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
   (cl:slot-value msg 'color))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'delete_text)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'delete_text)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <update_twoD_text_srv-request>) istream)
  "Deserializes a message object of type '<update_twoD_text_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'our_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'our_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'relative_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'relative_position)))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'color) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'color)))
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
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'delete_text)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'delete_text)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<update_twoD_text_srv-request>)))
  "Returns string type for a service object of type '<update_twoD_text_srv-request>"
  "prx_utilities/update_twoD_text_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_twoD_text_srv-request)))
  "Returns string type for a service object of type 'update_twoD_text_srv-request"
  "prx_utilities/update_twoD_text_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<update_twoD_text_srv-request>)))
  "Returns md5sum for a message object of type '<update_twoD_text_srv-request>"
  "54549bddf7184557b99998def9d1baef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'update_twoD_text_srv-request)))
  "Returns md5sum for a message object of type 'update_twoD_text_srv-request"
  "54549bddf7184557b99998def9d1baef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<update_twoD_text_srv-request>)))
  "Returns full string definition for message of type '<update_twoD_text_srv-request>"
  (cl:format cl:nil "string our_name~%string text~%float64[] relative_position~%float64[] color~%uint16 delete_text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'update_twoD_text_srv-request)))
  "Returns full string definition for message of type 'update_twoD_text_srv-request"
  (cl:format cl:nil "string our_name~%string text~%float64[] relative_position~%float64[] color~%uint16 delete_text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <update_twoD_text_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'our_name))
     4 (cl:length (cl:slot-value msg 'text))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'relative_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <update_twoD_text_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'update_twoD_text_srv-request
    (cl:cons ':our_name (our_name msg))
    (cl:cons ':text (text msg))
    (cl:cons ':relative_position (relative_position msg))
    (cl:cons ':color (color msg))
    (cl:cons ':delete_text (delete_text msg))
))
;//! \htmlinclude update_twoD_text_srv-response.msg.html

(cl:defclass <update_twoD_text_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass update_twoD_text_srv-response (<update_twoD_text_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <update_twoD_text_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'update_twoD_text_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<update_twoD_text_srv-response> is deprecated: use prx_utilities-srv:update_twoD_text_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <update_twoD_text_srv-response>) ostream)
  "Serializes a message object of type '<update_twoD_text_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <update_twoD_text_srv-response>) istream)
  "Deserializes a message object of type '<update_twoD_text_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<update_twoD_text_srv-response>)))
  "Returns string type for a service object of type '<update_twoD_text_srv-response>"
  "prx_utilities/update_twoD_text_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_twoD_text_srv-response)))
  "Returns string type for a service object of type 'update_twoD_text_srv-response"
  "prx_utilities/update_twoD_text_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<update_twoD_text_srv-response>)))
  "Returns md5sum for a message object of type '<update_twoD_text_srv-response>"
  "54549bddf7184557b99998def9d1baef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'update_twoD_text_srv-response)))
  "Returns md5sum for a message object of type 'update_twoD_text_srv-response"
  "54549bddf7184557b99998def9d1baef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<update_twoD_text_srv-response>)))
  "Returns full string definition for message of type '<update_twoD_text_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'update_twoD_text_srv-response)))
  "Returns full string definition for message of type 'update_twoD_text_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <update_twoD_text_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <update_twoD_text_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'update_twoD_text_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'update_twoD_text_srv)))
  'update_twoD_text_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'update_twoD_text_srv)))
  'update_twoD_text_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'update_twoD_text_srv)))
  "Returns string type for a service object of type '<update_twoD_text_srv>"
  "prx_utilities/update_twoD_text_srv")