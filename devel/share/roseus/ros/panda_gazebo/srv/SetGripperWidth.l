;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::SetGripperWidth)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'SetGripperWidth (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::SETGRIPPERWIDTH")
  (make-package "PANDA_GAZEBO::SETGRIPPERWIDTH"))
(unless (find-package "PANDA_GAZEBO::SETGRIPPERWIDTHREQUEST")
  (make-package "PANDA_GAZEBO::SETGRIPPERWIDTHREQUEST"))
(unless (find-package "PANDA_GAZEBO::SETGRIPPERWIDTHRESPONSE")
  (make-package "PANDA_GAZEBO::SETGRIPPERWIDTHRESPONSE"))

(in-package "ROS")





(defclass panda_gazebo::SetGripperWidthRequest
  :super ros::object
  :slots (_width _grasping _max_effort _wait _timeout ))

(defmethod panda_gazebo::SetGripperWidthRequest
  (:init
   (&key
    ((:width __width) 0.0)
    ((:grasping __grasping) nil)
    ((:max_effort __max_effort) 0.0)
    ((:wait __wait) nil)
    ((:timeout __timeout) (instance ros::time :init))
    )
   (send-super :init)
   (setq _width (float __width))
   (setq _grasping __grasping)
   (setq _max_effort (float __max_effort))
   (setq _wait __wait)
   (setq _timeout __timeout)
   self)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:grasping
   (&optional (__grasping :null))
   (if (not (eq __grasping :null)) (setq _grasping __grasping)) _grasping)
  (:max_effort
   (&optional __max_effort)
   (if __max_effort (setq _max_effort __max_effort)) _max_effort)
  (:wait
   (&optional (__wait :null))
   (if (not (eq __wait :null)) (setq _wait __wait)) _wait)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:serialization-length
   ()
   (+
    ;; float64 _width
    8
    ;; bool _grasping
    1
    ;; float64 _max_effort
    8
    ;; bool _wait
    1
    ;; duration _timeout
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _grasping
       (if _grasping (write-byte -1 s) (write-byte 0 s))
     ;; float64 _max_effort
       (sys::poke _max_effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;; duration _timeout
       (write-long (send _timeout :sec) s) (write-long (send _timeout :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _grasping
     (setq _grasping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _max_effort
     (setq _max_effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; duration _timeout
     (send _timeout :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _timeout :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass panda_gazebo::SetGripperWidthResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::SetGripperWidthResponse
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

(defclass panda_gazebo::SetGripperWidth
  :super ros::object
  :slots ())

(setf (get panda_gazebo::SetGripperWidth :md5sum-) "f1391f700eac44a55b7a2011ef94058b")
(setf (get panda_gazebo::SetGripperWidth :datatype-) "panda_gazebo/SetGripperWidth")
(setf (get panda_gazebo::SetGripperWidth :request) panda_gazebo::SetGripperWidthRequest)
(setf (get panda_gazebo::SetGripperWidth :response) panda_gazebo::SetGripperWidthResponse)

(defmethod panda_gazebo::SetGripperWidthRequest
  (:response () (instance panda_gazebo::SetGripperWidthResponse :init)))

(setf (get panda_gazebo::SetGripperWidthRequest :md5sum-) "f1391f700eac44a55b7a2011ef94058b")
(setf (get panda_gazebo::SetGripperWidthRequest :datatype-) "panda_gazebo/SetGripperWidthRequest")
(setf (get panda_gazebo::SetGripperWidthRequest :definition-)
      "# Service that can be used to control the robot hand gripper width using the panda_control_server.
# NOTE: It serves as a small wrapper around the 'franka_gripper/move' action but automatically
# sets the speed to the maximum speed. It further clips gripper width such that it is within
# the set max/min boundaries.
float64 width       # Gripper width - ignored when the gripper is grasping.
bool grasping       # The gripper simply moves if this is `false` ignoring the 'max_effort'.
float64 max_effort  # The max effort used by the gripper.
bool wait
duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.
---
bool success
string message

")

(setf (get panda_gazebo::SetGripperWidthResponse :md5sum-) "f1391f700eac44a55b7a2011ef94058b")
(setf (get panda_gazebo::SetGripperWidthResponse :datatype-) "panda_gazebo/SetGripperWidthResponse")
(setf (get panda_gazebo::SetGripperWidthResponse :definition-)
      "# Service that can be used to control the robot hand gripper width using the panda_control_server.
# NOTE: It serves as a small wrapper around the 'franka_gripper/move' action but automatically
# sets the speed to the maximum speed. It further clips gripper width such that it is within
# the set max/min boundaries.
float64 width       # Gripper width - ignored when the gripper is grasping.
bool grasping       # The gripper simply moves if this is `false` ignoring the 'max_effort'.
float64 max_effort  # The max effort used by the gripper.
bool wait
duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.
---
bool success
string message

")



(provide :panda_gazebo/SetGripperWidth "f1391f700eac44a55b7a2011ef94058b")


