;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetJointCommands)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetJointCommands (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETJOINTCOMMANDS")
  (make-package "PANDA_GAZEBO::SETJOINTCOMMANDS"))
(unless (find-package "PANDA_GAZEBO::SETJOINTCOMMANDSREQUEST")
  (make-package "PANDA_GAZEBO::SETJOINTCOMMANDSREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETJOINTCOMMANDSRESPONSE")
  (make-package "PANDA_GAZEBO::SETJOINTCOMMANDSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::SetJointCommandsRequest
  :super ros::object
  :slots (_joint_names _joint_commands _control_type _grasping _arm_wait _hand_wait ))

(defmethod panda_gazebo::SetJointCommandsRequest
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_commands __joint_commands) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:control_type __control_type) "")
    ((:grasping __grasping) nil)
    ((:arm_wait __arm_wait) nil)
    ((:hand_wait __hand_wait) nil)
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _joint_commands __joint_commands)
   (setq _control_type (string __control_type))
   (setq _grasping __grasping)
   (setq _arm_wait __arm_wait)
   (setq _hand_wait __hand_wait)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:joint_commands
   (&optional __joint_commands)
   (if __joint_commands (setq _joint_commands __joint_commands)) _joint_commands)
  (:control_type
   (&optional __control_type)
   (if __control_type (setq _control_type __control_type)) _control_type)
  (:grasping
   (&optional (__grasping :null))
   (if (not (eq __grasping :null)) (setq _grasping __grasping)) _grasping)
  (:arm_wait
   (&optional (__arm_wait :null))
   (if (not (eq __arm_wait :null)) (setq _arm_wait __arm_wait)) _arm_wait)
  (:hand_wait
   (&optional (__hand_wait :null))
   (if (not (eq __hand_wait :null)) (setq _hand_wait __hand_wait)) _hand_wait)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; float64[] _joint_commands
    (* 8    (length _joint_commands)) 4
    ;; string _control_type
    4 (length _control_type)
    ;; bool _grasping
    1
    ;; bool _arm_wait
    1
    ;; bool _hand_wait
    1
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
     ;; float64[] _joint_commands
     (write-long (length _joint_commands) s)
     (dotimes (i (length _joint_commands))
       (sys::poke (elt _joint_commands i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _control_type
       (write-long (length _control_type) s) (princ _control_type s)
     ;; bool _grasping
       (if _grasping (write-byte -1 s) (write-byte 0 s))
     ;; bool _arm_wait
       (if _arm_wait (write-byte -1 s) (write-byte 0 s))
     ;; bool _hand_wait
       (if _hand_wait (write-byte -1 s) (write-byte 0 s))
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
   ;; float64[] _joint_commands
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_commands (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_commands i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string _control_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _control_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _grasping
     (setq _grasping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _arm_wait
     (setq _arm_wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _hand_wait
     (setq _hand_wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass panda_gazebo::SetJointCommandsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetJointCommandsResponse
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

(defclass panda_gazebo::SetJointCommands
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetJointCommands :md5sum-) "e45f98ce30463e2aa1e33dd48f97b157")
(setf (get panda_gazebo::SetJointCommands :datatype-) "panda_gazebo/SetJointCommands")
(setf (get panda_gazebo::SetJointCommands :request) panda_gazebo::SetJointCommandsRequest)
(setf (get panda_gazebo::SetJointCommands :response) panda_gazebo::SetJointCommandsResponse)

(defmethod panda_gazebo::SetJointCommandsRequest
  (:response () (instance panda_gazebo::SetJointCommandsResponse :init)))

(setf (get panda_gazebo::SetJointCommandsRequest :md5sum-) "e45f98ce30463e2aa1e33dd48f97b157")
(setf (get panda_gazebo::SetJointCommandsRequest :datatype-) "panda_gazebo/SetJointCommandsRequest")
(setf (get panda_gazebo::SetJointCommandsRequest :definition-)
      "# Service that can be used to control the robot joint positions/efforts using the
# panda_control_server.
# NOTE: This is done by publishing the joint commands to the right topics while sending
# the gripper  width to the 'franka_gripper/move' action service.
string[] joint_names
float64[] joint_commands
string control_type # The control type you want to use for the robot arm. Options are `effort` and `position`.
bool grasping # If set to true, the gripper 'max_effort' will be set to 10N when not supplied. This will simplify grasping.
bool arm_wait # Wait till the arm control has completed
bool hand_wait # Wait till the hand control has completed
---
bool success
string message

")

(setf (get panda_gazebo::SetJointCommandsResponse :md5sum-) "e45f98ce30463e2aa1e33dd48f97b157")
(setf (get panda_gazebo::SetJointCommandsResponse :datatype-) "panda_gazebo/SetJointCommandsResponse")
(setf (get panda_gazebo::SetJointCommandsResponse :definition-)
      "# Service that can be used to control the robot joint positions/efforts using the
# panda_control_server.
# NOTE: This is done by publishing the joint commands to the right topics while sending
# the gripper  width to the 'franka_gripper/move' action service.
string[] joint_names
float64[] joint_commands
string control_type # The control type you want to use for the robot arm. Options are `effort` and `position`.
bool grasping # If set to true, the gripper 'max_effort' will be set to 10N when not supplied. This will simplify grasping.
bool arm_wait # Wait till the arm control has completed
bool hand_wait # Wait till the hand control has completed
---
bool success
string message

")



(provide :panda_gazebo/SetJointCommands "e45f98ce30463e2aa1e33dd48f97b157")


