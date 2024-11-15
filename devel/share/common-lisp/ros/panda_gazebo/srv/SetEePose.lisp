; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude SetEePose-request.msg.html

(cl:defclass <SetEePose-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass SetEePose-request (<SetEePose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEePose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEePose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetEePose-request> is deprecated: use panda_gazebo-srv:SetEePose-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <SetEePose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:pose-val is deprecated.  Use panda_gazebo-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEePose-request>) ostream)
  "Serializes a message object of type '<SetEePose-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEePose-request>) istream)
  "Deserializes a message object of type '<SetEePose-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEePose-request>)))
  "Returns string type for a service object of type '<SetEePose-request>"
  "panda_gazebo/SetEePoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEePose-request)))
  "Returns string type for a service object of type 'SetEePose-request"
  "panda_gazebo/SetEePoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEePose-request>)))
  "Returns md5sum for a message object of type '<SetEePose-request>"
  "28e4dd667b29bd35b516ba1d379b7529")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEePose-request)))
  "Returns md5sum for a message object of type 'SetEePose-request"
  "28e4dd667b29bd35b516ba1d379b7529")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEePose-request>)))
  "Returns full string definition for message of type '<SetEePose-request>"
  (cl:format cl:nil "# Service that can be used to set the current EE pose and control the robot using~%# MoveIt.~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEePose-request)))
  "Returns full string definition for message of type 'SetEePose-request"
  (cl:format cl:nil "# Service that can be used to set the current EE pose and control the robot using~%# MoveIt.~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEePose-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEePose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEePose-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude SetEePose-response.msg.html

(cl:defclass <SetEePose-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetEePose-response (<SetEePose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEePose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEePose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetEePose-response> is deprecated: use panda_gazebo-srv:SetEePose-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEePose-response>) ostream)
  "Serializes a message object of type '<SetEePose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEePose-response>) istream)
  "Deserializes a message object of type '<SetEePose-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEePose-response>)))
  "Returns string type for a service object of type '<SetEePose-response>"
  "panda_gazebo/SetEePoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEePose-response)))
  "Returns string type for a service object of type 'SetEePose-response"
  "panda_gazebo/SetEePoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEePose-response>)))
  "Returns md5sum for a message object of type '<SetEePose-response>"
  "28e4dd667b29bd35b516ba1d379b7529")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEePose-response)))
  "Returns md5sum for a message object of type 'SetEePose-response"
  "28e4dd667b29bd35b516ba1d379b7529")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEePose-response>)))
  "Returns full string definition for message of type '<SetEePose-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEePose-response)))
  "Returns full string definition for message of type 'SetEePose-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEePose-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEePose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEePose-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEePose)))
  'SetEePose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEePose)))
  'SetEePose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEePose)))
  "Returns string type for a service object of type '<SetEePose>"
  "panda_gazebo/SetEePose")