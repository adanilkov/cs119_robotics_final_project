;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetEePoseJointConfig)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetEePoseJointConfig (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIG")
  (make-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIG"))
(unless (find-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIGREQUEST")
  (make-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIGREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIGRESPONSE")
  (make-package "PANDA_GAZEBO::GETEEPOSEJOINTCONFIGRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass panda_gazebo::GetEePoseJointConfigRequest
  :super ros::object
  :slots (_pose _attempts ))

(defmethod panda_gazebo::GetEePoseJointConfigRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:attempts __attempts) 0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _attempts (round __attempts))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:attempts
   (&optional __attempts)
   (if __attempts (setq _attempts __attempts)) _attempts)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; int32 _attempts
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; int32 _attempts
       (write-long _attempts s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; int32 _attempts
     (setq _attempts (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass panda_gazebo::GetEePoseJointConfigResponse
  :super ros::object
  :slots (_joint_names _joint_positions _success _message ))

(defmethod panda_gazebo::GetEePoseJointConfigResponse
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_positions __joint_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _joint_positions __joint_positions)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:joint_positions
   (&optional __joint_positions)
   (if __joint_positions (setq _joint_positions __joint_positions)) _joint_positions)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; float64[] _joint_positions
    (* 8    (length _joint_positions)) 4
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float64[] _joint_positions
     (write-long (length _joint_positions) s)
     (dotimes (i (length _joint_positions))
       (sys::poke (elt _joint_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float64[] _joint_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetEePoseJointConfig
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetEePoseJointConfig :md5sum-) "b9c46dcb95c6798588db6a317265add6")
(setf (get panda_gazebo::GetEePoseJointConfig :datatype-) "panda_gazebo/GetEePoseJointConfig")
(setf (get panda_gazebo::GetEePoseJointConfig :request) panda_gazebo::GetEePoseJointConfigRequest)
(setf (get panda_gazebo::GetEePoseJointConfig :response) panda_gazebo::GetEePoseJointConfigResponse)

(defmethod panda_gazebo::GetEePoseJointConfigRequest
  (:response () (instance panda_gazebo::GetEePoseJointConfigResponse :init)))

(setf (get panda_gazebo::GetEePoseJointConfigRequest :md5sum-) "b9c46dcb95c6798588db6a317265add6")
(setf (get panda_gazebo::GetEePoseJointConfigRequest :datatype-) "panda_gazebo/GetEePoseJointConfigRequest")
(setf (get panda_gazebo::GetEePoseJointConfigRequest :definition-)
      "# Service that can be used to get a set of posible joint configuration for a given EE
# pose using MoveIt.
geometry_msgs/Pose pose
int32 attempts

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
string[] joint_names
float64[] joint_positions
bool success
string message

")

(setf (get panda_gazebo::GetEePoseJointConfigResponse :md5sum-) "b9c46dcb95c6798588db6a317265add6")
(setf (get panda_gazebo::GetEePoseJointConfigResponse :datatype-) "panda_gazebo/GetEePoseJointConfigResponse")
(setf (get panda_gazebo::GetEePoseJointConfigResponse :definition-)
      "# Service that can be used to get a set of posible joint configuration for a given EE
# pose using MoveIt.
geometry_msgs/Pose pose
int32 attempts

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
string[] joint_names
float64[] joint_positions
bool success
string message

")



(provide :panda_gazebo/GetEePoseJointConfig "b9c46dcb95c6798588db6a317265add6")


