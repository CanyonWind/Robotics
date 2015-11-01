; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude add_HUD_element_srv-request.msg.html

(cl:defclass <add_HUD_element_srv-request> (roslisp-msg-protocol:ros-message)
  ((parent_name
    :reader parent_name
    :initarg :parent_name
    :type cl:string
    :initform "")
   (our_name
    :reader our_name
    :initarg :our_name
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (color
    :reader color
    :initarg :color
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (character_size
    :reader character_size
    :initarg :character_size
    :type cl:integer
    :initform 0)
   (font
    :reader font
    :initarg :font
    :type cl:string
    :initform "")
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform ""))
)

(cl:defclass add_HUD_element_srv-request (<add_HUD_element_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_HUD_element_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_HUD_element_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<add_HUD_element_srv-request> is deprecated: use prx_utilities-srv:add_HUD_element_srv-request instead.")))

(cl:ensure-generic-function 'parent_name-val :lambda-list '(m))
(cl:defmethod parent_name-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:parent_name-val is deprecated.  Use prx_utilities-srv:parent_name instead.")
  (parent_name m))

(cl:ensure-generic-function 'our_name-val :lambda-list '(m))
(cl:defmethod our_name-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:our_name-val is deprecated.  Use prx_utilities-srv:our_name instead.")
  (our_name m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:position-val is deprecated.  Use prx_utilities-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:color-val is deprecated.  Use prx_utilities-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'character_size-val :lambda-list '(m))
(cl:defmethod character_size-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:character_size-val is deprecated.  Use prx_utilities-srv:character_size instead.")
  (character_size m))

(cl:ensure-generic-function 'font-val :lambda-list '(m))
(cl:defmethod font-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:font-val is deprecated.  Use prx_utilities-srv:font instead.")
  (font m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <add_HUD_element_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:text-val is deprecated.  Use prx_utilities-srv:text instead.")
  (text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_HUD_element_srv-request>) ostream)
  "Serializes a message object of type '<add_HUD_element_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parent_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parent_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'our_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'our_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
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
   (cl:slot-value msg 'position))
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
  (cl:let* ((signed (cl:slot-value msg 'character_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'font))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'font))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_HUD_element_srv-request>) istream)
  "Deserializes a message object of type '<add_HUD_element_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parent_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parent_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'our_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'our_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'character_size) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'font) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'font) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_HUD_element_srv-request>)))
  "Returns string type for a service object of type '<add_HUD_element_srv-request>"
  "prx_utilities/add_HUD_element_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_HUD_element_srv-request)))
  "Returns string type for a service object of type 'add_HUD_element_srv-request"
  "prx_utilities/add_HUD_element_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_HUD_element_srv-request>)))
  "Returns md5sum for a message object of type '<add_HUD_element_srv-request>"
  "9eaf08caca9dfb1bac662ac4901294bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_HUD_element_srv-request)))
  "Returns md5sum for a message object of type 'add_HUD_element_srv-request"
  "9eaf08caca9dfb1bac662ac4901294bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_HUD_element_srv-request>)))
  "Returns full string definition for message of type '<add_HUD_element_srv-request>"
  (cl:format cl:nil "string parent_name~%string our_name~%float64[]  position~%float64[]  color~%int32 character_size~%string font~%string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_HUD_element_srv-request)))
  "Returns full string definition for message of type 'add_HUD_element_srv-request"
  (cl:format cl:nil "string parent_name~%string our_name~%float64[]  position~%float64[]  color~%int32 character_size~%string font~%string text~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_HUD_element_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'parent_name))
     4 (cl:length (cl:slot-value msg 'our_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
     4 (cl:length (cl:slot-value msg 'font))
     4 (cl:length (cl:slot-value msg 'text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_HUD_element_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'add_HUD_element_srv-request
    (cl:cons ':parent_name (parent_name msg))
    (cl:cons ':our_name (our_name msg))
    (cl:cons ':position (position msg))
    (cl:cons ':color (color msg))
    (cl:cons ':character_size (character_size msg))
    (cl:cons ':font (font msg))
    (cl:cons ':text (text msg))
))
;//! \htmlinclude add_HUD_element_srv-response.msg.html

(cl:defclass <add_HUD_element_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass add_HUD_element_srv-response (<add_HUD_element_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <add_HUD_element_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'add_HUD_element_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<add_HUD_element_srv-response> is deprecated: use prx_utilities-srv:add_HUD_element_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <add_HUD_element_srv-response>) ostream)
  "Serializes a message object of type '<add_HUD_element_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <add_HUD_element_srv-response>) istream)
  "Deserializes a message object of type '<add_HUD_element_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<add_HUD_element_srv-response>)))
  "Returns string type for a service object of type '<add_HUD_element_srv-response>"
  "prx_utilities/add_HUD_element_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_HUD_element_srv-response)))
  "Returns string type for a service object of type 'add_HUD_element_srv-response"
  "prx_utilities/add_HUD_element_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<add_HUD_element_srv-response>)))
  "Returns md5sum for a message object of type '<add_HUD_element_srv-response>"
  "9eaf08caca9dfb1bac662ac4901294bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'add_HUD_element_srv-response)))
  "Returns md5sum for a message object of type 'add_HUD_element_srv-response"
  "9eaf08caca9dfb1bac662ac4901294bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<add_HUD_element_srv-response>)))
  "Returns full string definition for message of type '<add_HUD_element_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'add_HUD_element_srv-response)))
  "Returns full string definition for message of type 'add_HUD_element_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <add_HUD_element_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <add_HUD_element_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'add_HUD_element_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'add_HUD_element_srv)))
  'add_HUD_element_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'add_HUD_element_srv)))
  'add_HUD_element_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'add_HUD_element_srv)))
  "Returns string type for a service object of type '<add_HUD_element_srv>"
  "prx_utilities/add_HUD_element_srv")