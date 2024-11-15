; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetRandomEePose-request.msg.html

(cl:defclass <GetRandomEePose-request> (roslisp-msg-protocol:ros-message)
  ((bounding_region
    :reader bounding_region
    :initarg :bounding_region
    :type panda_gazebo-msg:BoundingRegion
    :initform (cl:make-instance 'panda_gazebo-msg:BoundingRegion))
   (attempts
    :reader attempts
    :initarg :attempts
    :type cl:integer
    :initform 0))
)

(cl:defclass GetRandomEePose-request (<GetRandomEePose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRandomEePose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRandomEePose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetRandomEePose-request> is deprecated: use panda_gazebo-srv:GetRandomEePose-request instead.")))

(cl:ensure-generic-function 'bounding_region-val :lambda-list '(m))
(cl:defmethod bounding_region-val ((m <GetRandomEePose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:bounding_region-val is deprecated.  Use panda_gazebo-srv:bounding_region instead.")
  (bounding_region m))

(cl:ensure-generic-function 'attempts-val :lambda-list '(m))
(cl:defmethod attempts-val ((m <GetRandomEePose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:attempts-val is deprecated.  Use panda_gazebo-srv:attempts instead.")
  (attempts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRandomEePose-request>) ostream)
  "Serializes a message object of type '<GetRandomEePose-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_region) ostream)
  (cl:let* ((signed (cl:slot-value msg 'attempts)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRandomEePose-request>) istream)
  "Deserializes a message object of type '<GetRandomEePose-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_region) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'attempts) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRandomEePose-request>)))
  "Returns string type for a service object of type '<GetRandomEePose-request>"
  "panda_gazebo/GetRandomEePoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomEePose-request)))
  "Returns string type for a service object of type 'GetRandomEePose-request"
  "panda_gazebo/GetRandomEePoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRandomEePose-request>)))
  "Returns md5sum for a message object of type '<GetRandomEePose-request>"
  "d52fb2aef180d014e1bace1ad112db90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRandomEePose-request)))
  "Returns md5sum for a message object of type 'GetRandomEePose-request"
  "d52fb2aef180d014e1bace1ad112db90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRandomEePose-request>)))
  "Returns full string definition for message of type '<GetRandomEePose-request>"
  (cl:format cl:nil "# Service that can be used to get a valid EE pose for the robot.~%BoundingRegion bounding_region~%int32 attempts~%~%================================================================================~%MSG: panda_gazebo/BoundingRegion~%# Message used to define a bounding region by its min/max x,y z values.~%float64 x_min~%float64 x_max~%float64 y_min~%float64 y_max~%float64 z_min~%float64 z_max~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRandomEePose-request)))
  "Returns full string definition for message of type 'GetRandomEePose-request"
  (cl:format cl:nil "# Service that can be used to get a valid EE pose for the robot.~%BoundingRegion bounding_region~%int32 attempts~%~%================================================================================~%MSG: panda_gazebo/BoundingRegion~%# Message used to define a bounding region by its min/max x,y z values.~%float64 x_min~%float64 x_max~%float64 y_min~%float64 y_max~%float64 z_min~%float64 z_max~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRandomEePose-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_region))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRandomEePose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRandomEePose-request
    (cl:cons ':bounding_region (bounding_region msg))
    (cl:cons ':attempts (attempts msg))
))
;//! \htmlinclude GetRandomEePose-response.msg.html

(cl:defclass <GetRandomEePose-response> (roslisp-msg-protocol:ros-message)
  ((ee_pose
    :reader ee_pose
    :initarg :ee_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (joint_names
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

(cl:defclass GetRandomEePose-response (<GetRandomEePose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRandomEePose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRandomEePose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetRandomEePose-response> is deprecated: use panda_gazebo-srv:GetRandomEePose-response instead.")))

(cl:ensure-generic-function 'ee_pose-val :lambda-list '(m))
(cl:defmethod ee_pose-val ((m <GetRandomEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:ee_pose-val is deprecated.  Use panda_gazebo-srv:ee_pose instead.")
  (ee_pose m))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <GetRandomEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_names-val is deprecated.  Use panda_gazebo-srv:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <GetRandomEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_positions-val is deprecated.  Use panda_gazebo-srv:joint_positions instead.")
  (joint_positions m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetRandomEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetRandomEePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRandomEePose-response>) ostream)
  "Serializes a message object of type '<GetRandomEePose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ee_pose) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRandomEePose-response>) istream)
  "Deserializes a message object of type '<GetRandomEePose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ee_pose) istream)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRandomEePose-response>)))
  "Returns string type for a service object of type '<GetRandomEePose-response>"
  "panda_gazebo/GetRandomEePoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomEePose-response)))
  "Returns string type for a service object of type 'GetRandomEePose-response"
  "panda_gazebo/GetRandomEePoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRandomEePose-response>)))
  "Returns md5sum for a message object of type '<GetRandomEePose-response>"
  "d52fb2aef180d014e1bace1ad112db90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRandomEePose-response)))
  "Returns md5sum for a message object of type 'GetRandomEePose-response"
  "d52fb2aef180d014e1bace1ad112db90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRandomEePose-response>)))
  "Returns full string definition for message of type '<GetRandomEePose-response>"
  (cl:format cl:nil "geometry_msgs/Pose ee_pose~%string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRandomEePose-response)))
  "Returns full string definition for message of type 'GetRandomEePose-response"
  (cl:format cl:nil "geometry_msgs/Pose ee_pose~%string[] joint_names~%float64[] joint_positions~%bool success~%string message~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRandomEePose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ee_pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRandomEePose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRandomEePose-response
    (cl:cons ':ee_pose (ee_pose msg))
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':joint_positions (joint_positions msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRandomEePose)))
  'GetRandomEePose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRandomEePose)))
  'GetRandomEePose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRandomEePose)))
  "Returns string type for a service object of type '<GetRandomEePose>"
  "panda_gazebo/GetRandomEePose")