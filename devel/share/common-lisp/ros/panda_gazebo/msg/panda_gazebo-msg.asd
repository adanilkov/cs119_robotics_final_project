
(cl:in-package :asdf)

(defsystem "panda_gazebo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :control_msgs-msg
               :std_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingRegion" :depends-on ("_package_BoundingRegion"))
    (:file "_package_BoundingRegion" :depends-on ("_package"))
    (:file "FollowJointTrajectoryAction" :depends-on ("_package_FollowJointTrajectoryAction"))
    (:file "_package_FollowJointTrajectoryAction" :depends-on ("_package"))
    (:file "FollowJointTrajectoryActionFeedback" :depends-on ("_package_FollowJointTrajectoryActionFeedback"))
    (:file "_package_FollowJointTrajectoryActionFeedback" :depends-on ("_package"))
    (:file "FollowJointTrajectoryActionGoal" :depends-on ("_package_FollowJointTrajectoryActionGoal"))
    (:file "_package_FollowJointTrajectoryActionGoal" :depends-on ("_package"))
    (:file "FollowJointTrajectoryActionResult" :depends-on ("_package_FollowJointTrajectoryActionResult"))
    (:file "_package_FollowJointTrajectoryActionResult" :depends-on ("_package"))
    (:file "FollowJointTrajectoryFeedback" :depends-on ("_package_FollowJointTrajectoryFeedback"))
    (:file "_package_FollowJointTrajectoryFeedback" :depends-on ("_package"))
    (:file "FollowJointTrajectoryGoal" :depends-on ("_package_FollowJointTrajectoryGoal"))
    (:file "_package_FollowJointTrajectoryGoal" :depends-on ("_package"))
    (:file "FollowJointTrajectoryResult" :depends-on ("_package_FollowJointTrajectoryResult"))
    (:file "_package_FollowJointTrajectoryResult" :depends-on ("_package"))
    (:file "JointLimits" :depends-on ("_package_JointLimits"))
    (:file "_package_JointLimits" :depends-on ("_package"))
  ))