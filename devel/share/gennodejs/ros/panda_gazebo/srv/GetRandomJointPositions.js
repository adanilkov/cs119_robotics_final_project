// Auto-generated. Do not edit!

// (in-package panda_gazebo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointLimits = require('../msg/JointLimits.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetRandomJointPositionsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_limits = null;
      this.attempts = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_limits')) {
        this.joint_limits = initObj.joint_limits
      }
      else {
        this.joint_limits = new JointLimits();
      }
      if (initObj.hasOwnProperty('attempts')) {
        this.attempts = initObj.attempts
      }
      else {
        this.attempts = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetRandomJointPositionsRequest
    // Serialize message field [joint_limits]
    bufferOffset = JointLimits.serialize(obj.joint_limits, buffer, bufferOffset);
    // Serialize message field [attempts]
    bufferOffset = _serializer.int32(obj.attempts, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRandomJointPositionsRequest
    let len;
    let data = new GetRandomJointPositionsRequest(null);
    // Deserialize message field [joint_limits]
    data.joint_limits = JointLimits.deserialize(buffer, bufferOffset);
    // Deserialize message field [attempts]
    data.attempts = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += JointLimits.getMessageSize(object.joint_limits);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/GetRandomJointPositionsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4ec67abe641fd6b76ccbb0f1dc3280cd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service that can be used to get valid joint positions for controlling the robot arm
    # and hand.
    JointLimits joint_limits
    int32 attempts
    
    ================================================================================
    MSG: panda_gazebo/JointLimits
    # Message used to define joint limits
    string[] names
    float64[] values
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRandomJointPositionsRequest(null);
    if (msg.joint_limits !== undefined) {
      resolved.joint_limits = JointLimits.Resolve(msg.joint_limits)
    }
    else {
      resolved.joint_limits = new JointLimits()
    }

    if (msg.attempts !== undefined) {
      resolved.attempts = msg.attempts;
    }
    else {
      resolved.attempts = 0
    }

    return resolved;
    }
};

class GetRandomJointPositionsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.joint_positions = null;
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('joint_positions')) {
        this.joint_positions = initObj.joint_positions
      }
      else {
        this.joint_positions = [];
      }
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
    // Serializes a message object of type GetRandomJointPositionsResponse
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [joint_positions]
    bufferOffset = _arraySerializer.float64(obj.joint_positions, buffer, bufferOffset, null);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRandomJointPositionsResponse
    let len;
    let data = new GetRandomJointPositionsResponse(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [joint_positions]
    data.joint_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 8 * object.joint_positions.length;
    length += _getByteLength(object.message);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/GetRandomJointPositionsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c2af30b0f98c15bbeb4220c5da17d05';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] joint_names
    float64[] joint_positions
    bool success
    string message
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRandomJointPositionsResponse(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.joint_positions !== undefined) {
      resolved.joint_positions = msg.joint_positions;
    }
    else {
      resolved.joint_positions = []
    }

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
  Request: GetRandomJointPositionsRequest,
  Response: GetRandomJointPositionsResponse,
  md5sum() { return '4d6e6a8cd1ba93ef030177ed39cffd53'; },
  datatype() { return 'panda_gazebo/GetRandomJointPositions'; }
};
