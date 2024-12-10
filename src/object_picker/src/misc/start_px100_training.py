#!/usr/bin/env python3
"""Training entrypoint script."""
import os
import re

import gymnasium as gym
import numpy as np
import rospkg
import rospy
import torch
from ros_gazebo_gym.common.helpers import (
    list_2_human_text,
    to_pascal_case,
    to_snake_case,
)
from ros_gazebo_gym.core.helpers import ros_exit_gracefully
from ros_gazebo_gym.task_envs.task_envs_list import ENVS
from stable_baselines3 import SAC

ENV_ID = ""
LEARNING_RATE = 0.003
LEARNING_STARTS = 100
GAMMA = 0.97  # Discount factor
N_EPISODES = 2
N_STEPS = 100
INFERENCE = True
INFERENCE_N_EPISODES = 2


if __name__ == "__main__":
    rospy.init_node(
        "px100_training",
        anonymous=True,
    )

    # Initialize the ros_gazebo_gym Panda environment.
    rospy.loginfo(f"Creating ros_gazebo_gym '{ENV_ID}' gymnasium environment...")
    env = gym.make(
        env_id,
        control_type=control_type,
        positive_reward=positive_reward,  # These are like command args (strings?)
        action_space_dtype=np.float32,
        observation_space_dtype=np.float32,
    )

    # Initialize the logging system.
    rospack = rospkg.RosPack()
    pkg_path = rospack.get_path("object_picker")
    outdir = os.path.join(pkg_path, "training_results")
    last_time_steps = np.ndarray(0)

    # Overwrite the max episode steps of the environment.
    env._max_episode_steps = N_STEPS

    # Convert goal gymnasium env to normal gymnasium env.
    env = gym.wrappers.FlattenObservation(env)

    # Initializes the algorithm that we are going to use for learning.
    torch.cuda.empty_cache()  # NOTE: Done to avoid CUDA out of memory error.
    model = SAC("MlpPolicy", env, verbose=1, gamma=GAMMA, learning_rate=LEARNING_RATE)

    # Train the algorithm.
    rospy.loginfo("Start training...")
    model.learn(total_timesteps=total_timesteps, log_interval=4)
    rospy.loginfo("Training finished")

    # Safe policy.
    model_save_dir = os.path.join(outdir, "panda_baselines")
    model.save(str(model_save_dir))

    # Run inference.
    inference_ep_ret = []
    inference_ep_len = []
    if INFERENCE:
        rospy.logwarn("Starting inference...")
        obs, _ = env.reset()
        highest_reward = 0
        terminated, truncated, ep_ret, ep_len, n = False, False, 0, 0, 0
        rospy.logwarn("Episode: {}".format(n + 1))
        while n < INFERENCE_N_EPISODES:
            action, _ = model.predict(obs, deterministic=True)
            obs, reward, terminated, truncated, info = env.step(action)
            ep_ret += reward
            ep_len += 1

            if terminated or truncated:
                rospy.logdebug("Environment terminated or truncated. Resetting.")
                obs, _ = env.reset()
                inference_ep_ret.append(ep_ret)
                inference_ep_len.append(ep_len)
                terminated, truncated, ep_ret, ep_len, n = False, False, 0, 0, n + 1
                if n < INFERENCE_N_EPISODES:
                    rospy.logwarn("Episode: {}".format(n + 1))
        rospy.logwarn("Inference finished.")

        # Display inference diagnostics.
        mean_ep_ret = np.mean(inference_ep_ret)
        mean_ep_len = np.mean(inference_ep_len, dtype=np.int32)
        print("")
        rospy.logwarn("==Inference diagnostics==")
        rospy.logwarn(f"Mean EpRet: {mean_ep_ret}")
        rospy.logwarn(f"Mean EpLen: {mean_ep_len}")
        rospy.logwarn("=========================")

        env.close()
