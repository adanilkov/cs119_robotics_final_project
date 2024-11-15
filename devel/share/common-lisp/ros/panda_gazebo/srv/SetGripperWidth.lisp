; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude SetGripperWidth-request.msg.html

(cl:defclass <SetGripperWidth-request> (roslisp-msg-protocol:ros-message)
  ((width
    :reader width
    :initarg :width
    :type cl:float
    :initform 0.0)
   (grasping
    :reader grasping
    :initarg :grasping
    :type cl:boolean
    :initform cl:nil)
   (max_effort
    :reader max_effort
    :initarg :max_effort
    :type cl:float
    :initform 0.0)
   (wait
    :reader wait
    :initarg :wait
    :type cl:boolean
    :initform cl:nil)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:real
    :initform 0))
)

(cl:defclass SetGripperWidth-request (<SetGripperWidth-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGripperWidth-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGripperWidth-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetGripperWidth-request> is deprecated: use panda_gazebo-srv:SetGripperWidth-request instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <SetGripperWidth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:width-val is deprecated.  Use panda_gazebo-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'grasping-val :lambda-list '(m))
(cl:defmethod grasping-val ((m <SetGripperWidth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:grasping-val is deprecated.  Use panda_gazebo-srv:grasping instead.")
  (grasping m))

(cl:ensure-generic-function 'max_effort-val :lambda-list '(m))
(cl:defmethod max_effort-val ((m <SetGripperWidth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:max_effort-val is deprecated.  Use panda_gazebo-srv:max_effort instead.")
  (max_effort m))

(cl:ensure-generic-function 'wait-val :lambda-list '(m))
(cl:defmethod wait-val ((m <SetGripperWidth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:wait-val is deprecated.  Use panda_gazebo-srv:wait instead.")
  (wait m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <SetGripperWidth-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:timeout-val is deprecated.  Use panda_gazebo-srv:timeout instead.")
  (timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGripperWidth-request>) ostream)
  "Serializes a message object of type '<SetGripperWidth-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'grasping) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait) 1 0)) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'timeout)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'timeout) (cl:floor (cl:slot-value msg 'timeout)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGripperWidth-request>) istream)
  "Deserializes a message object of type '<SetGripperWidth-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'grasping) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'wait) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeout) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGripperWidth-request>)))
  "Returns string type for a service object of type '<SetGripperWidth-request>"
  "panda_gazebo/SetGripperWidthRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGripperWidth-request)))
  "Returns string type for a service object of type 'SetGripperWidth-request"
  "panda_gazebo/SetGripperWidthRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGripperWidth-request>)))
  "Returns md5sum for a message object of type '<SetGripperWidth-request>"
  "f1391f700eac44a55b7a2011ef94058b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGripperWidth-request)))
  "Returns md5sum for a message object of type 'SetGripperWidth-request"
  "f1391f700eac44a55b7a2011ef94058b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGripperWidth-request>)))
  "Returns full string definition for message of type '<SetGripperWidth-request>"
  (cl:format cl:nil "# Service that can be used to control the robot hand gripper width using the panda_control_server.~%# NOTE: It serves as a small wrapper around the 'franka_gripper/move' action but automatically~%# sets the speed to the maximum speed. It further clips gripper width such that it is within~%# the set max/min boundaries.~%float64 width       # Gripper width - ignored when the gripper is grasping.~%bool grasping       # The gripper simply moves if this is `false` ignoring the 'max_effort'.~%float64 max_effort  # The max effort used by the gripper.~%bool wait~%duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGripperWidth-request)))
  "Returns full string definition for message of type 'SetGripperWidth-request"
  (cl:format cl:nil "# Service that can be used to control the robot hand gripper width using the panda_control_server.~%# NOTE: It serves as a small wrapper around the 'franka_gripper/move' action but automatically~%# sets the speed to the maximum speed. It further clips gripper width such that it is within~%# the set max/min boundaries.~%float64 width       # Gripper width - ignored when the gripper is grasping.~%bool grasping       # The gripper simply moves if this is `false` ignoring the 'max_effort'.~%float64 max_effort  # The max effort used by the gripper.~%bool wait~%duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGripperWidth-request>))
  (cl:+ 0
     8
     1
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGripperWidth-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGripperWidth-request
    (cl:cons ':width (width msg))
    (cl:cons ':grasping (grasping msg))
    (cl:cons ':max_effort (max_effort msg))
    (cl:cons ':wait (wait msg))
    (cl:cons ':timeout (timeout msg))
))
;//! \htmlinclude SetGripperWidth-response.msg.html

(cl:defclass <SetGripperWidth-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetGripperWidth-response (<SetGripperWidth-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetGripperWidth-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetGripperWidth-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetGripperWidth-response> is deprecated: use panda_gazebo-srv:SetGripperWidth-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetGripperWidth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetGripperWidth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetGripperWidth-response>) ostream)
  "Serializes a message object of type '<SetGripperWidth-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetGripperWidth-response>) istream)
  "Deserializes a message object of type '<SetGripperWidth-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetGripperWidth-response>)))
  "Returns string type for a service object of type '<SetGripperWidth-response>"
  "panda_gazebo/SetGripperWidthResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGripperWidth-response)))
  "Returns string type for a service object of type 'SetGripperWidth-response"
  "panda_gazebo/SetGripperWidthResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetGripperWidth-response>)))
  "Returns md5sum for a message object of type '<SetGripperWidth-response>"
  "f1391f700eac44a55b7a2011ef94058b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetGripperWidth-response)))
  "Returns md5sum for a message object of type 'SetGripperWidth-response"
  "f1391f700eac44a55b7a2011ef94058b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetGripperWidth-response>)))
  "Returns full string definition for message of type '<SetGripperWidth-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetGripperWidth-response)))
  "Returns full string definition for message of type 'SetGripperWidth-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetGripperWidth-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetGripperWidth-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetGripperWidth-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetGripperWidth)))
  'SetGripperWidth-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetGripperWidth)))
  'SetGripperWidth-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetGripperWidth)))
  "Returns string type for a service object of type '<SetGripperWidth>"
  "panda_gazebo/SetGripperWidth")