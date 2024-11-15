; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetEe-request.msg.html

(cl:defclass <GetEe-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetEe-request (<GetEe-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEe-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEe-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEe-request> is deprecated: use panda_gazebo-srv:GetEe-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEe-request>) ostream)
  "Serializes a message object of type '<GetEe-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEe-request>) istream)
  "Deserializes a message object of type '<GetEe-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEe-request>)))
  "Returns string type for a service object of type '<GetEe-request>"
  "panda_gazebo/GetEeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEe-request)))
  "Returns string type for a service object of type 'GetEe-request"
  "panda_gazebo/GetEeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEe-request>)))
  "Returns md5sum for a message object of type '<GetEe-request>"
  "0d38e7dfd196a6d5a64530f17deabb47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEe-request)))
  "Returns md5sum for a message object of type 'GetEe-request"
  "0d38e7dfd196a6d5a64530f17deabb47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEe-request>)))
  "Returns full string definition for message of type '<GetEe-request>"
  (cl:format cl:nil "# Service that can be used to get the current EE used in MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEe-request)))
  "Returns full string definition for message of type 'GetEe-request"
  (cl:format cl:nil "# Service that can be used to get the current EE used in MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEe-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEe-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEe-request
))
;//! \htmlinclude GetEe-response.msg.html

(cl:defclass <GetEe-response> (roslisp-msg-protocol:ros-message)
  ((ee_name
    :reader ee_name
    :initarg :ee_name
    :type cl:string
    :initform "")
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

(cl:defclass GetEe-response (<GetEe-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEe-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEe-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEe-response> is deprecated: use panda_gazebo-srv:GetEe-response instead.")))

(cl:ensure-generic-function 'ee_name-val :lambda-list '(m))
(cl:defmethod ee_name-val ((m <GetEe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:ee_name-val is deprecated.  Use panda_gazebo-srv:ee_name instead.")
  (ee_name m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetEe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetEe-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEe-response>) ostream)
  "Serializes a message object of type '<GetEe-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ee_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ee_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEe-response>) istream)
  "Deserializes a message object of type '<GetEe-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ee_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ee_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEe-response>)))
  "Returns string type for a service object of type '<GetEe-response>"
  "panda_gazebo/GetEeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEe-response)))
  "Returns string type for a service object of type 'GetEe-response"
  "panda_gazebo/GetEeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEe-response>)))
  "Returns md5sum for a message object of type '<GetEe-response>"
  "0d38e7dfd196a6d5a64530f17deabb47")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEe-response)))
  "Returns md5sum for a message object of type 'GetEe-response"
  "0d38e7dfd196a6d5a64530f17deabb47")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEe-response>)))
  "Returns full string definition for message of type '<GetEe-response>"
  (cl:format cl:nil "string ee_name~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEe-response)))
  "Returns full string definition for message of type 'GetEe-response"
  (cl:format cl:nil "string ee_name~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEe-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'ee_name))
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEe-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEe-response
    (cl:cons ':ee_name (ee_name msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetEe)))
  'GetEe-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetEe)))
  'GetEe-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEe)))
  "Returns string type for a service object of type '<GetEe>"
  "panda_gazebo/GetEe")