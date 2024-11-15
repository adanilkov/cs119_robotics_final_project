;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetEe)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetEe (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETEE")
  (make-package "PANDA_GAZEBO::GETEE"))
(unless (find-package "PANDA_GAZEBO::GETEEREQUEST")
  (make-package "PANDA_GAZEBO::GETEEREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETEERESPONSE")
  (make-package "PANDA_GAZEBO::GETEERESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::GetEeRequest
  :super ros::object
  :slots ())

(defmethod panda_gazebo::GetEeRequest
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

(defclass panda_gazebo::GetEeResponse
  :super ros::object
  :slots (_ee_name _success _message ))

(defmethod panda_gazebo::GetEeResponse
  (:init
   (&key
    ((:ee_name __ee_name) "")
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _ee_name (string __ee_name))
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:ee_name
   (&optional __ee_name)
   (if __ee_name (setq _ee_name __ee_name)) _ee_name)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _ee_name
    4 (length _ee_name)
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _ee_name
       (write-long (length _ee_name) s) (princ _ee_name s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _ee_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ee_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetEe
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetEe :md5sum-) "0d38e7dfd196a6d5a64530f17deabb47")
(setf (get panda_gazebo::GetEe :datatype-) "panda_gazebo/GetEe")
(setf (get panda_gazebo::GetEe :request) panda_gazebo::GetEeRequest)
(setf (get panda_gazebo::GetEe :response) panda_gazebo::GetEeResponse)

(defmethod panda_gazebo::GetEeRequest
  (:response () (instance panda_gazebo::GetEeResponse :init)))

(setf (get panda_gazebo::GetEeRequest :md5sum-) "0d38e7dfd196a6d5a64530f17deabb47")
(setf (get panda_gazebo::GetEeRequest :datatype-) "panda_gazebo/GetEeRequest")
(setf (get panda_gazebo::GetEeRequest :definition-)
      "# Service that can be used to get the current EE used in MoveIt.

---
string ee_name
bool success
string message

")

(setf (get panda_gazebo::GetEeResponse :md5sum-) "0d38e7dfd196a6d5a64530f17deabb47")
(setf (get panda_gazebo::GetEeResponse :datatype-) "panda_gazebo/GetEeResponse")
(setf (get panda_gazebo::GetEeResponse :definition-)
      "# Service that can be used to get the current EE used in MoveIt.

---
string ee_name
bool success
string message

")



(provide :panda_gazebo/GetEe "0d38e7dfd196a6d5a64530f17deabb47")


