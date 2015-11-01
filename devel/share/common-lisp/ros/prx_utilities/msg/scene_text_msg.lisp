; Auto-generated. Do not edit!


(cl:in-package prx_utilities-msg)


;//! \htmlinclude scene_text_msg.msg.html

(cl:defclass <scene_text_msg> (roslisp-msg-protocol:ros-message)
  ((anchored_system
    :reader anchored_system
    :initarg :anchored_system
    :type cl:string
    :initform "")
   (text
    :reader text
    :initarg :text
    :type cl:string
    :initform "")
   (text_name
    :reader text_name
    :initarg :text_name
    :type cl:string
    :initform "")
   (relative_position
    :reader relative_position
    :initarg :relative_position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (color_rgba
    :reader color_rgba
    :initarg :color_rgba
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (font_size
    :reader font_size
    :initarg :font_size
    :type cl:float
    :initform 0.0)
   (font
    :reader font
    :initarg :font
    :type cl:string
    :initform ""))
)

(cl:defclass scene_text_msg (<scene_text_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <scene_text_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'scene_text_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-msg:<scene_text_msg> is deprecated: use prx_utilities-msg:scene_text_msg instead.")))

(cl:ensure-generic-function 'anchored_system-val :lambda-list '(m))
(cl:defmethod anchored_system-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:anchored_system-val is deprecated.  Use prx_utilities-msg:anchored_system instead.")
  (anchored_system m))

(cl:ensure-generic-function 'text-val :lambda-list '(m))
(cl:defmethod text-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:text-val is deprecated.  Use prx_utilities-msg:text instead.")
  (text m))

(cl:ensure-generic-function 'text_name-val :lambda-list '(m))
(cl:defmethod text_name-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:text_name-val is deprecated.  Use prx_utilities-msg:text_name instead.")
  (text_name m))

(cl:ensure-generic-function 'relative_position-val :lambda-list '(m))
(cl:defmethod relative_position-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:relative_position-val is deprecated.  Use prx_utilities-msg:relative_position instead.")
  (relative_position m))

(cl:ensure-generic-function 'color_rgba-val :lambda-list '(m))
(cl:defmethod color_rgba-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:color_rgba-val is deprecated.  Use prx_utilities-msg:color_rgba instead.")
  (color_rgba m))

(cl:ensure-generic-function 'font_size-val :lambda-list '(m))
(cl:defmethod font_size-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:font_size-val is deprecated.  Use prx_utilities-msg:font_size instead.")
  (font_size m))

(cl:ensure-generic-function 'font-val :lambda-list '(m))
(cl:defmethod font-val ((m <scene_text_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:font-val is deprecated.  Use prx_utilities-msg:font instead.")
  (font m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <scene_text_msg>) ostream)
  "Serializes a message object of type '<scene_text_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'anchored_system))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'anchored_system))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'text_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'text_name))
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'color_rgba))))
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
   (cl:slot-value msg 'color_rgba))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'font_size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'font))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'font))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <scene_text_msg>) istream)
  "Deserializes a message object of type '<scene_text_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'anchored_system) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'anchored_system) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'text_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'text_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  (cl:setf (cl:slot-value msg 'color_rgba) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'color_rgba)))
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
    (cl:setf (cl:slot-value msg 'font_size) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'font) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'font) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<scene_text_msg>)))
  "Returns string type for a message object of type '<scene_text_msg>"
  "prx_utilities/scene_text_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'scene_text_msg)))
  "Returns string type for a message object of type 'scene_text_msg"
  "prx_utilities/scene_text_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<scene_text_msg>)))
  "Returns md5sum for a message object of type '<scene_text_msg>"
  "9d98e38b3d1e2b92206c61f0e733d8f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'scene_text_msg)))
  "Returns md5sum for a message object of type 'scene_text_msg"
  "9d98e38b3d1e2b92206c61f0e733d8f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<scene_text_msg>)))
  "Returns full string definition for message of type '<scene_text_msg>"
  (cl:format cl:nil "string anchored_system~%string text~%string text_name~%float64[] relative_position~%float64[] color_rgba~%float64 font_size~%string font~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'scene_text_msg)))
  "Returns full string definition for message of type 'scene_text_msg"
  (cl:format cl:nil "string anchored_system~%string text~%string text_name~%float64[] relative_position~%float64[] color_rgba~%float64 font_size~%string font~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <scene_text_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'anchored_system))
     4 (cl:length (cl:slot-value msg 'text))
     4 (cl:length (cl:slot-value msg 'text_name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'relative_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color_rgba) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     4 (cl:length (cl:slot-value msg 'font))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <scene_text_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'scene_text_msg
    (cl:cons ':anchored_system (anchored_system msg))
    (cl:cons ':text (text msg))
    (cl:cons ':text_name (text_name msg))
    (cl:cons ':relative_position (relative_position msg))
    (cl:cons ':color_rgba (color_rgba msg))
    (cl:cons ':font_size (font_size msg))
    (cl:cons ':font (font msg))
))
