;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetRandomJointPositions)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetRandomJointPositions (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONS")
  (make-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONS"))
(unless (find-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONSREQUEST")
  (make-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONSREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONSRESPONSE")
  (make-package "PANDA_GAZEBO::GETRANDOMJOINTPOSITIONSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::GetRandomJointPositionsRequest
  :super ros::object
  :slots (_joint_limits _attempts ))

(defmethod panda_gazebo::GetRandomJointPositionsRequest
  (:init
   (&key
    ((:joint_limits __joint_limits) (instance panda_gazebo::JointLimits :init))
    ((:attempts __attempts) 0)
    )
   (send-super :init)
   (setq _joint_limits __joint_limits)
   (setq _attempts (round __attempts))
   self)
  (:joint_limits
   (&rest __joint_limits)
   (if (keywordp (car __joint_limits))
       (send* _joint_limits __joint_limits)
     (progn
       (if __joint_limits (setq _joint_limits (car __joint_limits)))
       _joint_limits)))
  (:attempts
   (&optional __attempts)
   (if __attempts (setq _attempts __attempts)) _attempts)
  (:serialization-length
   ()
   (+
    ;; panda_gazebo/JointLimits _joint_limits
    (send _joint_limits :serialization-length)
    ;; int32 _attempts
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; panda_gazebo/JointLimits _joint_limits
       (send _joint_limits :serialize s)
     ;; int32 _attempts
       (write-long _attempts s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; panda_gazebo/JointLimits _joint_limits
     (send _joint_limits :deserialize buf ptr-) (incf ptr- (send _joint_limits :serialization-length))
   ;; int32 _attempts
     (setq _attempts (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass panda_gazebo::GetRandomJointPositionsResponse
  :super ros::object
  :slots (_joint_names _joint_positions _success _message ))

(defmethod panda_gazebo::GetRandomJointPositionsResponse
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

(defclass panda_gazebo::GetRandomJointPositions
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetRandomJointPositions :md5sum-) "4d6e6a8cd1ba93ef030177ed39cffd53")
(setf (get panda_gazebo::GetRandomJointPositions :datatype-) "panda_gazebo/GetRandomJointPositions")
(setf (get panda_gazebo::GetRandomJointPositions :request) panda_gazebo::GetRandomJointPositionsRequest)
(setf (get panda_gazebo::GetRandomJointPositions :response) panda_gazebo::GetRandomJointPositionsResponse)

(defmethod panda_gazebo::GetRandomJointPositionsRequest
  (:response () (instance panda_gazebo::GetRandomJointPositionsResponse :init)))

(setf (get panda_gazebo::GetRandomJointPositionsRequest :md5sum-) "4d6e6a8cd1ba93ef030177ed39cffd53")
(setf (get panda_gazebo::GetRandomJointPositionsRequest :datatype-) "panda_gazebo/GetRandomJointPositionsRequest")
(setf (get panda_gazebo::GetRandomJointPositionsRequest :definition-)
      "# Service that can be used to get valid joint positions for controlling the robot arm
# and hand.
JointLimits joint_limits
int32 attempts

================================================================================
MSG: panda_gazebo/JointLimits
# Message used to define joint limits
string[] names
---
string[] joint_names
float64[] joint_positions
bool success
string message

")

(setf (get panda_gazebo::GetRandomJointPositionsResponse :md5sum-) "4d6e6a8cd1ba93ef030177ed39cffd53")
(setf (get panda_gazebo::GetRandomJointPositionsResponse :datatype-) "panda_gazebo/GetRandomJointPositionsResponse")
(setf (get panda_gazebo::GetRandomJointPositionsResponse :definition-)
      "# Service that can be used to get valid joint positions for controlling the robot arm
# and hand.
JointLimits joint_limits
int32 attempts

================================================================================
MSG: panda_gazebo/JointLimits
# Message used to define joint limits
string[] names
---
string[] joint_names
float64[] joint_positions
bool success
string message

")



(provide :panda_gazebo/GetRandomJointPositions "4d6e6a8cd1ba93ef030177ed39cffd53")


