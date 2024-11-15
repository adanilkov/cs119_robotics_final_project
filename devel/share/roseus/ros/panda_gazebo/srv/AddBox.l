;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::AddBox)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'AddBox (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::ADDBOX")
  (make-package "PANDA_GAZEBO::ADDBOX"))
(unless (find-package "PANDA_GAZEBO::ADDBOXREQUEST")
  (make-package "PANDA_GAZEBO::ADDBOXREQUEST"))
(unless (find-package "PANDA_GAZEBO::ADDBOXRESPONSE")
  (make-package "PANDA_GAZEBO::ADDBOXRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass panda_gazebo::AddBoxRequest
  :super ros::object
  :slots (_name _frame_id _pose _size ))

(defmethod panda_gazebo::AddBoxRequest
  (:init
   (&key
    ((:name __name) "")
    ((:frame_id __frame_id) "")
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:size __size) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _frame_id (string __frame_id))
   (setq _pose __pose)
   (setq _size __size)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:frame_id
   (&optional __frame_id)
   (if __frame_id (setq _frame_id __frame_id)) _frame_id)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:size
   (&optional __size)
   (if __size (setq _size __size)) _size)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _frame_id
    4 (length _frame_id)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64[3] _size
    (* 8    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _frame_id
       (write-long (length _frame_id) s) (princ _frame_id s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64[3] _size
     (dotimes (i 3)
       (sys::poke (elt _size i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _frame_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64[3] _size
   (dotimes (i (length _size))
     (setf (elt _size i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass panda_gazebo::AddBoxResponse
  :super ros::object
  :slots (_success _message ))

(defmethod panda_gazebo::AddBoxResponse
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

(defclass panda_gazebo::AddBox
  :super ros::object
  :slots ())

(setf (get panda_gazebo::AddBox :md5sum-) "33a045cab11c556ad20e54d951c3d3de")
(setf (get panda_gazebo::AddBox :datatype-) "panda_gazebo/AddBox")
(setf (get panda_gazebo::AddBox :request) panda_gazebo::AddBoxRequest)
(setf (get panda_gazebo::AddBox :response) panda_gazebo::AddBoxResponse)

(defmethod panda_gazebo::AddBoxRequest
  (:response () (instance panda_gazebo::AddBoxResponse :init)))

(setf (get panda_gazebo::AddBoxRequest :md5sum-) "33a045cab11c556ad20e54d951c3d3de")
(setf (get panda_gazebo::AddBoxRequest :datatype-) "panda_gazebo/AddBoxRequest")
(setf (get panda_gazebo::AddBoxRequest :definition-)
      "# Service that can be used to add a box to the planning scene.
string name
string frame_id
geometry_msgs/Pose pose
float64[3] size

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
string message

")

(setf (get panda_gazebo::AddBoxResponse :md5sum-) "33a045cab11c556ad20e54d951c3d3de")
(setf (get panda_gazebo::AddBoxResponse :datatype-) "panda_gazebo/AddBoxResponse")
(setf (get panda_gazebo::AddBoxResponse :definition-)
      "# Service that can be used to add a box to the planning scene.
string name
string frame_id
geometry_msgs/Pose pose
float64[3] size

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
string message

")



(provide :panda_gazebo/AddBox "33a045cab11c556ad20e54d951c3d3de")


