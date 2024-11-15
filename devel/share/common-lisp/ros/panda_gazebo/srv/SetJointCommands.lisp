; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude SetJointCommands-request.msg.html

(cl:defclass <SetJointCommands-request> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (joint_commands
    :reader joint_commands
    :initarg :joint_commands
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (control_type
    :reader control_type
    :initarg :control_type
    :type cl:string
    :initform "")
   (grasping
    :reader grasping
    :initarg :grasping
    :type cl:boolean
    :initform cl:nil)
   (arm_wait
    :reader arm_wait
    :initarg :arm_wait
    :type cl:boolean
    :initform cl:nil)
   (hand_wait
    :reader hand_wait
    :initarg :hand_wait
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetJointCommands-request (<SetJointCommands-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetJointCommands-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetJointCommands-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetJointCommands-request> is deprecated: use panda_gazebo-srv:SetJointCommands-request instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_names-val is deprecated.  Use panda_gazebo-srv:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'joint_commands-val :lambda-list '(m))
(cl:defmethod joint_commands-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_commands-val is deprecated.  Use panda_gazebo-srv:joint_commands instead.")
  (joint_commands m))

(cl:ensure-generic-function 'control_type-val :lambda-list '(m))
(cl:defmethod control_type-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:control_type-val is deprecated.  Use panda_gazebo-srv:control_type instead.")
  (control_type m))

(cl:ensure-generic-function 'grasping-val :lambda-list '(m))
(cl:defmethod grasping-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:grasping-val is deprecated.  Use panda_gazebo-srv:grasping instead.")
  (grasping m))

(cl:ensure-generic-function 'arm_wait-val :lambda-list '(m))
(cl:defmethod arm_wait-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:arm_wait-val is deprecated.  Use panda_gazebo-srv:arm_wait instead.")
  (arm_wait m))

(cl:ensure-generic-function 'hand_wait-val :lambda-list '(m))
(cl:defmethod hand_wait-val ((m <SetJointCommands-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:hand_wait-val is deprecated.  Use panda_gazebo-srv:hand_wait instead.")
  (hand_wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetJointCommands-request>) ostream)
  "Serializes a message object of type '<SetJointCommands-request>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_commands))))
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
   (cl:slot-value msg 'joint_commands))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'control_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'control_type))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'grasping) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'arm_wait) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hand_wait) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetJointCommands-request>) istream)
  "Deserializes a message object of type '<SetJointCommands-request>"
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
  (cl:setf (cl:slot-value msg 'joint_commands) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_commands)))
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
      (cl:setf (cl:slot-value msg 'control_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'control_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'grasping) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'arm_wait) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'hand_wait) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetJointCommands-request>)))
  "Returns string type for a service object of type '<SetJointCommands-request>"
  "panda_gazebo/SetJointCommandsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointCommands-request)))
  "Returns string type for a service object of type 'SetJointCommands-request"
  "panda_gazebo/SetJointCommandsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetJointCommands-request>)))
  "Returns md5sum for a message object of type '<SetJointCommands-request>"
  "e45f98ce30463e2aa1e33dd48f97b157")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetJointCommands-request)))
  "Returns md5sum for a message object of type 'SetJointCommands-request"
  "e45f98ce30463e2aa1e33dd48f97b157")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetJointCommands-request>)))
  "Returns full string definition for message of type '<SetJointCommands-request>"
  (cl:format cl:nil "# Service that can be used to control the robot joint positions/efforts using the~%# panda_control_server.~%# NOTE: This is done by publishing the joint commands to the right topics while sending~%# the gripper  width to the 'franka_gripper/move' action service.~%string[] joint_names~%float64[] joint_commands~%string control_type # The control type you want to use for the robot arm. Options are `effort` and `position`.~%bool grasping # If set to true, the gripper 'max_effort' will be set to 10N when not supplied. This will simplify grasping.~%bool arm_wait # Wait till the arm control has completed~%bool hand_wait # Wait till the hand control has completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetJointCommands-request)))
  "Returns full string definition for message of type 'SetJointCommands-request"
  (cl:format cl:nil "# Service that can be used to control the robot joint positions/efforts using the~%# panda_control_server.~%# NOTE: This is done by publishing the joint commands to the right topics while sending~%# the gripper  width to the 'franka_gripper/move' action service.~%string[] joint_names~%float64[] joint_commands~%string control_type # The control type you want to use for the robot arm. Options are `effort` and `position`.~%bool grasping # If set to true, the gripper 'max_effort' will be set to 10N when not supplied. This will simplify grasping.~%bool arm_wait # Wait till the arm control has completed~%bool hand_wait # Wait till the hand control has completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetJointCommands-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_commands) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:length (cl:slot-value msg 'control_type))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetJointCommands-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetJointCommands-request
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':joint_commands (joint_commands msg))
    (cl:cons ':control_type (control_type msg))
    (cl:cons ':grasping (grasping msg))
    (cl:cons ':arm_wait (arm_wait msg))
    (cl:cons ':hand_wait (hand_wait msg))
))
;//! \htmlinclude SetJointCommands-response.msg.html

(cl:defclass <SetJointCommands-response> (roslisp-msg-protocol:ros-message)
  ((success
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

(cl:defclass SetJointCommands-response (<SetJointCommands-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetJointCommands-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetJointCommands-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetJointCommands-response> is deprecated: use panda_gazebo-srv:SetJointCommands-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetJointCommands-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetJointCommands-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetJointCommands-response>) ostream)
  "Serializes a message object of type '<SetJointCommands-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetJointCommands-response>) istream)
  "Deserializes a message object of type '<SetJointCommands-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetJointCommands-response>)))
  "Returns string type for a service object of type '<SetJointCommands-response>"
  "panda_gazebo/SetJointCommandsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointCommands-response)))
  "Returns string type for a service object of type 'SetJointCommands-response"
  "panda_gazebo/SetJointCommandsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetJointCommands-response>)))
  "Returns md5sum for a message object of type '<SetJointCommands-response>"
  "e45f98ce30463e2aa1e33dd48f97b157")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetJointCommands-response)))
  "Returns md5sum for a message object of type 'SetJointCommands-response"
  "e45f98ce30463e2aa1e33dd48f97b157")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetJointCommands-response>)))
  "Returns full string definition for message of type '<SetJointCommands-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetJointCommands-response)))
  "Returns full string definition for message of type 'SetJointCommands-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetJointCommands-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetJointCommands-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetJointCommands-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetJointCommands)))
  'SetJointCommands-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetJointCommands)))
  'SetJointCommands-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetJointCommands)))
  "Returns string type for a service object of type '<SetJointCommands>"
  "panda_gazebo/SetJointCommands")