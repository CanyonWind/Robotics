; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude add_twoD_text_srv-request.msg.html

(cl:defclass <add_twoD_text_srv-request> (roslisp-msg-protocol:ros-message)
  ((our_name
    :reader our_name
    :initarg :our_name
    :type cl:string
    :initform "")
   (associate_system
    :reader associate_system
    :initarg :associate_system
    :type cl:string
    :initform "")
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (font
    :reader font
    :initarg :font
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
   (text_size
    :reader text_size
    :initarg :text_size
    :type cl:float
    :initform 0.0))
)

(cl:defclass add_twoD_text_srv-request (<add_twoD_text_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_twoD_text_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_twoD_text_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<add_twoD_text_srv-request> is deprecated: use prx_utilities-srv:add_twoD_text_srv-request instead.")))

(cl:ensure-generic-function 'our_name-val :lambda-list '(m))
(cl:defmethod our_name-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:our_name-val is deprecated.  Use prx_utilities-srv:our_name instead.")
  (our_name m))

(cl:ensure-generic-function 'associate_system-val :lambda-list '(m))
(cl:defmethod associate_system-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:associate_system-val is deprecated.  Use prx_utilities-srv:associate_system instead.")
  (associate_system m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:text-val is deprecated.  Use prx_utilities-srv:text instead.")
  (text m))

(cl:ensure-generic-function 'font-val :lambda-list '(m))
(cl:defmethod font-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:font-val is deprecated.  Use prx_utilities-srv:font instead.")
  (font m))

(cl:ensure-generic-function 'relative_position-val :lambda-list '(m))
(cl:defmethod relative_position-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:relative_position-val is deprecated.  Use prx_utilities-srv:relative_position instead.")
  (relative_position m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:color-val is deprecated.  Use prx_utilities-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'text_size-val :lambda-list '(m))
(cl:defmethod text_size-val ((m <add_twoD_text_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:text_size-val is deprecated.  Use prx_utilities-srv:text_size instead.")
  (text_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_twoD_text_srv-request>) ostream)
  "Serializes a message object of type '<add_twoD_text_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'our_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'our_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'associate_system))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'associate_system))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'font))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'font))
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'text_size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_twoD_text_srv-request>) istream)
  "Deserializes a message object of type '<add_twoD_text_srv-request>"
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
      (cl:setf (cl:slot-value msg 'associate_system) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'associate_system) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'font) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'font) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'text_size) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_twoD_text_srv-request>)))
  "Returns string type for a service object of type '<add_twoD_text_srv-request>"
  "prx_utilities/add_twoD_text_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_twoD_text_srv-request)))
  "Returns string type for a service object of type 'add_twoD_text_srv-request"
  "prx_utilities/add_twoD_text_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_twoD_text_srv-request>)))
  "Returns md5sum for a message object of type '<add_twoD_text_srv-request>"
  "a6cc3fdf0f60164e1faf4c881d50a0db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_twoD_text_srv-request)))
  "Returns md5sum for a message object of type 'add_twoD_text_srv-request"
  "a6cc3fdf0f60164e1faf4c881d50a0db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_twoD_text_srv-request>)))
  "Returns full string definition for message of type '<add_twoD_text_srv-request>"
  (cl:format cl:nil "string our_name~%string associate_system~%string text~%string font~%float64[] relative_position~%float64[] color~%float64 text_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_twoD_text_srv-request)))
  "Returns full string definition for message of type 'add_twoD_text_srv-request"
  (cl:format cl:nil "string our_name~%string associate_system~%string text~%string font~%float64[] relative_position~%float64[] color~%float64 text_size~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_twoD_text_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'our_name))
     4 (cl:length (cl:slot-value msg 'associate_system))
     4 (cl:length (cl:slot-value msg 'text))
     4 (cl:length (cl:slot-value msg 'font))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'relative_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_twoD_text_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'add_twoD_text_srv-request
    (cl:cons ':our_name (our_name msg))
    (cl:cons ':associate_system (associate_system msg))
    (cl:cons ':text (text msg))
    (cl:cons ':font (font msg))
    (cl:cons ':relative_position (relative_position msg))
    (cl:cons ':color (color msg))
    (cl:cons ':text_size (text_size msg))
))
;//! \htmlinclude add_twoD_text_srv-response.msg.html

(cl:defclass <add_twoD_text_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass add_twoD_text_srv-response (<add_twoD_text_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_twoD_text_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_twoD_text_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<add_twoD_text_srv-response> is deprecated: use prx_utilities-srv:add_twoD_text_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_twoD_text_srv-response>) ostream)
  "Serializes a message object of type '<add_twoD_text_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_twoD_text_srv-response>) istream)
  "Deserializes a message object of type '<add_twoD_text_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_twoD_text_srv-response>)))
  "Returns string type for a service object of type '<add_twoD_text_srv-response>"
  "prx_utilities/add_twoD_text_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_twoD_text_srv-response)))
  "Returns string type for a service object of type 'add_twoD_text_srv-response"
  "prx_utilities/add_twoD_text_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_twoD_text_srv-response>)))
  "Returns md5sum for a message object of type '<add_twoD_text_srv-response>"
  "a6cc3fdf0f60164e1faf4c881d50a0db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_twoD_text_srv-response)))
  "Returns md5sum for a message object of type 'add_twoD_text_srv-response"
  "a6cc3fdf0f60164e1faf4c881d50a0db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_twoD_text_srv-response>)))
  "Returns full string definition for message of type '<add_twoD_text_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_twoD_text_srv-response)))
  "Returns full string definition for message of type 'add_twoD_text_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_twoD_text_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_twoD_text_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'add_twoD_text_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'add_twoD_text_srv)))
  'add_twoD_text_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'add_twoD_text_srv)))
  'add_twoD_text_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_twoD_text_srv)))
  "Returns string type for a service object of type '<add_twoD_text_srv>"
  "prx_utilities/add_twoD_text_srv")