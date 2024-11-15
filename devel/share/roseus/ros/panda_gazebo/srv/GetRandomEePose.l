;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetRandomEePose)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetRandomEePose (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETRANDOMEEPOSE")
  (make-package "PANDA_GAZEBO::GETRANDOMEEPOSE"))
(unless (find-package "PANDA_GAZEBO::GETRANDOMEEPOSEREQUEST")
  (make-package "PANDA_GAZEBO::GETRANDOMEEPOSEREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETRANDOMEEPOSERESPONSE")
  (make-package "PANDA_GAZEBO::GETRANDOMEEPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass panda_gazebo::GetRandomEePoseRequest
  :super ros::object
  :slots (_bounding_region _attempts ))

(defmethod panda_gazebo::GetRandomEePoseRequest
  (:init
   (&key
    ((:bounding_region __bounding_region) (instance panda_gazebo::BoundingRegion :init))
    ((:attempts __attempts) 0)
    )
   (send-super :init)
   (setq _bounding_region __bounding_region)
   (setq _attempts (round __attempts))
   self)
  (:bounding_region
   (&rest __bounding_region)
   (if (keywordp (car __bounding_region))
       (send* _bounding_region __bounding_region)
     (progn
       (if __bounding_region (setq _bounding_region (car __bounding_region)))
       _bounding_region)))
  (:attempts
   (&optional __attempts)
   (if __attempts (setq _attempts __attempts)) _attempts)
  (:serialization-length
   ()
   (+
    ;; panda_gazebo/BoundingRegion _bounding_region
    (send _bounding_region :serialization-length)
    ;; int32 _attempts
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; panda_gazebo/BoundingRegion _bounding_region
       (send _bounding_region :serialize s)
     ;; int32 _attempts
       (write-long _attempts s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; panda_gazebo/BoundingRegion _bounding_region
     (send _bounding_region :deserialize buf ptr-) (incf ptr- (send _bounding_region :serialization-length))
   ;; int32 _attempts
     (setq _attempts (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass panda_gazebo::GetRandomEePoseResponse
  :super ros::object
  :slots (_ee_pose _joint_names _joint_positions _success _message ))

(defmethod panda_gazebo::GetRandomEePoseResponse
  (:init
   (&key
    ((:ee_pose __ee_pose) (instance geometry_msgs::Pose :init))
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_positions __joint_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _ee_pose __ee_pose)
   (setq _joint_names __joint_names)
   (setq _joint_positions __joint_positions)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:ee_pose
   (&rest __ee_pose)
   (if (keywordp (car __ee_pose))
       (send* _ee_pose __ee_pose)
     (progn
       (if __ee_pose (setq _ee_pose (car __ee_pose)))
       _ee_pose)))
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
    ;; geometry_msgs/Pose _ee_pose
    (send _ee_pose :serialization-length)
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
     ;; geometry_msgs/Pose _ee_pose
       (send _ee_pose :serialize s)
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
   ;; geometry_msgs/Pose _ee_pose
     (send _ee_pose :deserialize buf ptr-) (incf ptr- (send _ee_pose :serialization-length))
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

(defclass panda_gazebo::GetRandomEePose
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetRandomEePose :md5sum-) "d52fb2aef180d014e1bace1ad112db90")
(setf (get panda_gazebo::GetRandomEePose :datatype-) "panda_gazebo/GetRandomEePose")
(setf (get panda_gazebo::GetRandomEePose :request) panda_gazebo::GetRandomEePoseRequest)
(setf (get panda_gazebo::GetRandomEePose :response) panda_gazebo::GetRandomEePoseResponse)

(defmethod panda_gazebo::GetRandomEePoseRequest
  (:response () (instance panda_gazebo::GetRandomEePoseResponse :init)))

(setf (get panda_gazebo::GetRandomEePoseRequest :md5sum-) "d52fb2aef180d014e1bace1ad112db90")
(setf (get panda_gazebo::GetRandomEePoseRequest :datatype-) "panda_gazebo/GetRandomEePoseRequest")
(setf (get panda_gazebo::GetRandomEePoseRequest :definition-)
      "# Service that can be used to get a valid EE pose for the robot.
BoundingRegion bounding_region
int32 attempts

================================================================================
MSG: panda_gazebo/BoundingRegion
# Message used to define a bounding region by its min/max x,y z values.
float64 x_min
float64 x_max
float64 y_min
float64 y_max
float64 z_min
---
geometry_msgs/Pose ee_pose
string[] joint_names
float64[] joint_positions
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

(setf (get panda_gazebo::GetRandomEePoseResponse :md5sum-) "d52fb2aef180d014e1bace1ad112db90")
(setf (get panda_gazebo::GetRandomEePoseResponse :datatype-) "panda_gazebo/GetRandomEePoseResponse")
(setf (get panda_gazebo::GetRandomEePoseResponse :definition-)
      "# Service that can be used to get a valid EE pose for the robot.
BoundingRegion bounding_region
int32 attempts

================================================================================
MSG: panda_gazebo/BoundingRegion
# Message used to define a bounding region by its min/max x,y z values.
float64 x_min
float64 x_max
float64 y_min
float64 y_max
float64 z_min
---
geometry_msgs/Pose ee_pose
string[] joint_names
float64[] joint_positions
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



(provide :panda_gazebo/GetRandomEePose "d52fb2aef180d014e1bace1ad112db90")


