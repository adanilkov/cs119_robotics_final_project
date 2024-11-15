;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::LockJoints)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'LockJoints (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::LOCKJOINTS")
  (make-package "PANDA_GAZEBO::LOCKJOINTS"))
(unless (find-package "PANDA_GAZEBO::LOCKJOINTSREQUEST")
  (make-package "PANDA_GAZEBO::LOCKJOINTSREQUEST"))
(unless (find-package "PANDA_GAZEBO::LOCKJOINTSRESPONSE")
  (make-package "PANDA_GAZEBO::LOCKJOINTSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::LockJointsRequest
  :super ros::object
  :slots (_joint_names _lock ))

(defmethod panda_gazebo::LockJointsRequest
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:lock __lock) nil)
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _lock __lock)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:lock
   (&optional (__lock :null))
   (if (not (eq __lock :null)) (setq _lock __lock)) _lock)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; bool _lock
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
     ;; bool _lock
       (if _lock (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _lock
     (setq _lock (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass panda_gazebo::LockJointsResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::LockJointsResponse
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

(defclass panda_gazebo::LockJoints
  :super ros::object
  :slots ())

(setf (get panda_gazebo::LockJoints :md5sum-) "c5f1ee92ccf62d5afc6116cb756e3854")
(setf (get panda_gazebo::LockJoints :datatype-) "panda_gazebo/LockJoints")
(setf (get panda_gazebo::LockJoints :request) panda_gazebo::LockJointsRequest)
(setf (get panda_gazebo::LockJoints :response) panda_gazebo::LockJointsResponse)

(defmethod panda_gazebo::LockJointsRequest
  (:response () (instance panda_gazebo::LockJointsResponse :init)))

(setf (get panda_gazebo::LockJointsRequest :md5sum-) "c5f1ee92ccf62d5afc6116cb756e3854")
(setf (get panda_gazebo::LockJointsRequest :datatype-) "panda_gazebo/LockJointsRequest")
(setf (get panda_gazebo::LockJointsRequest :definition-)
      "# Service that can be used to lock/unlock specific joints of the robot.
string[] joint_names
bool lock
---
bool success
string message

")

(setf (get panda_gazebo::LockJointsResponse :md5sum-) "c5f1ee92ccf62d5afc6116cb756e3854")
(setf (get panda_gazebo::LockJointsResponse :datatype-) "panda_gazebo/LockJointsResponse")
(setf (get panda_gazebo::LockJointsResponse :definition-)
      "# Service that can be used to lock/unlock specific joints of the robot.
string[] joint_names
bool lock
---
bool success
string message

")



(provide :panda_gazebo/LockJoints "c5f1ee92ccf62d5afc6116cb756e3854")


