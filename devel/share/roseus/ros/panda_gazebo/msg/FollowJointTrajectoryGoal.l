;; Auto-generated. Do not edit!


(when (boundp 'panda_gazebo::FollowJointTrajectoryGoal)
  (if (not (find-package "PANDA_GAZEBO"))
    (make-package "PANDA_GAZEBO"))
  (shadow 'FollowJointTrajectoryGoal (find-package "PANDA_GAZEBO")))
(unless (find-package "PANDA_GAZEBO::FOLLOWJOINTTRAJECTORYGOAL")
  (make-package "PANDA_GAZEBO::FOLLOWJOINTTRAJECTORYGOAL"))

(in-package "ROS")
;;//! \htmlinclude FollowJointTrajectoryGoal.msg.html
(if (not (find-package "CONTROL_MSGS"))
  (ros::roseus-add-msgs "control_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass panda_gazebo::FollowJointTrajectoryGoal
  :super ros::object
  :slots (_trajectory _path_tolerance _goal_tolerance _goal_time_tolerance _create_time_axis _time_axis_step _timeout ))

(defmethod panda_gazebo::FollowJointTrajectoryGoal
  (:init
   (&key
    ((:trajectory __trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:path_tolerance __path_tolerance) ())
    ((:goal_tolerance __goal_tolerance) ())
    ((:goal_time_tolerance __goal_time_tolerance) (instance ros::time :init))
    ((:create_time_axis __create_time_axis) nil)
    ((:time_axis_step __time_axis_step) 0.0)
    ((:timeout __timeout) (instance ros::time :init))
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _path_tolerance __path_tolerance)
   (setq _goal_tolerance __goal_tolerance)
   (setq _goal_time_tolerance __goal_time_tolerance)
   (setq _create_time_axis __create_time_axis)
   (setq _time_axis_step (float __time_axis_step))
   (setq _timeout __timeout)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:path_tolerance
   (&rest __path_tolerance)
   (if (keywordp (car __path_tolerance))
       (send* _path_tolerance __path_tolerance)
     (progn
       (if __path_tolerance (setq _path_tolerance (car __path_tolerance)))
       _path_tolerance)))
  (:goal_tolerance
   (&rest __goal_tolerance)
   (if (keywordp (car __goal_tolerance))
       (send* _goal_tolerance __goal_tolerance)
     (progn
       (if __goal_tolerance (setq _goal_tolerance (car __goal_tolerance)))
       _goal_tolerance)))
  (:goal_time_tolerance
   (&optional __goal_time_tolerance)
   (if __goal_time_tolerance (setq _goal_time_tolerance __goal_time_tolerance)) _goal_time_tolerance)
  (:create_time_axis
   (&optional (__create_time_axis :null))
   (if (not (eq __create_time_axis :null)) (setq _create_time_axis __create_time_axis)) _create_time_axis)
  (:time_axis_step
   (&optional __time_axis_step)
   (if __time_axis_step (setq _time_axis_step __time_axis_step)) _time_axis_step)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; control_msgs/JointTolerance[] _path_tolerance
    (apply #'+ (send-all _path_tolerance :serialization-length)) 4
    ;; control_msgs/JointTolerance[] _goal_tolerance
    (apply #'+ (send-all _goal_tolerance :serialization-length)) 4
    ;; duration _goal_time_tolerance
    8
    ;; bool _create_time_axis
    1
    ;; float64 _time_axis_step
    8
    ;; duration _timeout
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; control_msgs/JointTolerance[] _path_tolerance
     (write-long (length _path_tolerance) s)
     (dolist (elem _path_tolerance)
       (send elem :serialize s)
       )
     ;; control_msgs/JointTolerance[] _goal_tolerance
     (write-long (length _goal_tolerance) s)
     (dolist (elem _goal_tolerance)
       (send elem :serialize s)
       )
     ;; duration _goal_time_tolerance
       (write-long (send _goal_time_tolerance :sec) s) (write-long (send _goal_time_tolerance :nsec) s)
     ;; bool _create_time_axis
       (if _create_time_axis (write-byte -1 s) (write-byte 0 s))
     ;; float64 _time_axis_step
       (sys::poke _time_axis_step (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; duration _timeout
       (write-long (send _timeout :sec) s) (write-long (send _timeout :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; control_msgs/JointTolerance[] _path_tolerance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path_tolerance (let (r) (dotimes (i n) (push (instance control_msgs::JointTolerance :init) r)) r))
     (dolist (elem- _path_tolerance)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; control_msgs/JointTolerance[] _goal_tolerance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_tolerance (let (r) (dotimes (i n) (push (instance control_msgs::JointTolerance :init) r)) r))
     (dolist (elem- _goal_tolerance)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; duration _goal_time_tolerance
     (send _goal_time_tolerance :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _goal_time_tolerance :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _create_time_axis
     (setq _create_time_axis (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _time_axis_step
     (setq _time_axis_step (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; duration _timeout
     (send _timeout :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _timeout :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get panda_gazebo::FollowJointTrajectoryGoal :md5sum-) "1cd7562575460cb355d318a1ab2e859b")
(setf (get panda_gazebo::FollowJointTrajectoryGoal :datatype-) "panda_gazebo/FollowJointTrajectoryGoal")
(setf (get panda_gazebo::FollowJointTrajectoryGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Follow_joint_trajectory action
# NOTE: This action extends the control_msgs/FollowJointTrajectoryAction such that
# it also contains values to automatically generate the time axis

# The joint trajectory to follow
trajectory_msgs/JointTrajectory trajectory

# Tolerances for the trajectory.  If the measured joint values fall
# outside the tolerances the trajectory goal is aborted.  Any
# tolerances that are not specified (by being omitted or set to 0) are
# set to the defaults for the action server (often taken from the
# parameter server).

# Tolerances applied to the joints as the trajectory is executed.  If
# violated, the goal aborts with error_code set to
# PATH_TOLERANCE_VIOLATED.
control_msgs/JointTolerance[] path_tolerance

# To report success, the joints must be within goal_tolerance of the
# final trajectory value.  The goal must be achieved by time the
# trajectory ends plus goal_time_tolerance.  (goal_time_tolerance
# allows some leeway in time, so that the trajectory goal can still
# succeed even if the joints reach the goal some time after the
# precise end time of the trajectory).
#
# If the joints are not within goal_tolerance after \"trajectory finish
# time\" + goal_time_tolerance, the goal aborts with error_code set to
# GOAL_TOLERANCE_VIOLATED
control_msgs/JointTolerance[] goal_tolerance
duration goal_time_tolerance

# Extra time axis attributes
# NOTE: Used for automatic time axis generation
bool create_time_axis  # Automatically create a time axis
float64 time_axis_step  # Time axis step size
duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.


================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: control_msgs/JointTolerance
# The tolerances specify the amount the position, velocity, and
# accelerations can vary from the setpoints.  For example, in the case
# of trajectory control, when the actual position varies beyond
# (desired position + position tolerance), the trajectory goal may
# abort.
# 
# There are two special values for tolerances:
#  * 0 - The tolerance is unspecified and will remain at whatever the default is
#  * -1 - The tolerance is \"erased\".  If there was a default, the joint will be
#         allowed to move without restriction.

string name
float64 position  # in radians or meters (for a revolute or prismatic joint, respectively)
float64 velocity  # in rad/sec or m/sec
float64 acceleration  # in rad/sec^2 or m/sec^2

")



(provide :panda_gazebo/FollowJointTrajectoryGoal "1cd7562575460cb355d318a1ab2e859b")


