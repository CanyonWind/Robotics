; Auto-generated. Do not edit!


(cl:in-package prx_utilities-msg)


;//! \htmlinclude space_msg.msg.html

(cl:defclass <space_msg> (roslisp-msg-protocol:ros-message)
  ((system_path
    :reader system_path
    :initarg :system_path
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (dimension
    :reader dimension
    :initarg :dimension
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass space_msg (<space_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <space_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'space_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-msg:<space_msg> is deprecated: use prx_utilities-msg:space_msg instead.")))

(cl:ensure-generic-function 'system_path-val :lambda-list '(m))
(cl:defmethod system_path-val ((m <space_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:system_path-val is deprecated.  Use prx_utilities-msg:system_path instead.")
  (system_path m))

(cl:ensure-generic-function 'dimension-val :lambda-list '(m))
(cl:defmethod dimension-val ((m <space_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-msg:dimension-val is deprecated.  Use prx_utilities-msg:dimension instead.")
  (dimension m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <space_msg>) ostream)
  "Serializes a message object of type '<space_msg>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dimension))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'dimension))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <space_msg>) istream)
  "Deserializes a message object of type '<space_msg>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dimension) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dimension)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<space_msg>)))
  "Returns string type for a message object of type '<space_msg>"
  "prx_utilities/space_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'space_msg)))
  "Returns string type for a message object of type 'space_msg"
  "prx_utilities/space_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<space_msg>)))
  "Returns md5sum for a message object of type '<space_msg>"
  "220c2fd8cce8ce4e664c7510ec880b0e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'space_msg)))
  "Returns md5sum for a message object of type 'space_msg"
  "220c2fd8cce8ce4e664c7510ec880b0e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<space_msg>)))
  "Returns full string definition for message of type '<space_msg>"
  (cl:format cl:nil "string[] system_path~%uint8[] dimension~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'space_msg)))
  "Returns full string definition for message of type 'space_msg"
  (cl:format cl:nil "string[] system_path~%uint8[] dimension~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <space_msg>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'system_path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dimension) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <space_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'space_msg
    (cl:cons ':system_path (system_path msg))
    (cl:cons ':dimension (dimension msg))
))
