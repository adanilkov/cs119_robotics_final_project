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

class SetGripperWidthRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width = null;
      this.grasping = null;
      this.max_effort = null;
      this.wait = null;
      this.timeout = null;
    }
    else {
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('grasping')) {
        this.grasping = initObj.grasping
      }
      else {
        this.grasping = false;
      }
      if (initObj.hasOwnProperty('max_effort')) {
        this.max_effort = initObj.max_effort
      }
      else {
        this.max_effort = 0.0;
      }
      if (initObj.hasOwnProperty('wait')) {
        this.wait = initObj.wait
      }
      else {
        this.wait = false;
      }
      if (initObj.hasOwnProperty('timeout')) {
        this.timeout = initObj.timeout
      }
      else {
        this.timeout = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetGripperWidthRequest
    // Serialize message field [width]
    bufferOffset = _serializer.float64(obj.width, buffer, bufferOffset);
    // Serialize message field [grasping]
    bufferOffset = _serializer.bool(obj.grasping, buffer, bufferOffset);
    // Serialize message field [max_effort]
    bufferOffset = _serializer.float64(obj.max_effort, buffer, bufferOffset);
    // Serialize message field [wait]
    bufferOffset = _serializer.bool(obj.wait, buffer, bufferOffset);
    // Serialize message field [timeout]
    bufferOffset = _serializer.duration(obj.timeout, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetGripperWidthRequest
    let len;
    let data = new SetGripperWidthRequest(null);
    // Deserialize message field [width]
    data.width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [grasping]
    data.grasping = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [max_effort]
    data.max_effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wait]
    data.wait = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [timeout]
    data.timeout = _deserializer.duration(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/SetGripperWidthRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f982499773828152675649f173b5489';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service that can be used to control the robot hand gripper width using the panda_control_server.
    # NOTE: It serves as a small wrapper around the 'franka_gripper/move' action but automatically
    # sets the speed to the maximum speed. It further clips gripper width such that it is within
    # the set max/min boundaries.
    float64 width       # Gripper width - ignored when the gripper is grasping.
    bool grasping       # The gripper simply moves if this is `false` ignoring the 'max_effort'.
    float64 max_effort  # The max effort used by the gripper.
    bool wait
    duration timeout # Action server timeout. If set to 0, no timeout is used and action waits indefinitely.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetGripperWidthRequest(null);
    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.grasping !== undefined) {
      resolved.grasping = msg.grasping;
    }
    else {
      resolved.grasping = false
    }

    if (msg.max_effort !== undefined) {
      resolved.max_effort = msg.max_effort;
    }
    else {
      resolved.max_effort = 0.0
    }

    if (msg.wait !== undefined) {
      resolved.wait = msg.wait;
    }
    else {
      resolved.wait = false
    }

    if (msg.timeout !== undefined) {
      resolved.timeout = msg.timeout;
    }
    else {
      resolved.timeout = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

class SetGripperWidthResponse {
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
    // Serializes a message object of type SetGripperWidthResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetGripperWidthResponse
    let len;
    let data = new SetGripperWidthResponse(null);
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
    return 'panda_gazebo/SetGripperWidthResponse';
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
    const resolved = new SetGripperWidthResponse(null);
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
  Request: SetGripperWidthRequest,
  Response: SetGripperWidthResponse,
  md5sum() { return 'f1391f700eac44a55b7a2011ef94058b'; },
  datatype() { return 'panda_gazebo/SetGripperWidth'; }
};
