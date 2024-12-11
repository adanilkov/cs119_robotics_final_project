#!/usr/bin/env python
"""Code pertaining the the environment for training (E.g. the `Env` subclass & reward calcs)"""
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
    normalize_joint_positions,
    denormalize_action_vector,
)
from gazebo import PickableGazeboObjectClient, PX100GazeboClient


def calculate_object_target_dist_reward_term(
    object_position: Tuple[float, float, float],
    obj_target_position: Tuple[float, float, float],
    clip_limit: float,
) -> float:
    """
    Calculate the Object->Target distance reward term, normalized b/w 0 & 1.

    Args:
        object_position (Tuple[float, float, float]): The 3D position of the object (x, y, z).
        obj_target_position (Tuple[float, float, float]): The 3D position of the target (x, y, z).
        clip_limit (float): Value at which the distance is clipped (for normalization).

    Returns:
        float: A normalized reward value between 0 and 1 based on the object's distance to the target.
    """
    obj_target_dist = np.linalg.norm(np.array(object_position) - obj_target_position)
    clipped_obj_target_dist = clip_value(obj_target_dist, limits=(0, clip_limit))
    return (clip_limit - clipped_obj_target_dist) / clip_limit


def calculate_grabber_object_dist_reward_term(
    object_position: Tuple[float, float, float],
    gripper_prop_link_pos: Tuple[float, float, float],
    left_finger_link_pos: Tuple[float, float, float],
    right_finger_link_pos: Tuple[float, float, float],
    clip_limit: float,
) -> float:
    """
    Calculate the Grabber->Object distance reward term, normalized b/w 0 & 1.

    Args:
        object_position (Tuple[float, float, float]): The 3D position of the object (x, y, z).
        gripper_prop_link_pos (Tuple[float, float, float]): The 3D position of the gripper's prop link (x, y, z).
        left_finger_link_pos (Tuple[float, float, float]): The 3D position of the left finger link (x, y, z).
        right_finger_link_pos (Tuple[float, float, float]): The 3D position of the right finger link (x, y, z).
        clip_limit (float): Value at which the distance is clipped (for normalization).

    Returns:
        float: A normalized reward value between 0 and 1 based on the grabber's distance to the object.
    """
    if any(pos is None for pos in [gripper_prop_link_pos, right_finger_link_pos, left_finger_link_pos]):
            return 0  # Don't reward gazebo errors
    grabber_base_dist = np.linalg.norm(gripper_prop_link_pos - object_position)
    left_finger_dist = np.linalg.norm(left_finger_link_pos - object_position)
    right_finger_dist = np.linalg.norm(right_finger_link_pos - object_position)
    grabber_obj_dist = np.mean(
        [grabber_base_dist, grabber_base_dist, left_finger_dist, right_finger_dist],
        axis=0,
    )
    clipped_grabber_obj_dist = clip_value(grabber_obj_dist, limits=(0, clip_limit))
    grabber_object_dist_reward = (clip_limit - clipped_grabber_obj_dist) / clip_limit
    return grabber_object_dist_reward


