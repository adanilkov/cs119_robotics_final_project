// Auto-generated. Do not edit!

// (in-package brl_pxh_api.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class EePoseCompGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.z = null;
      this.roll = null;
      this.pitch = null;
      this.execute = null;
      this.moving_time = null;
      this.accel_time = null;
      this.blocking = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('execute')) {
        this.execute = initObj.execute
      }
      else {
        this.execute = false;
      }
      if (initObj.hasOwnProperty('moving_time')) {
        this.moving_time = initObj.moving_time
      }
      else {
        this.moving_time = 0.0;
      }
      if (initObj.hasOwnProperty('accel_time')) {
        this.accel_time = initObj.accel_time
      }
      else {
        this.accel_time = 0.0;
      }
      if (initObj.hasOwnProperty('blocking')) {
        this.blocking = initObj.blocking
      }
      else {
        this.blocking = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EePoseCompGoal
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float32(obj.z, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [execute]
    bufferOffset = _serializer.bool(obj.execute, buffer, bufferOffset);
    // Serialize message field [moving_time]
    bufferOffset = _serializer.float32(obj.moving_time, buffer, bufferOffset);
    // Serialize message field [accel_time]
    bufferOffset = _serializer.float32(obj.accel_time, buffer, bufferOffset);
    // Serialize message field [blocking]
    bufferOffset = _serializer.bool(obj.blocking, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EePoseCompGoal
    let len;
    let data = new EePoseCompGoal(null);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [execute]
    data.execute = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [moving_time]
    data.moving_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [accel_time]
    data.accel_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [blocking]
    data.blocking = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 26;
  }

  static datatype() {
    // Returns string type for a message object
    return 'brl_pxh_api/EePoseCompGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7d4193829330657a5eee6b3438daef12';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Goal
    float32 x
    float32 z
    float32 roll
    float32 pitch
    bool execute
    float32 moving_time
    float32 accel_time 
    bool blocking
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EePoseCompGoal(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.execute !== undefined) {
      resolved.execute = msg.execute;
    }
    else {
      resolved.execute = false
    }

    if (msg.moving_time !== undefined) {
      resolved.moving_time = msg.moving_time;
    }
    else {
      resolved.moving_time = 0.0
    }

    if (msg.accel_time !== undefined) {
      resolved.accel_time = msg.accel_time;
    }
    else {
      resolved.accel_time = 0.0
    }

    if (msg.blocking !== undefined) {
      resolved.blocking = msg.blocking;
    }
    else {
      resolved.blocking = false
    }

    return resolved;
    }
};

module.exports = EePoseCompGoal;
