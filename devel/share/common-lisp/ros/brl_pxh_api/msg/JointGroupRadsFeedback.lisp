; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude JointGroupRadsFeedback.msg.html

(cl:defclass <JointGroupRadsFeedback> (roslisp-msg-protocol:ros-message)
  ((log
    :reader log
    :initarg :log
    :type cl:string
    :initform ""))
)

(cl:defclass JointGroupRadsFeedback (<JointGroupRadsFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointGroupRadsFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointGroupRadsFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<JointGroupRadsFeedback> is deprecated: use brl_pxh_api-msg:JointGroupRadsFeedback instead.")))

(cl:ensure-generic-function 'log-val :lambda-list '(m))
(cl:defmethod log-val ((m <JointGroupRadsFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:log-val is deprecated.  Use brl_pxh_api-msg:log instead.")
  (log m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointGroupRadsFeedback>) ostream)
  "Serializes a message object of type '<JointGroupRadsFeedback>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'log))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'log))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointGroupRadsFeedback>) istream)
  "Deserializes a message object of type '<JointGroupRadsFeedback>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'log) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'log) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointGroupRadsFeedback>)))
  "Returns string type for a message object of type '<JointGroupRadsFeedback>"
  "brl_pxh_api/JointGroupRadsFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointGroupRadsFeedback)))
  "Returns string type for a message object of type 'JointGroupRadsFeedback"
  "brl_pxh_api/JointGroupRadsFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointGroupRadsFeedback>)))
  "Returns md5sum for a message object of type '<JointGroupRadsFeedback>"
  "c3e2a6f3c8b4a69b39bb08b44fadcdca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointGroupRadsFeedback)))
  "Returns md5sum for a message object of type 'JointGroupRadsFeedback"
  "c3e2a6f3c8b4a69b39bb08b44fadcdca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointGroupRadsFeedback>)))
  "Returns full string definition for message of type '<JointGroupRadsFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string log~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointGroupRadsFeedback)))
  "Returns full string definition for message of type 'JointGroupRadsFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string log~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointGroupRadsFeedback>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'log))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointGroupRadsFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'JointGroupRadsFeedback
    (cl:cons ':log (log msg))
))
