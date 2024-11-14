; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude JointRadGoal.msg.html

(cl:defclass <JointRadGoal> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type cl:float
    :initform 0.0)
   (moving_time
    :reader moving_time
    :initarg :moving_time
    :type cl:float
    :initform 0.0)
   (accel_time
    :reader accel_time
    :initarg :accel_time
    :type cl:float
    :initform 0.0)
   (blocking
    :reader blocking
    :initarg :blocking
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass JointRadGoal (<JointRadGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointRadGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointRadGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<JointRadGoal> is deprecated: use brl_pxh_api-msg:JointRadGoal instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <JointRadGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:joint_name-val is deprecated.  Use brl_pxh_api-msg:joint_name instead.")
  (joint_name m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <JointRadGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:position-val is deprecated.  Use brl_pxh_api-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'moving_time-val :lambda-list '(m))
(cl:defmethod moving_time-val ((m <JointRadGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:moving_time-val is deprecated.  Use brl_pxh_api-msg:moving_time instead.")
  (moving_time m))

(cl:ensure-generic-function 'accel_time-val :lambda-list '(m))
(cl:defmethod accel_time-val ((m <JointRadGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:accel_time-val is deprecated.  Use brl_pxh_api-msg:accel_time instead.")
  (accel_time m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <JointRadGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:blocking-val is deprecated.  Use brl_pxh_api-msg:blocking instead.")
  (blocking m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointRadGoal>) ostream)
  "Serializes a message object of type '<JointRadGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'joint_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'joint_name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'moving_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'accel_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'blocking) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointRadGoal>) istream)
  "Deserializes a message object of type '<JointRadGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'joint_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'joint_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'moving_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accel_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'blocking) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointRadGoal>)))
  "Returns string type for a message object of type '<JointRadGoal>"
  "brl_pxh_api/JointRadGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointRadGoal)))
  "Returns string type for a message object of type 'JointRadGoal"
  "brl_pxh_api/JointRadGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointRadGoal>)))
  "Returns md5sum for a message object of type '<JointRadGoal>"
  "4e2eff58f579aff3380de47294f5becc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointRadGoal)))
  "Returns md5sum for a message object of type 'JointRadGoal"
  "4e2eff58f579aff3380de47294f5becc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointRadGoal>)))
  "Returns full string definition for message of type '<JointRadGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%string joint_name~%float32 position~%float32 moving_time~%float32 accel_time~%bool blocking ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointRadGoal)))
  "Returns full string definition for message of type 'JointRadGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%string joint_name~%float32 position~%float32 moving_time~%float32 accel_time~%bool blocking ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointRadGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'joint_name))
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointRadGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'JointRadGoal
    (cl:cons ':joint_name (joint_name msg))
    (cl:cons ':position (position msg))
    (cl:cons ':moving_time (moving_time msg))
    (cl:cons ':accel_time (accel_time msg))
    (cl:cons ':blocking (blocking msg))
))
