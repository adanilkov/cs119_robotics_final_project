; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude EePoseCompGoal.msg.html

(cl:defclass <EePoseCompGoal> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (execute
    :reader execute
    :initarg :execute
    :type cl:boolean
    :initform cl:nil)
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

(cl:defclass EePoseCompGoal (<EePoseCompGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EePoseCompGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EePoseCompGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<EePoseCompGoal> is deprecated: use brl_pxh_api-msg:EePoseCompGoal instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:x-val is deprecated.  Use brl_pxh_api-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:z-val is deprecated.  Use brl_pxh_api-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:roll-val is deprecated.  Use brl_pxh_api-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:pitch-val is deprecated.  Use brl_pxh_api-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'execute-val :lambda-list '(m))
(cl:defmethod execute-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:execute-val is deprecated.  Use brl_pxh_api-msg:execute instead.")
  (execute m))

(cl:ensure-generic-function 'moving_time-val :lambda-list '(m))
(cl:defmethod moving_time-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:moving_time-val is deprecated.  Use brl_pxh_api-msg:moving_time instead.")
  (moving_time m))

(cl:ensure-generic-function 'accel_time-val :lambda-list '(m))
(cl:defmethod accel_time-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:accel_time-val is deprecated.  Use brl_pxh_api-msg:accel_time instead.")
  (accel_time m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <EePoseCompGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:blocking-val is deprecated.  Use brl_pxh_api-msg:blocking instead.")
  (blocking m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EePoseCompGoal>) ostream)
  "Serializes a message object of type '<EePoseCompGoal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'execute) 1 0)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EePoseCompGoal>) istream)
  "Deserializes a message object of type '<EePoseCompGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'execute) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EePoseCompGoal>)))
  "Returns string type for a message object of type '<EePoseCompGoal>"
  "brl_pxh_api/EePoseCompGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EePoseCompGoal)))
  "Returns string type for a message object of type 'EePoseCompGoal"
  "brl_pxh_api/EePoseCompGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EePoseCompGoal>)))
  "Returns md5sum for a message object of type '<EePoseCompGoal>"
  "7d4193829330657a5eee6b3438daef12")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EePoseCompGoal)))
  "Returns md5sum for a message object of type 'EePoseCompGoal"
  "7d4193829330657a5eee6b3438daef12")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EePoseCompGoal>)))
  "Returns full string definition for message of type '<EePoseCompGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32 x~%float32 z~%float32 roll~%float32 pitch~%bool execute~%float32 moving_time~%float32 accel_time ~%bool blocking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EePoseCompGoal)))
  "Returns full string definition for message of type 'EePoseCompGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32 x~%float32 z~%float32 roll~%float32 pitch~%bool execute~%float32 moving_time~%float32 accel_time ~%bool blocking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EePoseCompGoal>))
  (cl:+ 0
     4
     4
     4
     4
     1
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EePoseCompGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'EePoseCompGoal
    (cl:cons ':x (x msg))
    (cl:cons ':z (z msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':execute (execute msg))
    (cl:cons ':moving_time (moving_time msg))
    (cl:cons ':accel_time (accel_time msg))
    (cl:cons ':blocking (blocking msg))
))
