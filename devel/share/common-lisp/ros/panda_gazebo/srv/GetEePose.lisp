; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetEePose-request.msg.html

(cl:defclass <GetEePose-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetEePose-request (<GetEePose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEePose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEePose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEePose-request> is deprecated: use panda_gazebo-srv:GetEePose-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEePose-request>) ostream)
  "Serializes a message object of type '<GetEePose-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEePose-request>) istream)
  "Deserializes a message object of type '<GetEePose-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEePose-request>)))
  "Returns string type for a service object of type '<GetEePose-request>"
  "panda_gazebo/GetEePoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePose-request)))
  "Returns string type for a service object of type 'GetEePose-request"
  "panda_gazebo/GetEePoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEePose-request>)))
  "Returns md5sum for a message object of type '<GetEePose-request>"
  "37e6739d5ca462eb4146d24e3044b114")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEePose-request)))
  "Returns md5sum for a message object of type 'GetEePose-request"
  "37e6739d5ca462eb4146d24e3044b114")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEePose-request>)))
  "Returns full string definition for message of type '<GetEePose-request>"
  (cl:format cl:nil "# Service that can be used to get pose information about the EE using MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEePose-request)))
  "Returns full string definition for message of type 'GetEePose-request"
  (cl:format cl:nil "# Service that can be used to get pose information about the EE using MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEePose-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEePose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEePose-request
))
;//! \htmlinclude GetEePose-response.msg.html

(cl:defclass <GetEePose-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
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

(cl:defclass GetEePose-response (<GetEePose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEePose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEePose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEePose-response> is deprecated: use panda_gazebo-srv:GetEePose-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <GetEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:pose-val is deprecated.  Use panda_gazebo-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEePose-response>) ostream)
  "Serializes a message object of type '<GetEePose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEePose-response>) istream)
  "Deserializes a message object of type '<GetEePose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEePose-response>)))
  "Returns string type for a service object of type '<GetEePose-response>"
  "panda_gazebo/GetEePoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePose-response)))
  "Returns string type for a service object of type 'GetEePose-response"
  "panda_gazebo/GetEePoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEePose-response>)))
  "Returns md5sum for a message object of type '<GetEePose-response>"
  "37e6739d5ca462eb4146d24e3044b114")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEePose-response)))
  "Returns md5sum for a message object of type 'GetEePose-response"
  "37e6739d5ca462eb4146d24e3044b114")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEePose-response>)))
  "Returns full string definition for message of type '<GetEePose-response>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%bool success~%string message~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEePose-response)))
  "Returns full string definition for message of type 'GetEePose-response"
  (cl:format cl:nil "geometry_msgs/Pose pose~%bool success~%string message~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEePose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEePose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEePose-response
    (cl:cons ':pose (pose msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetEePose)))
  'GetEePose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetEePose)))
  'GetEePose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEePose)))
  "Returns string type for a service object of type '<GetEePose>"
  "panda_gazebo/GetEePose")