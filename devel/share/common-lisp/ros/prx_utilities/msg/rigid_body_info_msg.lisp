; Auto-generated. Do not edit!


(cl:in-package prx_utilities-msg)


;//! \htmlinclude rigid_body_info_msg.msg.html

(cl:defclass <rigid_body_info_msg> (roslisp-msg-protocol:ros-message)
  ((system_name
    :reader system_name
    :initarg :system_name
    :type cl:string
    :initform "")
   (rigid_body_name
    :reader rigid_body_name
    :initarg :rigid_body_name
    :type cl:string
    :initform "")
   (material_name
    :reader material_name
    :initarg :material_name
    :type cl:string
    :initform "")
   (geometry_type
    :reader geometry_type
    :initarg :geometry_type
    :type cl:fixnum
    :initform 0)
   (geometry_params
    :reader geometry_params
    :initarg :geometry_params
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (color_rgba
    :reader color_rgba
    :initarg :color_rgba
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass rigid_body_info_msg (<rigid_body_info_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rigid_body_info_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rigid_body_info_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-msg:<rigid_body_info_msg> is deprecated: use prx_utilities-msg:rigid_body_info_msg instead.")))

(cl:ensure-generic-function 'system_name-val :lambda-list '(m))
(cl:defmethod system_name-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:system_name-val is deprecated.  Use prx_utilities-msg:system_name instead.")
  (system_name m))

(cl:ensure-generic-function 'rigid_body_name-val :lambda-list '(m))
(cl:defmethod rigid_body_name-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:rigid_body_name-val is deprecated.  Use prx_utilities-msg:rigid_body_name instead.")
  (rigid_body_name m))

(cl:ensure-generic-function 'material_name-val :lambda-list '(m))
(cl:defmethod material_name-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:material_name-val is deprecated.  Use prx_utilities-msg:material_name instead.")
  (material_name m))

(cl:ensure-generic-function 'geometry_type-val :lambda-list '(m))
(cl:defmethod geometry_type-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:geometry_type-val is deprecated.  Use prx_utilities-msg:geometry_type instead.")
  (geometry_type m))

(cl:ensure-generic-function 'geometry_params-val :lambda-list '(m))
(cl:defmethod geometry_params-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:geometry_params-val is deprecated.  Use prx_utilities-msg:geometry_params instead.")
  (geometry_params m))

(cl:ensure-generic-function 'color_rgba-val :lambda-list '(m))
(cl:defmethod color_rgba-val ((m <rigid_body_info_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:color_rgba-val is deprecated.  Use prx_utilities-msg:color_rgba instead.")
  (color_rgba m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<rigid_body_info_msg>)))
    "Constants for message type '<rigid_body_info_msg>"
  '((:SPHERE . 1)
    (:BOX . 2)
    (:CONE . 3)
    (:CYLINDER . 4)
    (:OPEN_CYLINDER . 5)
    (:CAPSULE . 6)
    (:TRIANGLE . 7)
    (:QUAD . 8)
    (:LINES . 9)
    (:LINESTRIP . 10)
    (:MESH . 11))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'rigid_body_info_msg)))
    "Constants for message type 'rigid_body_info_msg"
  '((:SPHERE . 1)
    (:BOX . 2)
    (:CONE . 3)
    (:CYLINDER . 4)
    (:OPEN_CYLINDER . 5)
    (:CAPSULE . 6)
    (:TRIANGLE . 7)
    (:QUAD . 8)
    (:LINES . 9)
    (:LINESTRIP . 10)
    (:MESH . 11))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rigid_body_info_msg>) ostream)
  "Serializes a message object of type '<rigid_body_info_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'system_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'system_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rigid_body_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rigid_body_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'material_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'material_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'geometry_type)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'geometry_params))))
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
   (cl:slot-value msg 'geometry_params))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rigid_body_info_msg>) istream)
  "Deserializes a message object of type '<rigid_body_info_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'system_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'system_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rigid_body_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rigid_body_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'material_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'material_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'geometry_type)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'geometry_params) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'geometry_params)))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rigid_body_info_msg>)))
  "Returns string type for a message object of type '<rigid_body_info_msg>"
  "prx_utilities/rigid_body_info_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rigid_body_info_msg)))
  "Returns string type for a message object of type 'rigid_body_info_msg"
  "prx_utilities/rigid_body_info_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rigid_body_info_msg>)))
  "Returns md5sum for a message object of type '<rigid_body_info_msg>"
  "8d3e185885c45ca9d656997df5a70642")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rigid_body_info_msg)))
  "Returns md5sum for a message object of type 'rigid_body_info_msg"
  "8d3e185885c45ca9d656997df5a70642")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rigid_body_info_msg>)))
  "Returns full string definition for message of type '<rigid_body_info_msg>"
  (cl:format cl:nil "uint8 SPHERE=1~%uint8 BOX=2~%uint8 CONE=3~%uint8 CYLINDER=4~%uint8 OPEN_CYLINDER=5~%uint8 CAPSULE=6~%uint8 TRIANGLE=7~%uint8 QUAD=8~%uint8 LINES=9~%uint8 LINESTRIP=10~%uint8 MESH=11~%~%string system_name~%string rigid_body_name~%string material_name~%uint8 geometry_type~%float64[] geometry_params~%float64[] color_rgba~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rigid_body_info_msg)))
  "Returns full string definition for message of type 'rigid_body_info_msg"
  (cl:format cl:nil "uint8 SPHERE=1~%uint8 BOX=2~%uint8 CONE=3~%uint8 CYLINDER=4~%uint8 OPEN_CYLINDER=5~%uint8 CAPSULE=6~%uint8 TRIANGLE=7~%uint8 QUAD=8~%uint8 LINES=9~%uint8 LINESTRIP=10~%uint8 MESH=11~%~%string system_name~%string rigid_body_name~%string material_name~%uint8 geometry_type~%float64[] geometry_params~%float64[] color_rgba~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rigid_body_info_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'system_name))
     4 (cl:length (cl:slot-value msg 'rigid_body_name))
     4 (cl:length (cl:slot-value msg 'material_name))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'geometry_params) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color_rgba) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rigid_body_info_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'rigid_body_info_msg
    (cl:cons ':system_name (system_name msg))
    (cl:cons ':rigid_body_name (rigid_body_name msg))
    (cl:cons ':material_name (material_name msg))
    (cl:cons ':geometry_type (geometry_type msg))
    (cl:cons ':geometry_params (geometry_params msg))
    (cl:cons ':color_rgba (color_rgba msg))
))
