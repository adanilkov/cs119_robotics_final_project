; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetControlledJoints-request.msg.html

(cl:defclass <GetControlledJoints-request> (roslisp-msg-protocol:ros-message)
  ((control_type
    :reader control_type
    :initarg :control_type
    :type cl:string
    :initform ""))
)

(cl:defclass GetControlledJoints-request (<GetControlledJoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetControlledJoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetControlledJoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetControlledJoints-request> is deprecated: use panda_gazebo-srv:GetControlledJoints-request instead.")))

(cl:ensure-generic-function 'control_type-val :lambda-list '(m))
(cl:defmethod control_type-val ((m <GetControlledJoints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:control_type-val is deprecated.  Use panda_gazebo-srv:control_type instead.")
  (control_type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetControlledJoints-request>) ostream)
  "Serializes a message object of type '<GetControlledJoints-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'control_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'control_type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetControlledJoints-request>) istream)
  "Deserializes a message object of type '<GetControlledJoints-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'control_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'control_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetControlledJoints-request>)))
  "Returns string type for a service object of type '<GetControlledJoints-request>"
  "panda_gazebo/GetControlledJointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetControlledJoints-request)))
  "Returns string type for a service object of type 'GetControlledJoints-request"
  "panda_gazebo/GetControlledJointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetControlledJoints-request>)))
  "Returns md5sum for a message object of type '<GetControlledJoints-request>"
  "c0fa937e297125af5ab96e86caa683cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetControlledJoints-request)))
  "Returns md5sum for a message object of type 'GetControlledJoints-request"
  "c0fa937e297125af5ab96e86caa683cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetControlledJoints-request>)))
  "Returns full string definition for message of type '<GetControlledJoints-request>"
  (cl:format cl:nil "# Service that can be used to retrieve the joints that are controlled for a given~%# control type.~%string control_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetControlledJoints-request)))
  "Returns full string definition for message of type 'GetControlledJoints-request"
  (cl:format cl:nil "# Service that can be used to retrieve the joints that are controlled for a given~%# control type.~%string control_type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetControlledJoints-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'control_type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetControlledJoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetControlledJoints-request
    (cl:cons ':control_type (control_type msg))
))
;//! \htmlinclude GetControlledJoints-response.msg.html

(cl:defclass <GetControlledJoints-response> (roslisp-msg-protocol:ros-message)
  ((controlled_joints
    :reader controlled_joints
    :initarg :controlled_joints
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (controlled_joints_arm
    :reader controlled_joints_arm
    :initarg :controlled_joints_arm
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (controlled_joints_hand
    :reader controlled_joints_hand
    :initarg :controlled_joints_hand
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
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

(cl:defclass GetControlledJoints-response (<GetControlledJoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetControlledJoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetControlledJoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetControlledJoints-response> is deprecated: use panda_gazebo-srv:GetControlledJoints-response instead.")))

(cl:ensure-generic-function 'controlled_joints-val :lambda-list '(m))
(cl:defmethod controlled_joints-val ((m <GetControlledJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:controlled_joints-val is deprecated.  Use panda_gazebo-srv:controlled_joints instead.")
  (controlled_joints m))

(cl:ensure-generic-function 'controlled_joints_arm-val :lambda-list '(m))
(cl:defmethod controlled_joints_arm-val ((m <GetControlledJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:controlled_joints_arm-val is deprecated.  Use panda_gazebo-srv:controlled_joints_arm instead.")
  (controlled_joints_arm m))

(cl:ensure-generic-function 'controlled_joints_hand-val :lambda-list '(m))
(cl:defmethod controlled_joints_hand-val ((m <GetControlledJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:controlled_joints_hand-val is deprecated.  Use panda_gazebo-srv:controlled_joints_hand instead.")
  (controlled_joints_hand m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetControlledJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetControlledJoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetControlledJoints-response>) ostream)
  "Serializes a message object of type '<GetControlledJoints-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controlled_joints))))
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
   (cl:slot-value msg 'controlled_joints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controlled_joints_arm))))
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
   (cl:slot-value msg 'controlled_joints_arm))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'controlled_joints_hand))))
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
   (cl:slot-value msg 'controlled_joints_hand))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetControlledJoints-response>) istream)
  "Deserializes a message object of type '<GetControlledJoints-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'controlled_joints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controlled_joints)))
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
  (cl:setf (cl:slot-value msg 'controlled_joints_arm) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controlled_joints_arm)))
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
  (cl:setf (cl:slot-value msg 'controlled_joints_hand) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'controlled_joints_hand)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetControlledJoints-response>)))
  "Returns string type for a service object of type '<GetControlledJoints-response>"
  "panda_gazebo/GetControlledJointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetControlledJoints-response)))
  "Returns string type for a service object of type 'GetControlledJoints-response"
  "panda_gazebo/GetControlledJointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetControlledJoints-response>)))
  "Returns md5sum for a message object of type '<GetControlledJoints-response>"
  "c0fa937e297125af5ab96e86caa683cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetControlledJoints-response)))
  "Returns md5sum for a message object of type 'GetControlledJoints-response"
  "c0fa937e297125af5ab96e86caa683cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetControlledJoints-response>)))
  "Returns full string definition for message of type '<GetControlledJoints-response>"
  (cl:format cl:nil "string[] controlled_joints~%string[] controlled_joints_arm~%string[] controlled_joints_hand~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetControlledJoints-response)))
  "Returns full string definition for message of type 'GetControlledJoints-response"
  (cl:format cl:nil "string[] controlled_joints~%string[] controlled_joints_arm~%string[] controlled_joints_hand~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetControlledJoints-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controlled_joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controlled_joints_arm) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'controlled_joints_hand) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetControlledJoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetControlledJoints-response
    (cl:cons ':controlled_joints (controlled_joints msg))
    (cl:cons ':controlled_joints_arm (controlled_joints_arm msg))
    (cl:cons ':controlled_joints_hand (controlled_joints_hand msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetControlledJoints)))
  'GetControlledJoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetControlledJoints)))
  'GetControlledJoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetControlledJoints)))
  "Returns string type for a service object of type '<GetControlledJoints>"
  "panda_gazebo/GetControlledJoints")