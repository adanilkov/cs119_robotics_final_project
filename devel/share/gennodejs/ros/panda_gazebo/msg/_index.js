
"use strict";

let JointLimits = require('./JointLimits.js');
let BoundingRegion = require('./BoundingRegion.js');
let FollowJointTrajectoryFeedback = require('./FollowJointTrajectoryFeedback.js');
let FollowJointTrajectoryActionResult = require('./FollowJointTrajectoryActionResult.js');
let FollowJointTrajectoryGoal = require('./FollowJointTrajectoryGoal.js');
let FollowJointTrajectoryResult = require('./FollowJointTrajectoryResult.js');
let FollowJointTrajectoryActionGoal = require('./FollowJointTrajectoryActionGoal.js');
let FollowJointTrajectoryAction = require('./FollowJointTrajectoryAction.js');
let FollowJointTrajectoryActionFeedback = require('./FollowJointTrajectoryActionFeedback.js');

module.exports = {
  JointLimits: JointLimits,
  BoundingRegion: BoundingRegion,
  FollowJointTrajectoryFeedback: FollowJointTrajectoryFeedback,
  FollowJointTrajectoryActionResult: FollowJointTrajectoryActionResult,
  FollowJointTrajectoryGoal: FollowJointTrajectoryGoal,
  FollowJointTrajectoryResult: FollowJointTrajectoryResult,
  FollowJointTrajectoryActionGoal: FollowJointTrajectoryActionGoal,
  FollowJointTrajectoryAction: FollowJointTrajectoryAction,
  FollowJointTrajectoryActionFeedback: FollowJointTrajectoryActionFeedback,
};
