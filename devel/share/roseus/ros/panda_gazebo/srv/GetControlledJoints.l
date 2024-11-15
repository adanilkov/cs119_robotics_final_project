;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetControlledJoints)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetControlledJoints (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETCONTROLLEDJOINTS")
  (make-package "PANDA_GAZEBO::GETCONTROLLEDJOINTS"))
(unless (find-package "PANDA_GAZEBO::GETCONTROLLEDJOINTSREQUEST")
  (make-package "PANDA_GAZEBO::GETCONTROLLEDJOINTSREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETCONTROLLEDJOINTSRESPONSE")
  (make-package "PANDA_GAZEBO::GETCONTROLLEDJOINTSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::GetControlledJointsRequest
  :super ros::object
  :slots (_control_type ))

(defmethod panda_gazebo::GetControlledJointsRequest
  (:init
   (&key
    ((:control_type __control_type) "")
    )
   (send-super :init)
   (setq _control_type (string __control_type))
   self)
  (:control_type
   (&optional __control_type)
   (if __control_type (setq _control_type __control_type)) _control_type)
  (:serialization-length
   ()
   (+
    ;; string _control_type
    4 (length _control_type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _control_type
       (write-long (length _control_type) s) (princ _control_type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _control_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _control_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetControlledJointsResponse
  :super ros::object
  :slots (_controlled_joints _controlled_joints_arm _controlled_joints_hand _success _message ))

(defmethod panda_gazebo::GetControlledJointsResponse
  (:init
   (&key
    ((:controlled_joints __controlled_joints) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:controlled_joints_arm __controlled_joints_arm) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:controlled_joints_hand __controlled_joints_hand) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _controlled_joints __controlled_joints)
   (setq _controlled_joints_arm __controlled_joints_arm)
   (setq _controlled_joints_hand __controlled_joints_hand)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:controlled_joints
   (&optional __controlled_joints)
   (if __controlled_joints (setq _controlled_joints __controlled_joints)) _controlled_joints)
  (:controlled_joints_arm
   (&optional __controlled_joints_arm)
   (if __controlled_joints_arm (setq _controlled_joints_arm __controlled_joints_arm)) _controlled_joints_arm)
  (:controlled_joints_hand
   (&optional __controlled_joints_hand)
   (if __controlled_joints_hand (setq _controlled_joints_hand __controlled_joints_hand)) _controlled_joints_hand)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string[] _controlled_joints
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controlled_joints)) 4
    ;; string[] _controlled_joints_arm
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controlled_joints_arm)) 4
    ;; string[] _controlled_joints_hand
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controlled_joints_hand)) 4
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _controlled_joints
     (write-long (length _controlled_joints) s)
     (dolist (elem _controlled_joints)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _controlled_joints_arm
     (write-long (length _controlled_joints_arm) s)
     (dolist (elem _controlled_joints_arm)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _controlled_joints_hand
     (write-long (length _controlled_joints_hand) s)
     (dolist (elem _controlled_joints_hand)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _controlled_joints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controlled_joints (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controlled_joints i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _controlled_joints_arm
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controlled_joints_arm (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controlled_joints_arm i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _controlled_joints_hand
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controlled_joints_hand (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controlled_joints_hand i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetControlledJoints
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetControlledJoints :md5sum-) "c0fa937e297125af5ab96e86caa683cd")
(setf (get panda_gazebo::GetControlledJoints :datatype-) "panda_gazebo/GetControlledJoints")
(setf (get panda_gazebo::GetControlledJoints :request) panda_gazebo::GetControlledJointsRequest)
(setf (get panda_gazebo::GetControlledJoints :response) panda_gazebo::GetControlledJointsResponse)

(defmethod panda_gazebo::GetControlledJointsRequest
  (:response () (instance panda_gazebo::GetControlledJointsResponse :init)))

(setf (get panda_gazebo::GetControlledJointsRequest :md5sum-) "c0fa937e297125af5ab96e86caa683cd")
(setf (get panda_gazebo::GetControlledJointsRequest :datatype-) "panda_gazebo/GetControlledJointsRequest")
(setf (get panda_gazebo::GetControlledJointsRequest :definition-)
      "# Service that can be used to retrieve the joints that are controlled for a given
# control type.
string control_type
---
string[] controlled_joints
string[] controlled_joints_arm
string[] controlled_joints_hand
bool success
string message

")

(setf (get panda_gazebo::GetControlledJointsResponse :md5sum-) "c0fa937e297125af5ab96e86caa683cd")
(setf (get panda_gazebo::GetControlledJointsResponse :datatype-) "panda_gazebo/GetControlledJointsResponse")
(setf (get panda_gazebo::GetControlledJointsResponse :definition-)
      "# Service that can be used to retrieve the joints that are controlled for a given
# control type.
string control_type
---
string[] controlled_joints
string[] controlled_joints_arm
string[] controlled_joints_hand
bool success
string message

")



(provide :panda_gazebo/GetControlledJoints "c0fa937e297125af5ab96e86caa683cd")


