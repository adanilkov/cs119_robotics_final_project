; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude CartTrajFeedback.msg.html

(cl:defclass <CartTrajFeedback> (roslisp-msg-protocol:ros-message)
  ((log
    :reader log
    :initarg :log
    :type cl:string
    :initform ""))
)

(cl:defclass CartTrajFeedback (<CartTrajFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartTrajFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartTrajFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<CartTrajFeedback> is deprecated: use brl_pxh_api-msg:CartTrajFeedback instead.")))

(cl:ensure-generic-function 'log-val :lambda-list '(m))
(cl:defmethod log-val ((m <CartTrajFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:log-val is deprecated.  Use brl_pxh_api-msg:log instead.")
  (log m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartTrajFeedback>) ostream)
  "Serializes a message object of type '<CartTrajFeedback>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'log))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'log))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartTrajFeedback>) istream)
  "Deserializes a message object of type '<CartTrajFeedback>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartTrajFeedback>)))
  "Returns string type for a message object of type '<CartTrajFeedback>"
  "brl_pxh_api/CartTrajFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartTrajFeedback)))
  "Returns string type for a message object of type 'CartTrajFeedback"
  "brl_pxh_api/CartTrajFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartTrajFeedback>)))
  "Returns md5sum for a message object of type '<CartTrajFeedback>"
  "c3e2a6f3c8b4a69b39bb08b44fadcdca")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartTrajFeedback)))
  "Returns md5sum for a message object of type 'CartTrajFeedback"
  "c3e2a6f3c8b4a69b39bb08b44fadcdca")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartTrajFeedback>)))
  "Returns full string definition for message of type '<CartTrajFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string log~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartTrajFeedback)))
  "Returns full string definition for message of type 'CartTrajFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string log~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartTrajFeedback>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'log))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartTrajFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'CartTrajFeedback
    (cl:cons ':log (log msg))
))
