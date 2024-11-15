;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetJointEfforts)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetJointEfforts (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETJOINTEFFORTS")
  (make-package "PANDA_GAZEBO::SETJOINTEFFORTS"))
(unless (find-package "PANDA_GAZEBO::SETJOINTEFFORTSREQUEST")
  (make-package "PANDA_GAZEBO::SETJOINTEFFORTSREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETJOINTEFFORTSRESPONSE")
  (make-package "PANDA_GAZEBO::SETJOINTEFFORTSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::SetJointEffortsRequest
  :super ros::object
  :slots (_joint_names _joint_efforts _wait ))

(defmethod panda_gazebo::SetJointEffortsRequest
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:joint_efforts __joint_efforts) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _joint_efforts __joint_efforts)
   (setq _wait __wait)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:joint_efforts
   (&optional __joint_efforts)
   (if __joint_efforts (setq _joint_efforts __joint_efforts)) _joint_efforts)
  (:wait
   (&optional (__wait :null))
   (if (not (eq __wait :null)) (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; float64[] _joint_efforts
    (* 8    (length _joint_efforts)) 4
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
     ;; float64[] _joint_efforts
     (write-long (length _joint_efforts) s)
     (dotimes (i (length _joint_efforts))
       (sys::poke (elt _joint_efforts i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64[] _joint_efforts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_efforts (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_efforts i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass panda_gazebo::SetJointEffortsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetJointEffortsResponse
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

(defclass panda_gazebo::SetJointEfforts
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetJointEfforts :md5sum-) "70ff964b809bd14f5476d470d36a5dc1")
(setf (get panda_gazebo::SetJointEfforts :datatype-) "panda_gazebo/SetJointEfforts")
(setf (get panda_gazebo::SetJointEfforts :request) panda_gazebo::SetJointEffortsRequest)
(setf (get panda_gazebo::SetJointEfforts :response) panda_gazebo::SetJointEffortsResponse)

(defmethod panda_gazebo::SetJointEffortsRequest
  (:response () (instance panda_gazebo::SetJointEffortsResponse :init)))

(setf (get panda_gazebo::SetJointEffortsRequest :md5sum-) "70ff964b809bd14f5476d470d36a5dc1")
(setf (get panda_gazebo::SetJointEffortsRequest :datatype-) "panda_gazebo/SetJointEffortsRequest")
(setf (get panda_gazebo::SetJointEffortsRequest :definition-)
      "# Service that can be used to control the robot efforts using the panda_control_server.
# NOTE: This is done by publishing the joint efforts commands to the right topics.
string[] joint_names
float64[] joint_efforts
bool wait
---
bool success
string message

")

(setf (get panda_gazebo::SetJointEffortsResponse :md5sum-) "70ff964b809bd14f5476d470d36a5dc1")
(setf (get panda_gazebo::SetJointEffortsResponse :datatype-) "panda_gazebo/SetJointEffortsResponse")
(setf (get panda_gazebo::SetJointEffortsResponse :definition-)
      "# Service that can be used to control the robot efforts using the panda_control_server.
# NOTE: This is done by publishing the joint efforts commands to the right topics.
string[] joint_names
float64[] joint_efforts
bool wait
---
bool success
string message

")



(provide :panda_gazebo/SetJointEfforts "70ff964b809bd14f5476d470d36a5dc1")


