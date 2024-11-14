; Auto-generated. Do not edit!


(cl:in-package brl_pxh_api-msg)


;//! \htmlinclude JointGroupRadsGoal.msg.html

(cl:defclass <JointGroupRadsGoal> (roslisp-msg-protocol:ros-message)
  ((joint_positions
    :reader joint_positions
    :initarg :joint_positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
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

(cl:defclass JointGroupRadsGoal (<JointGroupRadsGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointGroupRadsGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointGroupRadsGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name brl_pxh_api-msg:<JointGroupRadsGoal> is deprecated: use brl_pxh_api-msg:JointGroupRadsGoal instead.")))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <JointGroupRadsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:joint_positions-val is deprecated.  Use brl_pxh_api-msg:joint_positions instead.")
  (joint_positions m))

(cl:ensure-generic-function 'moving_time-val :lambda-list '(m))
(cl:defmethod moving_time-val ((m <JointGroupRadsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:moving_time-val is deprecated.  Use brl_pxh_api-msg:moving_time instead.")
  (moving_time m))

(cl:ensure-generic-function 'accel_time-val :lambda-list '(m))
(cl:defmethod accel_time-val ((m <JointGroupRadsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:accel_time-val is deprecated.  Use brl_pxh_api-msg:accel_time instead.")
  (accel_time m))

(cl:ensure-generic-function 'blocking-val :lambda-list '(m))
(cl:defmethod blocking-val ((m <JointGroupRadsGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader brl_pxh_api-msg:blocking-val is deprecated.  Use brl_pxh_api-msg:blocking instead.")
  (blocking m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointGroupRadsGoal>) ostream)
  "Serializes a message object of type '<JointGroupRadsGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_positions))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointGroupRadsGoal>) istream)
  "Deserializes a message object of type '<JointGroupRadsGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointGroupRadsGoal>)))
  "Returns string type for a message object of type '<JointGroupRadsGoal>"
  "brl_pxh_api/JointGroupRadsGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointGroupRadsGoal)))
  "Returns string type for a message object of type 'JointGroupRadsGoal"
  "brl_pxh_api/JointGroupRadsGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointGroupRadsGoal>)))
  "Returns md5sum for a message object of type '<JointGroupRadsGoal>"
  "a60ad48bfbf8b530fe8dd3f8c58bce45")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointGroupRadsGoal)))
  "Returns md5sum for a message object of type 'JointGroupRadsGoal"
  "a60ad48bfbf8b530fe8dd3f8c58bce45")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointGroupRadsGoal>)))
  "Returns full string definition for message of type '<JointGroupRadsGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32[] joint_positions~%float32 moving_time~%float32 accel_time~%bool blocking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointGroupRadsGoal)))
  "Returns full string definition for message of type 'JointGroupRadsGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%float32[] joint_positions~%float32 moving_time~%float32 accel_time~%bool blocking~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointGroupRadsGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointGroupRadsGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'JointGroupRadsGoal
    (cl:cons ':joint_positions (joint_positions msg))
    (cl:cons ':moving_time (moving_time msg))
    (cl:cons ':accel_time (accel_time msg))
    (cl:cons ':blocking (blocking msg))
))
