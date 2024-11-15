;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetEePose)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetEePose (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETEEPOSE")
  (make-package "PANDA_GAZEBO::GETEEPOSE"))
(unless (find-package "PANDA_GAZEBO::GETEEPOSEREQUEST")
  (make-package "PANDA_GAZEBO::GETEEPOSEREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETEEPOSERESPONSE")
  (make-package "PANDA_GAZEBO::GETEEPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass panda_gazebo::GetEePoseRequest
  :super ros::object
  :slots ())

(defmethod panda_gazebo::GetEePoseRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass panda_gazebo::GetEePoseResponse
  :super ros::object
  :slots (_pose _success _message ))

(defmethod panda_gazebo::GetEePoseResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetEePose
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetEePose :md5sum-) "37e6739d5ca462eb4146d24e3044b114")
(setf (get panda_gazebo::GetEePose :datatype-) "panda_gazebo/GetEePose")
(setf (get panda_gazebo::GetEePose :request) panda_gazebo::GetEePoseRequest)
(setf (get panda_gazebo::GetEePose :response) panda_gazebo::GetEePoseResponse)

(defmethod panda_gazebo::GetEePoseRequest
  (:response () (instance panda_gazebo::GetEePoseResponse :init)))

(setf (get panda_gazebo::GetEePoseRequest :md5sum-) "37e6739d5ca462eb4146d24e3044b114")
(setf (get panda_gazebo::GetEePoseRequest :datatype-) "panda_gazebo/GetEePoseRequest")
(setf (get panda_gazebo::GetEePoseRequest :definition-)
      "# Service that can be used to get pose information about the EE using MoveIt.

---
geometry_msgs/Pose pose
bool success
string message


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
")

(setf (get panda_gazebo::GetEePoseResponse :md5sum-) "37e6739d5ca462eb4146d24e3044b114")
(setf (get panda_gazebo::GetEePoseResponse :datatype-) "panda_gazebo/GetEePoseResponse")
(setf (get panda_gazebo::GetEePoseResponse :definition-)
      "# Service that can be used to get pose information about the EE using MoveIt.

---
geometry_msgs/Pose pose
bool success
string message


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
")



(provide :panda_gazebo/GetEePose "37e6739d5ca462eb4146d24e3044b114")


