; Auto-generated. Do not edit!


(cl:in-package panda_gazebo-srv)


;//! \htmlinclude GetEeRpy-request.msg.html

(cl:defclass <GetEeRpy-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetEeRpy-request (<GetEeRpy-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEeRpy-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEeRpy-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEeRpy-request> is deprecated: use panda_gazebo-srv:GetEeRpy-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEeRpy-request>) ostream)
  "Serializes a message object of type '<GetEeRpy-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEeRpy-request>) istream)
  "Deserializes a message object of type '<GetEeRpy-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEeRpy-request>)))
  "Returns string type for a service object of type '<GetEeRpy-request>"
  "panda_gazebo/GetEeRpyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEeRpy-request)))
  "Returns string type for a service object of type 'GetEeRpy-request"
  "panda_gazebo/GetEeRpyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEeRpy-request>)))
  "Returns md5sum for a message object of type '<GetEeRpy-request>"
  "e0a899a2a3e84e53d60721d73970d6aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEeRpy-request)))
  "Returns md5sum for a message object of type 'GetEeRpy-request"
  "e0a899a2a3e84e53d60721d73970d6aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEeRpy-request>)))
  "Returns full string definition for message of type '<GetEeRpy-request>"
  (cl:format cl:nil "# Service that can be used to get orientation information about the EE using MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEeRpy-request)))
  "Returns full string definition for message of type 'GetEeRpy-request"
  (cl:format cl:nil "# Service that can be used to get orientation information about the EE using MoveIt.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEeRpy-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEeRpy-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEeRpy-request
))
;//! \htmlinclude GetEeRpy-response.msg.html

(cl:defclass <GetEeRpy-response> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (p
    :reader p
    :initarg :p
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
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

(cl:defclass GetEeRpy-response (<GetEeRpy-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetEeRpy-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetEeRpy-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name panda_gazebo-srv:<GetEeRpy-response> is deprecated: use panda_gazebo-srv:GetEeRpy-response instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <GetEeRpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:r-val is deprecated.  Use panda_gazebo-srv:r instead.")
  (r m))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <GetEeRpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:p-val is deprecated.  Use panda_gazebo-srv:p instead.")
  (p m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <GetEeRpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:y-val is deprecated.  Use panda_gazebo-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetEeRpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:success-val is deprecated.  Use panda_gazebo-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetEeRpy-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader panda_gazebo-srv:message-val is deprecated.  Use panda_gazebo-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetEeRpy-response>) ostream)
  "Serializes a message object of type '<GetEeRpy-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetEeRpy-response>) istream)
  "Deserializes a message object of type '<GetEeRpy-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetEeRpy-response>)))
  "Returns string type for a service object of type '<GetEeRpy-response>"
  "panda_gazebo/GetEeRpyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEeRpy-response)))
  "Returns string type for a service object of type 'GetEeRpy-response"
  "panda_gazebo/GetEeRpyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetEeRpy-response>)))
  "Returns md5sum for a message object of type '<GetEeRpy-response>"
  "e0a899a2a3e84e53d60721d73970d6aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetEeRpy-response)))
  "Returns md5sum for a message object of type 'GetEeRpy-response"
  "e0a899a2a3e84e53d60721d73970d6aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetEeRpy-response>)))
  "Returns full string definition for message of type '<GetEeRpy-response>"
  (cl:format cl:nil "float32 r~%float32 p~%float32 y~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetEeRpy-response)))
  "Returns full string definition for message of type 'GetEeRpy-response"
  (cl:format cl:nil "float32 r~%float32 p~%float32 y~%bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetEeRpy-response>))
  (cl:+ 0
     4
     4
     4
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetEeRpy-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetEeRpy-response
    (cl:cons ':r (r msg))
    (cl:cons ':p (p msg))
    (cl:cons ':y (y msg))
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetEeRpy)))
  'GetEeRpy-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetEeRpy)))
  'GetEeRpy-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetEeRpy)))
  "Returns string type for a service object of type '<GetEeRpy>"
  "panda_gazebo/GetEeRpy")