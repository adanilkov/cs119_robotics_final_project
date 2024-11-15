;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetMoveItControlledJoints)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetMoveItControlledJoints (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTS")
  (make-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTS"))
(unless (find-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTSREQUEST")
  (make-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTSREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTSRESPONSE")
  (make-package "PANDA_GAZEBO::GETMOVEITCONTROLLEDJOINTSRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::GetMoveItControlledJointsRequest
  :super ros::object
  :slots ())

(defmethod panda_gazebo::GetMoveItControlledJointsRequest
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

(defclass panda_gazebo::GetMoveItControlledJointsResponse
  :super ros::object
  :slots (_controlled_joints _controlled_joints_arm _controlled_joints_hand _success _message ))

(defmethod panda_gazebo::GetMoveItControlledJointsResponse
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

(defclass panda_gazebo::GetMoveItControlledJoints
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetMoveItControlledJoints :md5sum-) "de338cfffbebe92f5e336e5f98b28598")
(setf (get panda_gazebo::GetMoveItControlledJoints :datatype-) "panda_gazebo/GetMoveItControlledJoints")
(setf (get panda_gazebo::GetMoveItControlledJoints :request) panda_gazebo::GetMoveItControlledJointsRequest)
(setf (get panda_gazebo::GetMoveItControlledJoints :response) panda_gazebo::GetMoveItControlledJointsResponse)

(defmethod panda_gazebo::GetMoveItControlledJointsRequest
  (:response () (instance panda_gazebo::GetMoveItControlledJointsResponse :init)))

(setf (get panda_gazebo::GetMoveItControlledJointsRequest :md5sum-) "de338cfffbebe92f5e336e5f98b28598")
(setf (get panda_gazebo::GetMoveItControlledJointsRequest :datatype-) "panda_gazebo/GetMoveItControlledJointsRequest")
(setf (get panda_gazebo::GetMoveItControlledJointsRequest :definition-)
      "# Service that can be used to retrieve the joints that are currently controlled by MoveIt.
---
string[] controlled_joints
string[] controlled_joints_arm
string[] controlled_joints_hand
bool success
string message

")

(setf (get panda_gazebo::GetMoveItControlledJointsResponse :md5sum-) "de338cfffbebe92f5e336e5f98b28598")
(setf (get panda_gazebo::GetMoveItControlledJointsResponse :datatype-) "panda_gazebo/GetMoveItControlledJointsResponse")
(setf (get panda_gazebo::GetMoveItControlledJointsResponse :definition-)
      "# Service that can be used to retrieve the joints that are currently controlled by MoveIt.
---
string[] controlled_joints
string[] controlled_joints_arm
string[] controlled_joints_hand
bool success
string message

")



(provide :panda_gazebo/GetMoveItControlledJoints "de338cfffbebe92f5e336e5f98b28598")


