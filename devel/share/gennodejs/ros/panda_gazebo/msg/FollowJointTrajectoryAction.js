// Auto-generated. Do not edit!

// (in-package panda_gazebo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let FollowJointTrajectoryActionGoal = require('./FollowJointTrajectoryActionGoal.js');
let FollowJointTrajectoryActionResult = require('./FollowJointTrajectoryActionResult.js');
let FollowJointTrajectoryActionFeedback = require('./FollowJointTrajectoryActionFeedback.js');

//-----------------------------------------------------------

class FollowJointTrajectoryAction {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_goal = null;
      this.action_result = null;
      this.action_feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('action_goal')) {
        this.action_goal = initObj.action_goal
      }
      else {
        this.action_goal = new FollowJointTrajectoryActionGoal();
      }
      if (initObj.hasOwnProperty('action_result')) {
        this.action_result = initObj.action_result
      }
      else {
        this.action_result = new FollowJointTrajectoryActionResult();
      }
      if (initObj.hasOwnProperty('action_feedback')) {
        this.action_feedback = initObj.action_feedback
      }
      else {
        this.action_feedback = new FollowJointTrajectoryActionFeedback();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FollowJointTrajectoryAction
    // Serialize message field [action_goal]
    bufferOffset = FollowJointTrajectoryActionGoal.serialize(obj.action_goal, buffer, bufferOffset);
    // Serialize message field [action_result]
    bufferOffset = FollowJointTrajectoryActionResult.serialize(obj.action_result, buffer, bufferOffset);
    // Serialize message field [action_feedback]
    bufferOffset = FollowJointTrajectoryActionFeedback.serialize(obj.action_feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FollowJointTrajectoryAction
    let len;
    let data = new FollowJointTrajectoryAction(null);
    // Deserialize message field [action_goal]
    data.action_goal = FollowJointTrajectoryActionGoal.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_result]
    data.action_result = FollowJointTrajectoryActionResult.deserialize(buffer, bufferOffset);
    // Deserialize message field [action_feedback]
    data.action_feedback = FollowJointTrajectoryActionFeedback.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += FollowJointTrajectoryActionGoal.getMessageSize(object.action_goal);
    length += FollowJointTrajectoryActionResult.getMessageSize(object.action_result);
    length += FollowJointTrajectoryActionFeedback.getMessageSize(object.action_feedback);
    return length;
  }

  static datatype() {
    // Returns string type for a message object
    return 'panda_gazebo/FollowJointTrajectoryAction';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b51c7644abd094150684c4b3caf25fbc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    FollowJointTrajectoryActionGoal action_goal
    FollowJointTrajectoryActionResult action_result
    FollowJointTrajectoryActionFeedback action_feedback
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryActionGoal
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    Header header
    actionlib_msgs/GoalID goal_id
    FollowJointTrajectoryGoal goal
    
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
    MSG: actionlib_msgs/GoalID
    # The stamp should store the time at which this goal was requested.
    # It is used by an action server when it tries to preempt all
    # goals that were requested before a certain time
    time stamp
    
    # The id provides a way to associate feedback and
    # result message with specific goal requests. The id
    # specified must be unique.
    string id
    
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryGoal
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
    
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    
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
    #  * -1 - The tolerance is "erased".  If there was a default, the joint will be
    #         allowed to move without restriction.
    
    string name
    float64 position  # in radians or meters (for a revolute or prismatic joint, respectively)
    float64 velocity  # in rad/sec or m/sec
    float64 acceleration  # in rad/sec^2 or m/sec^2
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryActionResult
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    Header header
    actionlib_msgs/GoalStatus status
    FollowJointTrajectoryResult result
    
    ================================================================================
    MSG: actionlib_msgs/GoalStatus
    GoalID goal_id
    uint8 status
    uint8 PENDING         = 0   # The goal has yet to be processed by the action server
    uint8 ACTIVE          = 1   # The goal is currently being processed by the action server
    uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing
                                #   and has since completed its execution (Terminal State)
    uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)
    uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due
                                #    to some failure (Terminal State)
    uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,
                                #    because the goal was unattainable or invalid (Terminal State)
    uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing
                                #    and has not yet completed execution
    uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,
                                #    but the action server has not yet confirmed that the goal is canceled
    uint8 RECALLED        = 8   # The goal received a cancel request before it started executing
                                #    and was successfully cancelled (Terminal State)
    uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be
                                #    sent over the wire by an action server
    
    #Allow for the user to associate a string with GoalStatus for debugging
    string text
    
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryResult
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    int32 error_code
    int32 SUCCESSFUL = 0
    int32 INVALID_GOAL = -1
    int32 INVALID_JOINTS = -2
    int32 OLD_HEADER_TIMESTAMP = -3
    int32 PATH_TOLERANCE_VIOLATED = -4
    int32 GOAL_TOLERANCE_VIOLATED = -5
    int32 ACTION_TIMEOUT = -6
    
    # Human readable description of the error code. Contains complementary
    # information that is especially useful when execution fails, for instance:
    # - INVALID_GOAL: The reason for the invalid goal (e.g., the requested
    #   trajectory is in the past).
    # - INVALID_JOINTS: The mismatch between the expected controller joints
    #   and those provided in the goal.
    # - PATH_TOLERANCE_VIOLATED and GOAL_TOLERANCE_VIOLATED: Which joint
    #   violated which tolerance, and by how much.
    # - ACTION_TIMEOUT: The controller failed to achieve the goal before
    #   the specified timeout elapsed.
    string error_string
    
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryActionFeedback
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    
    Header header
    actionlib_msgs/GoalStatus status
    FollowJointTrajectoryFeedback feedback
    
    ================================================================================
    MSG: panda_gazebo/FollowJointTrajectoryFeedback
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    Header header
    string[] joint_names
    trajectory_msgs/JointTrajectoryPoint desired
    trajectory_msgs/JointTrajectoryPoint actual
    trajectory_msgs/JointTrajectoryPoint error
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FollowJointTrajectoryAction(null);
    if (msg.action_goal !== undefined) {
      resolved.action_goal = FollowJointTrajectoryActionGoal.Resolve(msg.action_goal)
    }
    else {
      resolved.action_goal = new FollowJointTrajectoryActionGoal()
    }

    if (msg.action_result !== undefined) {
      resolved.action_result = FollowJointTrajectoryActionResult.Resolve(msg.action_result)
    }
    else {
      resolved.action_result = new FollowJointTrajectoryActionResult()
    }

    if (msg.action_feedback !== undefined) {
      resolved.action_feedback = FollowJointTrajectoryActionFeedback.Resolve(msg.action_feedback)
    }
    else {
      resolved.action_feedback = new FollowJointTrajectoryActionFeedback()
    }

    return resolved;
    }
};

module.exports = FollowJointTrajectoryAction;
