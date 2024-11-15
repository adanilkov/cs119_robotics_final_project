// Auto-generated. Do not edit!

// (in-package panda_gazebo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetJointCommandsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.joint_commands = null;
      this.control_type = null;
      this.grasping = null;
      this.arm_wait = null;
      this.hand_wait = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('joint_commands')) {
        this.joint_commands = initObj.joint_commands
      }
      else {
        this.joint_commands = [];
      }
      if (initObj.hasOwnProperty('control_type')) {
        this.control_type = initObj.control_type
      }
      else {
        this.control_type = '';
      }
      if (initObj.hasOwnProperty('grasping')) {
        this.grasping = initObj.grasping
      }
      else {
        this.grasping = false;
      }
      if (initObj.hasOwnProperty('arm_wait')) {
        this.arm_wait = initObj.arm_wait
      }
      else {
        this.arm_wait = false;
      }
      if (initObj.hasOwnProperty('hand_wait')) {
        this.hand_wait = initObj.hand_wait
      }
      else {
        this.hand_wait = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetJointCommandsRequest
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [joint_commands]
    bufferOffset = _arraySerializer.float64(obj.joint_commands, buffer, bufferOffset, null);
    // Serialize message field [control_type]
    bufferOffset = _serializer.string(obj.control_type, buffer, bufferOffset);
    // Serialize message field [grasping]
    bufferOffset = _serializer.bool(obj.grasping, buffer, bufferOffset);
    // Serialize message field [arm_wait]
    bufferOffset = _serializer.bool(obj.arm_wait, buffer, bufferOffset);
    // Serialize message field [hand_wait]
    bufferOffset = _serializer.bool(obj.hand_wait, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetJointCommandsRequest
    let len;
    let data = new SetJointCommandsRequest(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [joint_commands]
    data.joint_commands = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [control_type]
    data.control_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [grasping]
    data.grasping = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [arm_wait]
    data.arm_wait = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [hand_wait]
    data.hand_wait = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 8 * object.joint_commands.length;
    length += _getByteLength(object.control_type);
    return length + 15;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/SetJointCommandsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8942b29bfe99bfd6103c2355733bbd0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service that can be used to control the robot joint positions/efforts using the
    # panda_control_server.
    # NOTE: This is done by publishing the joint commands to the right topics while sending
    # the gripper  width to the 'franka_gripper/move' action service.
    string[] joint_names
    float64[] joint_commands
    string control_type # The control type you want to use for the robot arm. Options are `effort` and `position`.
    bool grasping # If set to true, the gripper 'max_effort' will be set to 10N when not supplied. This will simplify grasping.
    bool arm_wait # Wait till the arm control has completed
    bool hand_wait # Wait till the hand control has completed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetJointCommandsRequest(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.joint_commands !== undefined) {
      resolved.joint_commands = msg.joint_commands;
    }
    else {
      resolved.joint_commands = []
    }

    if (msg.control_type !== undefined) {
      resolved.control_type = msg.control_type;
    }
    else {
      resolved.control_type = ''
    }

    if (msg.grasping !== undefined) {
      resolved.grasping = msg.grasping;
    }
    else {
      resolved.grasping = false
    }

    if (msg.arm_wait !== undefined) {
      resolved.arm_wait = msg.arm_wait;
    }
    else {
      resolved.arm_wait = false
    }

    if (msg.hand_wait !== undefined) {
      resolved.hand_wait = msg.hand_wait;
    }
    else {
      resolved.hand_wait = false
    }

    return resolved;
    }
};

class SetJointCommandsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetJointCommandsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetJointCommandsResponse
    let len;
    let data = new SetJointCommandsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/SetJointCommandsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetJointCommandsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetJointCommandsRequest,
  Response: SetJointCommandsResponse,
  md5sum() { return 'e45f98ce30463e2aa1e33dd48f97b157'; },
  datatype() { return 'panda_gazebo/SetJointCommands'; }
};
