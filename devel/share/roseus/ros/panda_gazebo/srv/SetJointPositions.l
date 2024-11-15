;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetJointPositions)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetJointPositions (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETJOINTPOSITIONS")
  (make-package "PANDA_GAZEBO::SETJOINTPOSITIONS"))
(unless (find-package "PANDA_GAZEBO::SETJOINTPOSITIONSREQUEST")
  (make-package "PANDA_GAZEBO::SETJOINTPOSITIONSREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETJOINTPOSITIONSRESPONSE")
  (make-package "PANDA_GAZEBO::SETJOINTPOSITIONSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::SetJointPositionsRequest
  :super ros::object
  :slots (_joint_names _joint_positions _wait ))

(defmethod panda_gazebo::SetJointPositionsRequest
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_positions __joint_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _joint_positions __joint_positions)
   (setq _wait __wait)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:joint_positions
   (&optional __joint_positions)
   (if __joint_positions (setq _joint_positions __joint_positions)) _joint_positions)
  (:wait
   (&optional (__wait :null))
   (if (not (eq __wait :null)) (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; float64[] _joint_positions
    (* 8    (length _joint_positions)) 4
    ;; bool _wait
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
     ;; float64[] _joint_positions
     (write-long (length _joint_positions) s)
     (dotimes (i (length _joint_positions))
       (sys::poke (elt _joint_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass panda_gazebo::SetJointPositionsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetJointPositionsResponse
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

(defclass panda_gazebo::SetJointPositions
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetJointPositions :md5sum-) "7116eda9a72658a9c8b658ed0557ca6f")
(setf (get panda_gazebo::SetJointPositions :datatype-) "panda_gazebo/SetJointPositions")
(setf (get panda_gazebo::SetJointPositions :request) panda_gazebo::SetJointPositionsRequest)
(setf (get panda_gazebo::SetJointPositions :response) panda_gazebo::SetJointPositionsResponse)

(defmethod panda_gazebo::SetJointPositionsRequest
  (:response () (instance panda_gazebo::SetJointPositionsResponse :init)))

(setf (get panda_gazebo::SetJointPositionsRequest :md5sum-) "7116eda9a72658a9c8b658ed0557ca6f")
(setf (get panda_gazebo::SetJointPositionsRequest :datatype-) "panda_gazebo/SetJointPositionsRequest")
(setf (get panda_gazebo::SetJointPositionsRequest :definition-)
      "# Service that can be used to control the robot joint positions using the
# panda_control_server.
# NOTE: This is done by publishing the joint efforts commands to the right topics.
string[] joint_names
float64[] joint_positions
bool wait
---
bool success
string message

")

(setf (get panda_gazebo::SetJointPositionsResponse :md5sum-) "7116eda9a72658a9c8b658ed0557ca6f")
(setf (get panda_gazebo::SetJointPositionsResponse :datatype-) "panda_gazebo/SetJointPositionsResponse")
(setf (get panda_gazebo::SetJointPositionsResponse :definition-)
      "# Service that can be used to control the robot joint positions using the
# panda_control_server.
# NOTE: This is done by publishing the joint efforts commands to the right topics.
string[] joint_names
float64[] joint_positions
bool wait
---
bool success
string message

")



(provide :panda_gazebo/SetJointPositions "7116eda9a72658a9c8b658ed0557ca6f")


