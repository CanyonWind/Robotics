; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude create_HUD_srv-request.msg.html

(cl:defclass <create_HUD_srv-request> (roslisp-msg-protocol:ros-message)
  ((hud_name
    :reader hud_name
    :initarg :hud_name
    :type cl:string
    :initform "")
   (area
    :reader area
    :initarg :area
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (color
    :reader color
    :initarg :color
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (texture
    :reader texture
    :initarg :texture
    :type cl:string
    :initform ""))
)

(cl:defclass create_HUD_srv-request (<create_HUD_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <create_HUD_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'create_HUD_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<create_HUD_srv-request> is deprecated: use prx_utilities-srv:create_HUD_srv-request instead.")))

(cl:ensure-generic-function 'hud_name-val :lambda-list '(m))
(cl:defmethod hud_name-val ((m <create_HUD_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:hud_name-val is deprecated.  Use prx_utilities-srv:hud_name instead.")
  (hud_name m))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <create_HUD_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:area-val is deprecated.  Use prx_utilities-srv:area instead.")
  (area m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <create_HUD_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:color-val is deprecated.  Use prx_utilities-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'texture-val :lambda-list '(m))
(cl:defmethod texture-val ((m <create_HUD_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:texture-val is deprecated.  Use prx_utilities-srv:texture instead.")
  (texture m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <create_HUD_srv-request>) ostream)
  "Serializes a message object of type '<create_HUD_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hud_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hud_name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'area))))
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
   (cl:slot-value msg 'area))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'texture))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'texture))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <create_HUD_srv-request>) istream)
  "Deserializes a message object of type '<create_HUD_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hud_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hud_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'area) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'area)))
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'texture) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'texture) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<create_HUD_srv-request>)))
  "Returns string type for a service object of type '<create_HUD_srv-request>"
  "prx_utilities/create_HUD_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_HUD_srv-request)))
  "Returns string type for a service object of type 'create_HUD_srv-request"
  "prx_utilities/create_HUD_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<create_HUD_srv-request>)))
  "Returns md5sum for a message object of type '<create_HUD_srv-request>"
  "25298e7c8aa400f277cece434a3730ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'create_HUD_srv-request)))
  "Returns md5sum for a message object of type 'create_HUD_srv-request"
  "25298e7c8aa400f277cece434a3730ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<create_HUD_srv-request>)))
  "Returns full string definition for message of type '<create_HUD_srv-request>"
  (cl:format cl:nil "string hud_name~%float64[]  area~%float64[]  color~%string texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'create_HUD_srv-request)))
  "Returns full string definition for message of type 'create_HUD_srv-request"
  (cl:format cl:nil "string hud_name~%float64[]  area~%float64[]  color~%string texture~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <create_HUD_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'hud_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'area) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:length (cl:slot-value msg 'texture))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <create_HUD_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'create_HUD_srv-request
    (cl:cons ':hud_name (hud_name msg))
    (cl:cons ':area (area msg))
    (cl:cons ':color (color msg))
    (cl:cons ':texture (texture msg))
))
;//! \htmlinclude create_HUD_srv-response.msg.html

(cl:defclass <create_HUD_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass create_HUD_srv-response (<create_HUD_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <create_HUD_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'create_HUD_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<create_HUD_srv-response> is deprecated: use prx_utilities-srv:create_HUD_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <create_HUD_srv-response>) ostream)
  "Serializes a message object of type '<create_HUD_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <create_HUD_srv-response>) istream)
  "Deserializes a message object of type '<create_HUD_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<create_HUD_srv-response>)))
  "Returns string type for a service object of type '<create_HUD_srv-response>"
  "prx_utilities/create_HUD_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_HUD_srv-response)))
  "Returns string type for a service object of type 'create_HUD_srv-response"
  "prx_utilities/create_HUD_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<create_HUD_srv-response>)))
  "Returns md5sum for a message object of type '<create_HUD_srv-response>"
  "25298e7c8aa400f277cece434a3730ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'create_HUD_srv-response)))
  "Returns md5sum for a message object of type 'create_HUD_srv-response"
  "25298e7c8aa400f277cece434a3730ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<create_HUD_srv-response>)))
  "Returns full string definition for message of type '<create_HUD_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'create_HUD_srv-response)))
  "Returns full string definition for message of type 'create_HUD_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <create_HUD_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <create_HUD_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'create_HUD_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'create_HUD_srv)))
  'create_HUD_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'create_HUD_srv)))
  'create_HUD_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'create_HUD_srv)))
  "Returns string type for a service object of type '<create_HUD_srv>"
  "prx_utilities/create_HUD_srv")