; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude AddPlane-request.msg.html

(cl:defclass <AddPlane-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (frame_id
    :reader frame_id
    :initarg :frame_id
    :type cl:string
    :initform "")
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (normal
    :reader normal
    :initarg :normal
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (offset
    :reader offset
    :initarg :offset
    :type cl:float
    :initform 0.0))
)

(cl:defclass AddPlane-request (<AddPlane-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddPlane-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddPlane-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<AddPlane-request> is deprecated: use panda_gazebo-srv:AddPlane-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <AddPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:name-val is deprecated.  Use panda_gazebo-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'frame_id-val :lambda-list '(m))
(cl:defmethod frame_id-val ((m <AddPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:frame_id-val is deprecated.  Use panda_gazebo-srv:frame_id instead.")
  (frame_id m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <AddPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:pose-val is deprecated.  Use panda_gazebo-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'normal-val :lambda-list '(m))
(cl:defmethod normal-val ((m <AddPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:normal-val is deprecated.  Use panda_gazebo-srv:normal instead.")
  (normal m))

(cl:ensure-generic-function 'offset-val :lambda-list '(m))
(cl:defmethod offset-val ((m <AddPlane-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:offset-val is deprecated.  Use panda_gazebo-srv:offset instead.")
  (offset m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddPlane-request>) ostream)
  "Serializes a message object of type '<AddPlane-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'normal))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'offset))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddPlane-request>) istream)
  "Deserializes a message object of type '<AddPlane-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (cl:setf (cl:slot-value msg 'normal) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'normal)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'offset) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddPlane-request>)))
  "Returns string type for a service object of type '<AddPlane-request>"
  "panda_gazebo/AddPlaneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddPlane-request)))
  "Returns string type for a service object of type 'AddPlane-request"
  "panda_gazebo/AddPlaneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddPlane-request>)))
  "Returns md5sum for a message object of type '<AddPlane-request>"
  "df1995ac0ca0010f12d98c831ff22d85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddPlane-request)))
  "Returns md5sum for a message object of type 'AddPlane-request"
  "df1995ac0ca0010f12d98c831ff22d85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddPlane-request>)))
  "Returns full string definition for message of type '<AddPlane-request>"
  (cl:format cl:nil "# Service that can be used to add a plane to the planning scene.~%string name~%string frame_id~%geometry_msgs/Pose pose~%float64[3] normal~%float64 offset  # In the direction of the normal~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddPlane-request)))
  "Returns full string definition for message of type 'AddPlane-request"
  (cl:format cl:nil "# Service that can be used to add a plane to the planning scene.~%string name~%string frame_id~%geometry_msgs/Pose pose~%float64[3] normal~%float64 offset  # In the direction of the normal~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddPlane-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'frame_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'normal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddPlane-request>))
  "Converts a ROS message object to a list"
  (cl:list 'AddPlane-request
    (cl:cons ':name (name msg))
    (cl:cons ':frame_id (frame_id msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':normal (normal msg))
    (cl:cons ':offset (offset msg))
))
;//! \htmlinclude AddPlane-response.msg.html

(cl:defclass <AddPlane-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass AddPlane-response (<AddPlane-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AddPlane-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AddPlane-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<AddPlane-response> is deprecated: use panda_gazebo-srv:AddPlane-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <AddPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <AddPlane-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AddPlane-response>) ostream)
  "Serializes a message object of type '<AddPlane-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AddPlane-response>) istream)
  "Deserializes a message object of type '<AddPlane-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AddPlane-response>)))
  "Returns string type for a service object of type '<AddPlane-response>"
  "panda_gazebo/AddPlaneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddPlane-response)))
  "Returns string type for a service object of type 'AddPlane-response"
  "panda_gazebo/AddPlaneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AddPlane-response>)))
  "Returns md5sum for a message object of type '<AddPlane-response>"
  "df1995ac0ca0010f12d98c831ff22d85")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AddPlane-response)))
  "Returns md5sum for a message object of type 'AddPlane-response"
  "df1995ac0ca0010f12d98c831ff22d85")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AddPlane-response>)))
  "Returns full string definition for message of type '<AddPlane-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AddPlane-response)))
  "Returns full string definition for message of type 'AddPlane-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AddPlane-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AddPlane-response>))
  "Converts a ROS message object to a list"
  (cl:list 'AddPlane-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'AddPlane)))
  'AddPlane-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'AddPlane)))
  'AddPlane-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AddPlane)))
  "Returns string type for a service object of type '<AddPlane>"
  "panda_gazebo/AddPlane")