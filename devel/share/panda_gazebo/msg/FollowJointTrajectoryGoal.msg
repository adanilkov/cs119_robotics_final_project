# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
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
# If the joints are not within goal_tolerance after "trajectory finish
# time" + goal_time_tolerance, the goal aborts with error_code set to
# GOAL_TOLERANCE_VIOLATED
control_msgs/JointTolerance[] goal_tolerance
duration goal_time_tolerance

# Extra time axis attributes
# NOTE: Used for automatic time axis generation
bool create_time_axis  # Automatically create a time axis
float64 time_axis_step  # Time axis step size
duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.

