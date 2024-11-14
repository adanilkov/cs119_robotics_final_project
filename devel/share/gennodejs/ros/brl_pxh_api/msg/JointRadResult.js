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

class JointRadResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.log = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('log')) {
        this.log = initObj.log
      }
      else {
        this.log = '';
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointRadResult
    // Serialize message field [log]
    bufferOffset = _serializer.string(obj.log, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointRadResult
    let len;
    let data = new JointRadResult(null);
    // Deserialize message field [log]
    data.log = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.log);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'brl_pxh_api/JointRadResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd80d1d6f73b67aee28bf93977c589629';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Result
    string log
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointRadResult(null);
    if (msg.log !== undefined) {
      resolved.log = msg.log;
    }
    else {
      resolved.log = ''
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = JointRadResult;
