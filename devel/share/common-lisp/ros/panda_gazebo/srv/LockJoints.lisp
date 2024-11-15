; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude LockJoints-request.msg.html

(cl:defclass <LockJoints-request> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (lock
    :reader lock
    :initarg :lock
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass LockJoints-request (<LockJoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LockJoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LockJoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<LockJoints-request> is deprecated: use panda_gazebo-srv:LockJoints-request instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <LockJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:joint_names-val is deprecated.  Use panda_gazebo-srv:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'lock-val :lambda-list '(m))
(cl:defmethod lock-val ((m <LockJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:lock-val is deprecated.  Use panda_gazebo-srv:lock instead.")
  (lock m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LockJoints-request>) ostream)
  "Serializes a message object of type '<LockJoints-request>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lock) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LockJoints-request>) istream)
  "Deserializes a message object of type '<LockJoints-request>"
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
    (cl:setf (cl:slot-value msg 'lock) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LockJoints-request>)))
  "Returns string type for a service object of type '<LockJoints-request>"
  "panda_gazebo/LockJointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LockJoints-request)))
  "Returns string type for a service object of type 'LockJoints-request"
  "panda_gazebo/LockJointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LockJoints-request>)))
  "Returns md5sum for a message object of type '<LockJoints-request>"
  "c5f1ee92ccf62d5afc6116cb756e3854")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LockJoints-request)))
  "Returns md5sum for a message object of type 'LockJoints-request"
  "c5f1ee92ccf62d5afc6116cb756e3854")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LockJoints-request>)))
  "Returns full string definition for message of type '<LockJoints-request>"
  (cl:format cl:nil "# Service that can be used to lock/unlock specific joints of the robot.~%string[] joint_names~%bool lock~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LockJoints-request)))
  "Returns full string definition for message of type 'LockJoints-request"
  (cl:format cl:nil "# Service that can be used to lock/unlock specific joints of the robot.~%string[] joint_names~%bool lock~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LockJoints-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LockJoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'LockJoints-request
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':lock (lock msg))
))
;//! \htmlinclude LockJoints-response.msg.html

(cl:defclass <LockJoints-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass LockJoints-response (<LockJoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LockJoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LockJoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<LockJoints-response> is deprecated: use panda_gazebo-srv:LockJoints-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <LockJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <LockJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LockJoints-response>) ostream)
  "Serializes a message object of type '<LockJoints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LockJoints-response>) istream)
  "Deserializes a message object of type '<LockJoints-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LockJoints-response>)))
  "Returns string type for a service object of type '<LockJoints-response>"
  "panda_gazebo/LockJointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LockJoints-response)))
  "Returns string type for a service object of type 'LockJoints-response"
  "panda_gazebo/LockJointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LockJoints-response>)))
  "Returns md5sum for a message object of type '<LockJoints-response>"
  "c5f1ee92ccf62d5afc6116cb756e3854")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LockJoints-response)))
  "Returns md5sum for a message object of type 'LockJoints-response"
  "c5f1ee92ccf62d5afc6116cb756e3854")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LockJoints-response>)))
  "Returns full string definition for message of type '<LockJoints-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LockJoints-response)))
  "Returns full string definition for message of type 'LockJoints-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LockJoints-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LockJoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'LockJoints-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'LockJoints)))
  'LockJoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'LockJoints)))
  'LockJoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LockJoints)))
  "Returns string type for a service object of type '<LockJoints>"
  "panda_gazebo/LockJoints")