; Auto-generated. Do not edit!


(cl:in-package prx_utilities-srv)


;//! \htmlinclude describe_geometries_srv-request.msg.html

(cl:defclass <describe_geometries_srv-request> (roslisp-msg-protocol:ros-message)
  ((rigid_body_array
    :reader rigid_body_array
    :initarg :rigid_body_array
    :type (cl:vector prx_utilities-msg:rigid_body_info_msg)
   :initform (cl:make-array 0 :element-type 'prx_utilities-msg:rigid_body_info_msg :initial-element (cl:make-instance 'prx_utilities-msg:rigid_body_info_msg))))
)

(cl:defclass describe_geometries_srv-request (<describe_geometries_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <describe_geometries_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'describe_geometries_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<describe_geometries_srv-request> is deprecated: use prx_utilities-srv:describe_geometries_srv-request instead.")))

(cl:ensure-generic-function 'rigid_body_array-val :lambda-list '(m))
(cl:defmethod rigid_body_array-val ((m <describe_geometries_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader prx_utilities-srv:rigid_body_array-val is deprecated.  Use prx_utilities-srv:rigid_body_array instead.")
  (rigid_body_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <describe_geometries_srv-request>) ostream)
  "Serializes a message object of type '<describe_geometries_srv-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rigid_body_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rigid_body_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <describe_geometries_srv-request>) istream)
  "Deserializes a message object of type '<describe_geometries_srv-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rigid_body_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rigid_body_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'prx_utilities-msg:rigid_body_info_msg))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<describe_geometries_srv-request>)))
  "Returns string type for a service object of type '<describe_geometries_srv-request>"
  "prx_utilities/describe_geometries_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'describe_geometries_srv-request)))
  "Returns string type for a service object of type 'describe_geometries_srv-request"
  "prx_utilities/describe_geometries_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<describe_geometries_srv-request>)))
  "Returns md5sum for a message object of type '<describe_geometries_srv-request>"
  "da70fe18cb30b72403000d18aa1b41d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'describe_geometries_srv-request)))
  "Returns md5sum for a message object of type 'describe_geometries_srv-request"
  "da70fe18cb30b72403000d18aa1b41d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<describe_geometries_srv-request>)))
  "Returns full string definition for message of type '<describe_geometries_srv-request>"
  (cl:format cl:nil "prx_utilities/rigid_body_info_msg[] rigid_body_array~%~%================================================================================~%MSG: prx_utilities/rigid_body_info_msg~%uint8 SPHERE=1~%uint8 BOX=2~%uint8 CONE=3~%uint8 CYLINDER=4~%uint8 OPEN_CYLINDER=5~%uint8 CAPSULE=6~%uint8 TRIANGLE=7~%uint8 QUAD=8~%uint8 LINES=9~%uint8 LINESTRIP=10~%uint8 MESH=11~%~%string system_name~%string rigid_body_name~%string material_name~%uint8 geometry_type~%float64[] geometry_params~%float64[] color_rgba~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'describe_geometries_srv-request)))
  "Returns full string definition for message of type 'describe_geometries_srv-request"
  (cl:format cl:nil "prx_utilities/rigid_body_info_msg[] rigid_body_array~%~%================================================================================~%MSG: prx_utilities/rigid_body_info_msg~%uint8 SPHERE=1~%uint8 BOX=2~%uint8 CONE=3~%uint8 CYLINDER=4~%uint8 OPEN_CYLINDER=5~%uint8 CAPSULE=6~%uint8 TRIANGLE=7~%uint8 QUAD=8~%uint8 LINES=9~%uint8 LINESTRIP=10~%uint8 MESH=11~%~%string system_name~%string rigid_body_name~%string material_name~%uint8 geometry_type~%float64[] geometry_params~%float64[] color_rgba~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <describe_geometries_srv-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rigid_body_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <describe_geometries_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'describe_geometries_srv-request
    (cl:cons ':rigid_body_array (rigid_body_array msg))
))
;//! \htmlinclude describe_geometries_srv-response.msg.html

(cl:defclass <describe_geometries_srv-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass describe_geometries_srv-response (<describe_geometries_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <describe_geometries_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'describe_geometries_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name prx_utilities-srv:<describe_geometries_srv-response> is deprecated: use prx_utilities-srv:describe_geometries_srv-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <describe_geometries_srv-response>) ostream)
  "Serializes a message object of type '<describe_geometries_srv-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <describe_geometries_srv-response>) istream)
  "Deserializes a message object of type '<describe_geometries_srv-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<describe_geometries_srv-response>)))
  "Returns string type for a service object of type '<describe_geometries_srv-response>"
  "prx_utilities/describe_geometries_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'describe_geometries_srv-response)))
  "Returns string type for a service object of type 'describe_geometries_srv-response"
  "prx_utilities/describe_geometries_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<describe_geometries_srv-response>)))
  "Returns md5sum for a message object of type '<describe_geometries_srv-response>"
  "da70fe18cb30b72403000d18aa1b41d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'describe_geometries_srv-response)))
  "Returns md5sum for a message object of type 'describe_geometries_srv-response"
  "da70fe18cb30b72403000d18aa1b41d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<describe_geometries_srv-response>)))
  "Returns full string definition for message of type '<describe_geometries_srv-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'describe_geometries_srv-response)))
  "Returns full string definition for message of type 'describe_geometries_srv-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <describe_geometries_srv-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <describe_geometries_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'describe_geometries_srv-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'describe_geometries_srv)))
  'describe_geometries_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'describe_geometries_srv)))
  'describe_geometries_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'describe_geometries_srv)))
  "Returns string type for a service object of type '<describe_geometries_srv>"
  "prx_utilities/describe_geometries_srv")