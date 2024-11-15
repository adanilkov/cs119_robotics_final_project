;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetEe)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetEe (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETEE")
  (make-package "PANDA_GAZEBO::SETEE"))
(unless (find-package "PANDA_GAZEBO::SETEEREQUEST")
  (make-package "PANDA_GAZEBO::SETEEREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETEERESPONSE")
  (make-package "PANDA_GAZEBO::SETEERESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::SetEeRequest
  :super ros::object
  :slots (_ee_name ))

(defmethod panda_gazebo::SetEeRequest
  (:init
   (&key
    ((:ee_name __ee_name) "")
    )
   (send-super :init)
   (setq _ee_name (string __ee_name))
   self)
  (:ee_name
   (&optional __ee_name)
   (if __ee_name (setq _ee_name __ee_name)) _ee_name)
  (:serialization-length
   ()
   (+
    ;; string _ee_name
    4 (length _ee_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _ee_name
       (write-long (length _ee_name) s) (princ _ee_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _ee_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ee_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::SetEeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetEeResponse
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

(defclass panda_gazebo::SetEe
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetEe :md5sum-) "9966df81bf9b15c45e8f850d588fc889")
(setf (get panda_gazebo::SetEe :datatype-) "panda_gazebo/SetEe")
(setf (get panda_gazebo::SetEe :request) panda_gazebo::SetEeRequest)
(setf (get panda_gazebo::SetEe :response) panda_gazebo::SetEeResponse)

(defmethod panda_gazebo::SetEeRequest
  (:response () (instance panda_gazebo::SetEeResponse :init)))

(setf (get panda_gazebo::SetEeRequest :md5sum-) "9966df81bf9b15c45e8f850d588fc889")
(setf (get panda_gazebo::SetEeRequest :datatype-) "panda_gazebo/SetEeRequest")
(setf (get panda_gazebo::SetEeRequest :definition-)
      "# Service that can be used to set the current EE used in MoveIt.
string ee_name
---
bool success
string message

")

(setf (get panda_gazebo::SetEeResponse :md5sum-) "9966df81bf9b15c45e8f850d588fc889")
(setf (get panda_gazebo::SetEeResponse :datatype-) "panda_gazebo/SetEeResponse")
(setf (get panda_gazebo::SetEeResponse :definition-)
      "# Service that can be used to set the current EE used in MoveIt.
string ee_name
---
bool success
string message

")



(provide :panda_gazebo/SetEe "9966df81bf9b15c45e8f850d588fc889")


