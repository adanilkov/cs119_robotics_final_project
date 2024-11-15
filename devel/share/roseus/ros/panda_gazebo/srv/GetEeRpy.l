;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::GetEeRpy)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'GetEeRpy (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::GETEERPY")
  (make-package "PANDA_GAZEBO::GETEERPY"))
(unless (find-package "PANDA_GAZEBO::GETEERPYREQUEST")
  (make-package "PANDA_GAZEBO::GETEERPYREQUEST"))
(unless (find-package "PANDA_GAZEBO::GETEERPYRESPONSE")
  (make-package "PANDA_GAZEBO::GETEERPYRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::GetEeRpyRequest
  :super ros::object
  :slots ())

(defmethod panda_gazebo::GetEeRpyRequest
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

(defclass panda_gazebo::GetEeRpyResponse
  :super ros::object
  :slots (_r _p _y _success _message ))

(defmethod panda_gazebo::GetEeRpyResponse
  (:init
   (&key
    ((:r __r) 0.0)
    ((:p __p) 0.0)
    ((:y __y) 0.0)
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _r (float __r))
   (setq _p (float __p))
   (setq _y (float __y))
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; float32 _r
    4
    ;; float32 _p
    4
    ;; float32 _y
    4
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _p
       (sys::poke _p (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _p
     (setq _p (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass panda_gazebo::GetEeRpy
  :super ros::object
  :slots ())

(setf (get panda_gazebo::GetEeRpy :md5sum-) "e0a899a2a3e84e53d60721d73970d6aa")
(setf (get panda_gazebo::GetEeRpy :datatype-) "panda_gazebo/GetEeRpy")
(setf (get panda_gazebo::GetEeRpy :request) panda_gazebo::GetEeRpyRequest)
(setf (get panda_gazebo::GetEeRpy :response) panda_gazebo::GetEeRpyResponse)

(defmethod panda_gazebo::GetEeRpyRequest
  (:response () (instance panda_gazebo::GetEeRpyResponse :init)))

(setf (get panda_gazebo::GetEeRpyRequest :md5sum-) "e0a899a2a3e84e53d60721d73970d6aa")
(setf (get panda_gazebo::GetEeRpyRequest :datatype-) "panda_gazebo/GetEeRpyRequest")
(setf (get panda_gazebo::GetEeRpyRequest :definition-)
      "# Service that can be used to get orientation information about the EE using MoveIt.

---
float32 r
float32 p
float32 y
bool success
string message

")

(setf (get panda_gazebo::GetEeRpyResponse :md5sum-) "e0a899a2a3e84e53d60721d73970d6aa")
(setf (get panda_gazebo::GetEeRpyResponse :datatype-) "panda_gazebo/GetEeRpyResponse")
(setf (get panda_gazebo::GetEeRpyResponse :definition-)
      "# Service that can be used to get orientation information about the EE using MoveIt.

---
float32 r
float32 p
float32 y
bool success
string message

")



(provide :panda_gazebo/GetEeRpy "e0a899a2a3e84e53d60721d73970d6aa")


