;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetEePose)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetEePose (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETEEPOSE")
  (make-package "PANDA_GAZEBO::SETEEPOSE"))
(unless (find-package "PANDA_GAZEBO::SETEEPOSEREQUEST")
  (make-package "PANDA_GAZEBO::SETEEPOSEREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETEEPOSERESPONSE")
  (make-package "PANDA_GAZEBO::SETEEPOSERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass panda_gazebo::SetEePoseRequest
  :super ros::object
  :slots (_pose ))

(defmethod panda_gazebo::SetEePoseRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass panda_gazebo::SetEePoseResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetEePoseResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::SetEePose
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetEePose :md5sum-) "28e4dd667b29bd35b516ba1d379b7529")
(setf (get panda_gazebo::SetEePose :datatype-) "panda_gazebo/SetEePose")
(setf (get panda_gazebo::SetEePose :request) panda_gazebo::SetEePoseRequest)
(setf (get panda_gazebo::SetEePose :response) panda_gazebo::SetEePoseResponse)

(defmethod panda_gazebo::SetEePoseRequest
  (:response () (instance panda_gazebo::SetEePoseResponse :init)))

(setf (get panda_gazebo::SetEePoseRequest :md5sum-) "28e4dd667b29bd35b516ba1d379b7529")
(setf (get panda_gazebo::SetEePoseRequest :datatype-) "panda_gazebo/SetEePoseRequest")
(setf (get panda_gazebo::SetEePoseRequest :definition-)
      "# Service that can be used to set the current EE pose and control the robot using
# MoveIt.
geometry_msgs/Pose pose

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
bool success
string message

")

(setf (get panda_gazebo::SetEePoseResponse :md5sum-) "28e4dd667b29bd35b516ba1d379b7529")
(setf (get panda_gazebo::SetEePoseResponse :datatype-) "panda_gazebo/SetEePoseResponse")
(setf (get panda_gazebo::SetEePoseResponse :definition-)
      "# Service that can be used to set the current EE pose and control the robot using
# MoveIt.
geometry_msgs/Pose pose

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
bool success
string message

")



(provide :panda_gazebo/SetEePose "28e4dd667b29bd35b516ba1d379b7529")