def calculate_reward(
    object_position: Tuple[float, float, float],
    obj_target_position: Tuple[float, float, float],
    gripper_prop_link_pos: Tuple[float, float, float],
    left_finger_link_pos: Tuple[float, float, float],
    right_finger_link_pos: Tuple[float, float, float],
    obj_target_dist_clip: float,
    grabber_obj_dist_clip: float,
) -> float:
    """
    Calculate the combined reward by combining individual reward terms and normalizing to be b/w -1 and 1.

    Args:
        object_position (Tuple[float, float, float]): The 3D position of the object (x, y, z).
        obj_target_position (Tuple[float, float, float]): The target position for the object (x, y, z).
        gripper_prop_link_pos (Tuple[float, float, float]): The 3D position of the gripper's prop link (x, y, z).
        left_finger_link_pos (Tuple[float, float, float]): The 3D position of the left finger link (x, y, z).
        right_finger_link_pos (Tuple[float, float, float]): The 3D position of the right finger link (x, y, z).
        obj_target_dist_clip (float): The distance at which the object-to-target reward is clipped.
        grabber_obj_dist_clip (float): The distance at which the grabber-to-object reward is clipped.

    Returns:
        float: The combined reward, which is a normalized value between 0 and 1.
    """
    obj_target_dist_reward = calculate_object_target_dist_reward_term(
        object_position, obj_target_position, obj_target_dist_clip
    )
    grabber_object_dist_reward = calculate_grabber_object_dist_reward_term(
        object_position,
        gripper_prop_link_pos,
        left_finger_link_pos,
        right_finger_link_pos,
        grabber_obj_dist_clip,
    )
    # Combine and normalize to range [-1, 1]
    return obj_target_dist_reward + grabber_object_dist_reward - 1


class PX100PickEnv(Env):
    MAX_STEPS_PER_EPISODE = 15
    PICKABLE_OBJ_START_POS = (0.2835, 0.0, 0.041)
    PICKABLE_OBJ_START_YAW = 1.5707963  # Make the "T" shape face the claw
    PICKABLE_OBJ_TARGET_POS = np.array([0.26, 0.0, 0.16])
    OBJ_TARGET_DIST_CLIP = (
        np.linalg.norm(np.array(PICKABLE_OBJ_START_POS) - PICKABLE_OBJ_TARGET_POS) * 1.09
    )
    GRABBER_OBJ_DIST_CLIP = 0.225
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
        joint_positions = self.px100.get_joint_positions()
        # Ignore finger positions since we are fixing open grip
        observation = joint_positions[:-2]

        # Reset episode state tracking variables
        self.n_steps_elapsed = 0

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
        # Take action
        current_joint_positions = self.px100.get_joint_positions()
        current_joint_positions = current_joint_positions[:-2]
        target_joint_positions = current_joint_positions + denormalize_action_vector(action)
        self.px100.set_joint_positions(
            waist=target_joint_positions[0],
            shoulder=target_joint_positions[1],
            elbow=target_joint_positions[2],
            wrist_angle=target_joint_positions[3]
        )

        # Get environment state information
        joint_positions = self.px100.get_joint_positions()
        object_position = get_gazebo_model_pose(PICKABLE_OBJ_MODEL_NAME)        
        gripper_prop_link_position = get_link_position(GRIPPER_PROP_LINK_NAME, self.tf_listener)
        right_finger_link_position = get_link_position(RIGHT_FINGER_LINK_NAME, self.tf_listener)
        left_finger_link_position = get_link_position(LEFT_FINGER_LINK_NAME, self.tf_listener)
        
        # Calculate reward using the helper function
        reward = calculate_reward(
            object_position=object_position,
            obj_target_position=self.PICKABLE_OBJ_TARGET_POS,
            gripper_prop_link_pos=gripper_prop_link_position,
            left_finger_link_pos=left_finger_link_position,
            right_finger_link_pos=right_finger_link_position,
            obj_target_dist_clip=self.OBJ_TARGET_DIST_CLIP,
            grabber_obj_dist_clip=self.GRABBER_OBJ_DIST_CLIP,
        )

        # Check for episode exit conditions
        done = self.n_steps_elapsed >= self.MAX_STEPS_PER_EPISODE
        truncated = False  # NOTE: False-we don't need to use this gymnasium flag
        if done is True:
            print(f"Episode final reward: {reward:.2f}")

        # Update episode state tracking variables
        self.n_steps_elapsed += 1

        # Ignoring fingers, normalize joint positions and return as observation
        norm_joint_positions = normalize_joint_positions(
            waist=joint_positions[0],
            shoulder=joint_positions[1],
            elbow=joint_positions[2],
            wrist_angle=joint_positions[3]
        )
        return norm_joint_positions[:-2], reward, done, truncated, {}
