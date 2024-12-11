#!/usr/bin/env python
from typing import Tuple

import numpy as np
from gymnasium import spaces, Env
import tf

from config import (
    RIGHT_FINGER_LIM,
    LEFT_FINGER_LIM,
    OBS_SPACE_LOW,
    OBS_SPACE_HIGH,
    ACTION_SPACE_LOW,
    ACTION_SPACE_HIGH,
    GRIPPER_PROP_LINK_NAME,
    RIGHT_FINGER_LINK_NAME,
    LEFT_FINGER_LINK_NAME,
    PICKABLE_OBJ_MODEL_NAME,
    PICKABLE_OBJ_SDF,
)
from utils import (
    clip_value,
    get_gazebo_model_pose,
    get_link_position,
)
from gazebo import PickableGazeboObjectClient, PX100GazeboClient


class PX100PickEnv(Env):
    MAX_STEPS_PER_EPISODE = 15
    PICKABLE_OBJ_START_POS = (0.2835, 0.0, 0.041)
    PICKABLE_OBJ_START_YAW = 1.5707963  # Make the "T" shape face the claw
    PICKABLE_OBJ_TARGET_POS = np.array([0.26, 0.0, 0.16])
    OBJ_TARGET_DIST_CLIP = (
        np.linalg.norm(np.array(PICKABLE_OBJ_START_POS) - PICKABLE_OBJ_TARGET_POS) * 1.3
    )
    GRABBER_OBJ_DIST_CLIP = 0.25
    GRABBER_OBJ_DIST_REWARD_EXP_FACTOR = 2.5
    LIFT_CLEARANCE_TOL = 0.005

    def __init__(self):
        super(PX100PickEnv, self).__init__()

        self.action_space = spaces.Box(
            low=np.array(ACTION_SPACE_LOW),
            high=np.array(ACTION_SPACE_HIGH),
            dtype=np.float32,
        )
        self.observation_space = spaces.Box(
            low=np.array(OBS_SPACE_LOW), high=np.array(OBS_SPACE_HIGH), dtype=np.float32
        )
        self.tf_listener = tf.TransformListener()
        self.px100 = PX100GazeboClient()
        self.pickable_object = PickableGazeboObjectClient(
            model_name=PICKABLE_OBJ_MODEL_NAME,
            model_sdf=PICKABLE_OBJ_SDF,
        )
        self.pickable_object.spawn(
            position=self.PICKABLE_OBJ_START_POS, yaw=self.PICKABLE_OBJ_START_YAW
        )

        # Episode state tracking variables
        self.n_steps_elapsed = 0
        self.n_steps_object_off_ground = 0

        # Reward tracking
        self.reward_history = []

    def get_randomized_object_start_state(self) -> Tuple[Tuple, float]:
        """Return slightly randomized version of the pickable object's start state.

        Returns:
            (x,y,z), yaw
        """
        return self.PICKABLE_OBJ_START_POS, self.PICKABLE_OBJ_START_YAW  # FIXME

    def reset(self, seed=None, options=None):
        """
        Reset the environment to the initial state and return the first observation.

        Args:
            seed (int, optional): Random seed for reproducibility.
            options (dict, optional): Additional options for resetting the environment.

        Returns:
            observation (np.ndarray): The first observation after reset.
            info (dict): Any additional info (can be empty).
        """
        # Move arm to home position
        self.px100.set_joint_positions(
            waist=0.0,
            shoulder=0.0,
            elbow=0.0,
            wrist_angle=0.0,
            right_finger=RIGHT_FINGER_LIM[0],
            left_finger=LEFT_FINGER_LIM[1],
        )
        # Move object to start location
        start_pos, start_yaw = self.get_randomized_object_start_state()
        self.pickable_object.teleport(new_position=start_pos, yaw=start_yaw)

        # Get the joint positions as the observation
        observation = self.px100.get_joint_positions()

        # Reset episode state tracking variables
        self.n_steps_elapsed = 0

        # self.save_reward_history() #TODO: make this better, only save last reward to file

        # Return the observation and an empty dictionary (for reset info)
        return observation, {}

    def step(self, action):
        """
        Take a step in the environment based on the given action.
        Args:
            action (np.ndarray): The action taken by the agent.
        Returns:
            observation (np.ndarray): The next observation after taking the action.
            reward (float): The reward received for taking the action.
            terminated (bool): Whether the episode has terminated.
            truncated (bool): Whether the episode was truncated (e.g., due to time limit).
            info (dict): Additional information about the step.
        """
        current_joint_positions = self.px100.get_joint_positions()
        target_joint_positions = current_joint_positions + action

        target_right_finger = RIGHT_FINGER_LIM[
            0
        ]  # target_joint_positions[4]  # Right finger target position
        target_left_finger = -target_right_finger

        # Take action
        self.px100.set_joint_positions(
            waist=target_joint_positions[0],
            shoulder=target_joint_positions[1],
            elbow=target_joint_positions[2],
            wrist_angle=target_joint_positions[3],
            right_finger=target_right_finger,
            left_finger=target_left_finger,
        )

        # Update episode state tracking variables
        self.n_steps_elapsed += 1

        # Make observation of environment
        joint_positions = self.px100.get_joint_positions()
        object_position = get_gazebo_model_pose(PICKABLE_OBJ_MODEL_NAME)
        # Object->target distance reward component
        obj_target_dist = np.linalg.norm(
            np.array(object_position) - self.PICKABLE_OBJ_TARGET_POS
        )
        clipped_obj_target_dist = clip_value(
            obj_target_dist, limits=(0, self.OBJ_TARGET_DIST_CLIP)
        )
        obj_target_dist_reward = (  # Normalize to b/w 0 and 1
            self.OBJ_TARGET_DIST_CLIP - clipped_obj_target_dist
        ) / self.OBJ_TARGET_DIST_CLIP

        # Grabber->object distance reward component
        gripper_prop_link_position = get_link_position(
            GRIPPER_PROP_LINK_NAME, self.tf_listener
        )
        right_finger_link_position = get_link_position(
            RIGHT_FINGER_LINK_NAME, self.tf_listener
        )
        left_finger_link_position = get_link_position(
            LEFT_FINGER_LINK_NAME, self.tf_listener
        )
        if any(
            [
                pos is None
                for pos in [
                    gripper_prop_link_position,
                    right_finger_link_position,
                    left_finger_link_position,
                ]
            ]
        ):
            grabber_object_dist_reward = 0
        else:
            grabber_base_dist = np.linalg.norm(
                gripper_prop_link_position - object_position
            )
            left_finger_dist = np.linalg.norm(
                left_finger_link_position - object_position
            )
            right_finger_dist = np.linalg.norm(
                right_finger_link_position - object_position
            )

            grabber_obj_dist = np.mean(
                [
                    grabber_base_dist,
                    grabber_base_dist,  # Weight the base distance more
                    left_finger_dist,
                    right_finger_dist,
                ],
                axis=0,
            )
            clipped_grabber_obj_dist = clip_value(
                grabber_obj_dist, limits=(0, self.GRABBER_OBJ_DIST_CLIP)
            )
            grabber_object_dist_reward = (
                self.GRABBER_OBJ_DIST_CLIP - clipped_grabber_obj_dist
            ) / self.GRABBER_OBJ_DIST_CLIP  # Normalize to b/w 0 and 1
            # Exponentiate to make high rewards more potent and weak rewards less potent
            grabber_object_dist_reward = (
                grabber_object_dist_reward**self.GRABBER_OBJ_DIST_REWARD_EXP_FACTOR
            )

        # Combine reward components
        reward = obj_target_dist_reward + grabber_object_dist_reward

        # Check for episode exit conditions
        done = self.n_steps_elapsed >= self.MAX_STEPS_PER_EPISODE
        truncated = False  # NOTE: False--we don't need to use this gymnasium flag

        self.reward_history.append(reward)

        return joint_positions, reward, done, truncated, {}

    def save_reward_history(self, filename="reward_history.txt"):
        with open(filename, "w") as f:
            for reward in self.reward_history:
                f.write(f"{reward}\n")
