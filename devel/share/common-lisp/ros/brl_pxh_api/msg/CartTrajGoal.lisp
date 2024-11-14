; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude CartTrajGoal.msg.html

(cl:defclass <CartTrajGoal> (roslisp-msg-protocol:ros-message)
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
   (moving_time
    :reader moving_time
    :initarg :moving_time
    :type cl:float
    :initform 0.0)
   (wp_moving_time
    :reader wp_moving_time
    :initarg :wp_moving_time
    :type cl:float
    :initform 0.0)
   (wp_accel_time
    :reader wp_accel_time
    :initarg :wp_accel_time
    :type cl:float
    :initform 0.0)
   (wp_period
    :reader wp_period
    :initarg :wp_period
    :type cl:float
    :initform 0.0))
)

(cl:defclass CartTrajGoal (<CartTrajGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartTrajGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartTrajGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<CartTrajGoal> is deprecated: use brl_pxh_api-msg:CartTrajGoal instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:x-val is deprecated.  Use brl_pxh_api-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:z-val is deprecated.  Use brl_pxh_api-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:roll-val is deprecated.  Use brl_pxh_api-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:pitch-val is deprecated.  Use brl_pxh_api-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'moving_time-val :lambda-list '(m))
(cl:defmethod moving_time-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:moving_time-val is deprecated.  Use brl_pxh_api-msg:moving_time instead.")
  (moving_time m))

(cl:ensure-generic-function 'wp_moving_time-val :lambda-list '(m))
(cl:defmethod wp_moving_time-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:wp_moving_time-val is deprecated.  Use brl_pxh_api-msg:wp_moving_time instead.")
  (wp_moving_time m))

(cl:ensure-generic-function 'wp_accel_time-val :lambda-list '(m))
(cl:defmethod wp_accel_time-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:wp_accel_time-val is deprecated.  Use brl_pxh_api-msg:wp_accel_time instead.")
  (wp_accel_time m))

(cl:ensure-generic-function 'wp_period-val :lambda-list '(m))
(cl:defmethod wp_period-val ((m <CartTrajGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:wp_period-val is deprecated.  Use brl_pxh_api-msg:wp_period instead.")
  (wp_period m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartTrajGoal>) ostream)
  "Serializes a message object of type '<CartTrajGoal>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'moving_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wp_moving_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wp_accel_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wp_period))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartTrajGoal>) istream)
  "Deserializes a message object of type '<CartTrajGoal>"
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
    (cl:setf (cl:slot-value msg 'wp_moving_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wp_accel_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wp_period) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartTrajGoal>)))
  "Returns string type for a message object of type '<CartTrajGoal>"
  "brl_pxh_api/CartTrajGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartTrajGoal)))
  "Returns string type for a message object of type 'CartTrajGoal"
  "brl_pxh_api/CartTrajGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartTrajGoal>)))
  "Returns md5sum for a message object of type '<CartTrajGoal>"
  "db3424a7a9bc8795db95e0a23d1c2e25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartTrajGoal)))
  "Returns md5sum for a message object of type 'CartTrajGoal"
  "db3424a7a9bc8795db95e0a23d1c2e25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartTrajGoal>)))
  "Returns full string definition for message of type '<CartTrajGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32 x~%float32 z~%float32 roll~%float32 pitch~%float32 moving_time~%float32 wp_moving_time~%float32 wp_accel_time~%float32 wp_period~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartTrajGoal)))
  "Returns full string definition for message of type 'CartTrajGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32 x~%float32 z~%float32 roll~%float32 pitch~%float32 moving_time~%float32 wp_moving_time~%float32 wp_accel_time~%float32 wp_period~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartTrajGoal>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartTrajGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'CartTrajGoal
    (cl:cons ':x (x msg))
    (cl:cons ':z (z msg))
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':moving_time (moving_time msg))
    (cl:cons ':wp_moving_time (wp_moving_time msg))
    (cl:cons ':wp_accel_time (wp_accel_time msg))
    (cl:cons ':wp_period (wp_period msg))
))
