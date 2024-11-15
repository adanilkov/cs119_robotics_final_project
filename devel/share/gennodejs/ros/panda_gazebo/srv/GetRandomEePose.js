// Auto-generated. Do not edit!

// (in-package panda_gazebo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BoundingRegion = require('../msg/BoundingRegion.js');

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GetRandomEePoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bounding_region = null;
      this.attempts = null;
    }
    else {
      if (initObj.hasOwnProperty('bounding_region')) {
        this.bounding_region = initObj.bounding_region
      }
      else {
        this.bounding_region = new BoundingRegion();
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
    // Serializes a message object of type GetRandomEePoseRequest
    // Serialize message field [bounding_region]
    bufferOffset = BoundingRegion.serialize(obj.bounding_region, buffer, bufferOffset);
    // Serialize message field [attempts]
    bufferOffset = _serializer.int32(obj.attempts, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRandomEePoseRequest
    let len;
    let data = new GetRandomEePoseRequest(null);
    // Deserialize message field [bounding_region]
    data.bounding_region = BoundingRegion.deserialize(buffer, bufferOffset);
    // Deserialize message field [attempts]
    data.attempts = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/GetRandomEePoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e7019f7e493ccd848f6fee8b2f311b10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Service that can be used to get a valid EE pose for the robot.
    BoundingRegion bounding_region
    int32 attempts
    
    ================================================================================
    MSG: panda_gazebo/BoundingRegion
    # Message used to define a bounding region by its min/max x,y z values.
    float64 x_min
    float64 x_max
    float64 y_min
    float64 y_max
    float64 z_min
    float64 z_max
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRandomEePoseRequest(null);
    if (msg.bounding_region !== undefined) {
      resolved.bounding_region = BoundingRegion.Resolve(msg.bounding_region)
    }
    else {
      resolved.bounding_region = new BoundingRegion()
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

class GetRandomEePoseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ee_pose = null;
      this.joint_names = null;
      this.joint_positions = null;
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('ee_pose')) {
        this.ee_pose = initObj.ee_pose
      }
      else {
        this.ee_pose = new geometry_msgs.msg.Pose();
      }
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
    // Serializes a message object of type GetRandomEePoseResponse
    // Serialize message field [ee_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.ee_pose, buffer, bufferOffset);
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
    //deserializes a message object of type GetRandomEePoseResponse
    let len;
    let data = new GetRandomEePoseResponse(null);
    // Deserialize message field [ee_pose]
    data.ee_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
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
    return length + 69;
  }

  static datatype() {
    // Returns string type for a service object
    return 'panda_gazebo/GetRandomEePoseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3516fb5b6d6e148286f2b7522e25070a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose ee_pose
    string[] joint_names
    float64[] joint_positions
    bool success
    string message
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRandomEePoseResponse(null);
    if (msg.ee_pose !== undefined) {
      resolved.ee_pose = geometry_msgs.msg.Pose.Resolve(msg.ee_pose)
    }
    else {
      resolved.ee_pose = new geometry_msgs.msg.Pose()
    }

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
  Request: GetRandomEePoseRequest,
  Response: GetRandomEePoseResponse,
  md5sum() { return 'd52fb2aef180d014e1bace1ad112db90'; },
  datatype() { return 'panda_gazebo/GetRandomEePose'; }
};
