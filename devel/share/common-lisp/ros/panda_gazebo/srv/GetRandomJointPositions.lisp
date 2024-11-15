; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetRandomJointPositions-request.msg.html

(cl:defclass <GetRandomJointPositions-request> (roslisp-msg-protocol:ros-message)
  ((joint_limits
    :reader joint_limits
    :initarg :joint_limits
    :type panda_gazebo-msg:JointLimits
    :initform (cl:make-instance 'panda_gazebo-msg:JointLimits))
   (attempts
    :reader attempts
    :initarg :attempts
    :type cl:integer
    :initform 0))
)

(cl:defclass GetRandomJointPositions-request (<GetRandomJointPositions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRandomJointPositions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRandomJointPositions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetRandomJointPositions-request> is deprecated: use panda_gazebo-srv:GetRandomJointPositions-request instead.")))

(cl:ensure-generic-function 'joint_limits-val :lambda-list '(m))
(cl:defmethod joint_limits-val ((m <GetRandomJointPositions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_limits-val is deprecated.  Use panda_gazebo-srv:joint_limits instead.")
  (joint_limits m))

(cl:ensure-generic-function 'attempts-val :lambda-list '(m))
(cl:defmethod attempts-val ((m <GetRandomJointPositions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:attempts-val is deprecated.  Use panda_gazebo-srv:attempts instead.")
  (attempts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRandomJointPositions-request>) ostream)
  "Serializes a message object of type '<GetRandomJointPositions-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_limits) ostream)
  (cl:let* ((signed (cl:slot-value msg 'attempts)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRandomJointPositions-request>) istream)
  "Deserializes a message object of type '<GetRandomJointPositions-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_limits) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'attempts) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRandomJointPositions-request>)))
  "Returns string type for a service object of type '<GetRandomJointPositions-request>"
  "panda_gazebo/GetRandomJointPositionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomJointPositions-request)))
  "Returns string type for a service object of type 'GetRandomJointPositions-request"
  "panda_gazebo/GetRandomJointPositionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRandomJointPositions-request>)))
  "Returns md5sum for a message object of type '<GetRandomJointPositions-request>"
  "4d6e6a8cd1ba93ef030177ed39cffd53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRandomJointPositions-request)))
  "Returns md5sum for a message object of type 'GetRandomJointPositions-request"
  "4d6e6a8cd1ba93ef030177ed39cffd53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRandomJointPositions-request>)))
  "Returns full string definition for message of type '<GetRandomJointPositions-request>"
  (cl:format cl:nil "# Service that can be used to get valid joint positions for controlling the robot arm~%# and hand.~%JointLimits joint_limits~%int32 attempts~%~%================================================================================~%MSG: panda_gazebo/JointLimits~%# Message used to define joint limits~%string[] names~%float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRandomJointPositions-request)))
  "Returns full string definition for message of type 'GetRandomJointPositions-request"
  (cl:format cl:nil "# Service that can be used to get valid joint positions for controlling the robot arm~%# and hand.~%JointLimits joint_limits~%int32 attempts~%~%================================================================================~%MSG: panda_gazebo/JointLimits~%# Message used to define joint limits~%string[] names~%float64[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRandomJointPositions-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_limits))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRandomJointPositions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRandomJointPositions-request
    (cl:cons ':joint_limits (joint_limits msg))
    (cl:cons ':attempts (attempts msg))
))
;//! \htmlinclude GetRandomJointPositions-response.msg.html

(cl:defclass <GetRandomJointPositions-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass GetRandomJointPositions-response (<GetRandomJointPositions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRandomJointPositions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRandomJointPositions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetRandomJointPositions-response> is deprecated: use panda_gazebo-srv:GetRandomJointPositions-response instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <GetRandomJointPositions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_names-val is deprecated.  Use panda_gazebo-srv:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <GetRandomJointPositions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_positions-val is deprecated.  Use panda_gazebo-srv:joint_positions instead.")
  (joint_positions m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetRandomJointPositions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetRandomJointPositions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRandomJointPositions-response>) ostream)
  "Serializes a message object of type '<GetRandomJointPositions-response>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRandomJointPositions-response>) istream)
  "Deserializes a message object of type '<GetRandomJointPositions-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRandomJointPositions-response>)))
  "Returns string type for a service object of type '<GetRandomJointPositions-response>"
  "panda_gazebo/GetRandomJointPositionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomJointPositions-response)))
  "Returns string type for a service object of type 'GetRandomJointPositions-response"
  "panda_gazebo/GetRandomJointPositionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRandomJointPositions-response>)))
  "Returns md5sum for a message object of type '<GetRandomJointPositions-response>"
  "4d6e6a8cd1ba93ef030177ed39cffd53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRandomJointPositions-response)))
  "Returns md5sum for a message object of type 'GetRandomJointPositions-response"
  "4d6e6a8cd1ba93ef030177ed39cffd53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRandomJointPositions-response>)))
  "Returns full string definition for message of type '<GetRandomJointPositions-response>"
  (cl:format cl:nil "string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRandomJointPositions-response)))
  "Returns full string definition for message of type 'GetRandomJointPositions-response"
  (cl:format cl:nil "string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRandomJointPositions-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRandomJointPositions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRandomJointPositions-response
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':joint_positions (joint_positions msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRandomJointPositions)))
  'GetRandomJointPositions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRandomJointPositions)))
  'GetRandomJointPositions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomJointPositions)))
  "Returns string type for a service object of type '<GetRandomJointPositions>"
  "panda_gazebo/GetRandomJointPositions")