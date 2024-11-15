; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetEePoseJointConfig-request.msg.html

(cl:defclass <GetEePoseJointConfig-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (attempts
    :reader attempts
    :initarg :attempts
    :type cl:integer
    :initform 0))
)

(cl:defclass GetEePoseJointConfig-request (<GetEePoseJointConfig-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEePoseJointConfig-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEePoseJointConfig-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEePoseJointConfig-request> is deprecated: use panda_gazebo-srv:GetEePoseJointConfig-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetEePoseJointConfig-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:pose-val is deprecated.  Use panda_gazebo-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'attempts-val :lambda-list '(m))
(cl:defmethod attempts-val ((m <GetEePoseJointConfig-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:attempts-val is deprecated.  Use panda_gazebo-srv:attempts instead.")
  (attempts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEePoseJointConfig-request>) ostream)
  "Serializes a message object of type '<GetEePoseJointConfig-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let* ((signed (cl:slot-value msg 'attempts)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEePoseJointConfig-request>) istream)
  "Deserializes a message object of type '<GetEePoseJointConfig-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'attempts) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEePoseJointConfig-request>)))
  "Returns string type for a service object of type '<GetEePoseJointConfig-request>"
  "panda_gazebo/GetEePoseJointConfigRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePoseJointConfig-request)))
  "Returns string type for a service object of type 'GetEePoseJointConfig-request"
  "panda_gazebo/GetEePoseJointConfigRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEePoseJointConfig-request>)))
  "Returns md5sum for a message object of type '<GetEePoseJointConfig-request>"
  "b9c46dcb95c6798588db6a317265add6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEePoseJointConfig-request)))
  "Returns md5sum for a message object of type 'GetEePoseJointConfig-request"
  "b9c46dcb95c6798588db6a317265add6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEePoseJointConfig-request>)))
  "Returns full string definition for message of type '<GetEePoseJointConfig-request>"
  (cl:format cl:nil "# Service that can be used to get a set of posible joint configuration for a given EE~%# pose using MoveIt.~%geometry_msgs/Pose pose~%int32 attempts~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEePoseJointConfig-request)))
  "Returns full string definition for message of type 'GetEePoseJointConfig-request"
  (cl:format cl:nil "# Service that can be used to get a set of posible joint configuration for a given EE~%# pose using MoveIt.~%geometry_msgs/Pose pose~%int32 attempts~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEePoseJointConfig-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEePoseJointConfig-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEePoseJointConfig-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':attempts (attempts msg))
))
;//! \htmlinclude GetEePoseJointConfig-response.msg.html

(cl:defclass <GetEePoseJointConfig-response> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (joint_positions
    :reader joint_positions
    :initarg :joint_positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass GetEePoseJointConfig-response (<GetEePoseJointConfig-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEePoseJointConfig-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEePoseJointConfig-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEePoseJointConfig-response> is deprecated: use panda_gazebo-srv:GetEePoseJointConfig-response instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <GetEePoseJointConfig-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_names-val is deprecated.  Use panda_gazebo-srv:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <GetEePoseJointConfig-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_positions-val is deprecated.  Use panda_gazebo-srv:joint_positions instead.")
  (joint_positions m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetEePoseJointConfig-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetEePoseJointConfig-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEePoseJointConfig-response>) ostream)
  "Serializes a message object of type '<GetEePoseJointConfig-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_names))))
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
   (cl:slot-value msg 'joint_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_positions))))
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
   (cl:slot-value msg 'joint_positions))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEePoseJointConfig-response>) istream)
  "Deserializes a message object of type '<GetEePoseJointConfig-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_names)))
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
  (cl:setf (cl:slot-value msg 'joint_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_positions)))
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
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEePoseJointConfig-response>)))
  "Returns string type for a service object of type '<GetEePoseJointConfig-response>"
  "panda_gazebo/GetEePoseJointConfigResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePoseJointConfig-response)))
  "Returns string type for a service object of type 'GetEePoseJointConfig-response"
  "panda_gazebo/GetEePoseJointConfigResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEePoseJointConfig-response>)))
  "Returns md5sum for a message object of type '<GetEePoseJointConfig-response>"
  "b9c46dcb95c6798588db6a317265add6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEePoseJointConfig-response)))
  "Returns md5sum for a message object of type 'GetEePoseJointConfig-response"
  "b9c46dcb95c6798588db6a317265add6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEePoseJointConfig-response>)))
  "Returns full string definition for message of type '<GetEePoseJointConfig-response>"
  (cl:format cl:nil "string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEePoseJointConfig-response)))
  "Returns full string definition for message of type 'GetEePoseJointConfig-response"
  (cl:format cl:nil "string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEePoseJointConfig-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEePoseJointConfig-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEePoseJointConfig-response
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':joint_positions (joint_positions msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetEePoseJointConfig)))
  'GetEePoseJointConfig-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetEePoseJointConfig)))
  'GetEePoseJointConfig-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePoseJointConfig)))
  "Returns string type for a service object of type '<GetEePoseJointConfig>"
  "panda_gazebo/GetEePoseJointConfig")