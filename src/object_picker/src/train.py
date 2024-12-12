#!/usr/bin/env python
from typing import Literal, Optional

import time
import rospy
from stable_baselines3 import SAC, PPO
from stable_baselines3.common.callbacks import CheckpointCallback

from env import PX100PickEnv
from config import TENSORBOARD_LOG_DIR, CHECKPOINT_DIR
from utils import unpause_gazebo


def train(
    algorithm: Literal["PPO", "SAC"],
    vary_object_position: bool,
    use_imitation_learning: bool,
    load_checkpoint_path: Optional[str] = None,
):
    """Main entrypoint for policy training"""
    rospy.init_node("px100_training")
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpausing gazebo
    env = PX100PickEnv()
    if algorithm == "SAC":
        if load_checkpoint_path is None:
            model = SAC(
                "MlpPolicy", env, verbose=1, tensorboard_log=TENSORBOARD_LOG_DIR, n_steps=4096
            )
        else:
            model = SAC.load(
                load_checkpoint_path,
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
            )
    elif algorithm == "PPO":
        if load_checkpoint_path is None:
            model = PPO(
                "MlpPolicy", env, verbose=1, tensorboard_log=TENSORBOARD_LOG_DIR, n_steps=4096
            )
        else:
            model = PPO.load(
                load_checkpoint_path,
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
            )
    checkpoint_name_prefix = f"px100_{algorithm}"
    checkpoint_name_prefix += "_pos-varied" if vary_object_position else "_static-pos"
    checkpoint_name_prefix += "_imit-learning" if use_imitation_learning else ""
    checkpoint_callback = CheckpointCallback(
        save_freq=10000,
        save_path=CHECKPOINT_DIR,
        name_prefix=checkpoint_name_prefix,
        save_replay_buffer=True,
        save_vecnormalize=True,
    )
    model.learn(
        log_interval=50, total_timesteps=10_000_000, callback=checkpoint_callback
    )
    print("Training complete.")


# NOTE: Run the following two commands in their own terminals before running this script:
#   1. `roscore`
#   2. `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true`
#       or
#      `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true gui:=false use_rviz:=true`

if __name__ == "__main__":
    train(algorithm="PPO", vary_object_position=False, use_imitation_learning=False)
