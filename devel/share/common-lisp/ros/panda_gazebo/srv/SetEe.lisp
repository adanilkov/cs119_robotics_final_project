; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude SetEe-request.msg.html

(cl:defclass <SetEe-request> (roslisp-msg-protocol:ros-message)
  ((ee_name
    :reader ee_name
    :initarg :ee_name
    :type cl:string
    :initform ""))
)

(cl:defclass SetEe-request (<SetEe-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEe-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEe-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetEe-request> is deprecated: use panda_gazebo-srv:SetEe-request instead.")))

(cl:ensure-generic-function 'ee_name-val :lambda-list '(m))
(cl:defmethod ee_name-val ((m <SetEe-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:ee_name-val is deprecated.  Use panda_gazebo-srv:ee_name instead.")
  (ee_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEe-request>) ostream)
  "Serializes a message object of type '<SetEe-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ee_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ee_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEe-request>) istream)
  "Deserializes a message object of type '<SetEe-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ee_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ee_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEe-request>)))
  "Returns string type for a service object of type '<SetEe-request>"
  "panda_gazebo/SetEeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEe-request)))
  "Returns string type for a service object of type 'SetEe-request"
  "panda_gazebo/SetEeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEe-request>)))
  "Returns md5sum for a message object of type '<SetEe-request>"
  "9966df81bf9b15c45e8f850d588fc889")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEe-request)))
  "Returns md5sum for a message object of type 'SetEe-request"
  "9966df81bf9b15c45e8f850d588fc889")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEe-request>)))
  "Returns full string definition for message of type '<SetEe-request>"
  (cl:format cl:nil "# Service that can be used to set the current EE used in MoveIt.~%string ee_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEe-request)))
  "Returns full string definition for message of type 'SetEe-request"
  (cl:format cl:nil "# Service that can be used to set the current EE used in MoveIt.~%string ee_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEe-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'ee_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEe-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEe-request
    (cl:cons ':ee_name (ee_name msg))
))
;//! \htmlinclude SetEe-response.msg.html

(cl:defclass <SetEe-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetEe-response (<SetEe-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetEe-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetEe-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<SetEe-response> is deprecated: use panda_gazebo-srv:SetEe-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetEe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetEe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetEe-response>) ostream)
  "Serializes a message object of type '<SetEe-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetEe-response>) istream)
  "Deserializes a message object of type '<SetEe-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetEe-response>)))
  "Returns string type for a service object of type '<SetEe-response>"
  "panda_gazebo/SetEeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEe-response)))
  "Returns string type for a service object of type 'SetEe-response"
  "panda_gazebo/SetEeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetEe-response>)))
  "Returns md5sum for a message object of type '<SetEe-response>"
  "9966df81bf9b15c45e8f850d588fc889")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetEe-response)))
  "Returns md5sum for a message object of type 'SetEe-response"
  "9966df81bf9b15c45e8f850d588fc889")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetEe-response>)))
  "Returns full string definition for message of type '<SetEe-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetEe-response)))
  "Returns full string definition for message of type 'SetEe-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetEe-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetEe-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetEe-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetEe)))
  'SetEe-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetEe)))
  'SetEe-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetEe)))
  "Returns string type for a service object of type '<SetEe>"
  "panda_gazebo/SetEe")