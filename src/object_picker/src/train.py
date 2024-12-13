#!/usr/bin/env python
from typing import Literal, Optional

import time
import rospy
from stable_baselines3 import SAC, PPO
from stable_baselines3.common.callbacks import CheckpointCallback

from env import PX100PickEnv
from config import TENSORBOARD_LOG_DIR, CHECKPOINT_DIR
from utils import unpause_gazebo


def train(#!/usr/bin/env python
from typing import Literal, Optional, List
import time
import datetime

import numpy as np
import rospy
from stable_baselines3 import SAC, PPO
from stable_baselines3.common.callbacks import CheckpointCallback
from stable_baselines3.common.callbacks import BaseCallback
from imitation.algorithms import bc
from imitation.data import rollout
import imitation.data.types

from env import PX100PickEnv
from config import TENSORBOARD_LOG_DIR, CHECKPOINT_DIR, EXPERT_TRAJECTORY
from utils import unpause_gazebo


def get_trajectory(trajectory: List[np.ndarray], env: PX100PickEnv):
    state = env.reset()
    # HACK: For some reason, it is prone to not resetting properly first try
    # So, we execute an arbitrary action and reset again to be safe
    env.step(np.array([0.0, 0.0, 0.0, 0.0]))
    state, info = env.reset()
    states = []
    actions = []
    rewards = []
    for action in trajectory:
        states.append(state)
        actions.append(action)
        state, reward, terminated, truncated, info = env.step(action)
        rewards.append(reward)
        if terminated or truncated:
            break
    states.append(state)
    states = np.array(states)
    actions = np.array(actions)
    rewards = np.array(rewards)
    return imitation.data.types.Trajectory(
        obs=states,
        acts=actions,
        infos=None,
        terminal=True,
    )


def train(
    algorithm: Literal["PPO", "SAC"],
    vary_object_position: bool,
    use_imitation_learning: bool,
    load_checkpoint_path: Optional[str] = None,
):
    """Main entrypoint for policy training"""

    rewards_since_checkpoint = []

    class CustomSaveRewardsCallback(BaseCallback):
        def __init__(self, verbose=0):
            super().__init__(verbose)
            self.steps_since_save = 0
            dt_str = datetime.datetime.now().strftime("%a-%m-%y-%I:%M:%S-%p")
            print(dt_str)
            self.fname = f"episode_rewards-{dt_str}.txt"

        def _on_step(self) -> bool:
            if self.steps_since_save >= 100:
                nonlocal rewards_since_checkpoint
                with open(self.fname, "a") as file:  # 'a'=append-mode
                    for reward in rewards_since_checkpoint:
                        file.write(f"{reward}\n")
                rewards_since_checkpoint = []
                self.steps_since_save = 0
            self.steps_since_save += 1
            return True

    def add_reward_to_list_since_checkpoint(reward: float):
        nonlocal rewards_since_checkpoint
        rewards_since_checkpoint.append(reward)

    rospy.init_node("px100_training")
    unpause_gazebo()
    time.sleep(1)  # Necessary after unpausing gazebo
    env = PX100PickEnv(episode_end_callback=add_reward_to_list_since_checkpoint)

    if use_imitation_learning is True:
        trajectory = get_trajectory(EXPERT_TRAJECTORY, env)
        trajectories = [trajectory] * 64
        bc_trainer = bc.BC(
            observation_space=env.observation_space,
            action_space=env.action_space,
            demonstrations=rollout.flatten_trajectories(trajectories=trajectories),
            rng=np.random.default_rng(),
        )
        bc_trainer.train(n_epochs=100)
        learned_policy = bc_trainer.policy
        env.is_first_reset = True
        if algorithm == "SAC":
            model = SAC(
                "MlpPolicy",
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
                n_steps=4096,
            )
            model.policy.load_state_dict(learned_policy.state_dict())
        elif algorithm == "PPO":
            model = PPO(
                "MlpPolicy",
                env,
                verbose=1,
                policy_kwargs={"net_arch": learned_policy.net_arch},
                tensorboard_log=TENSORBOARD_LOG_DIR,
                n_steps=4096,
            )
            model.policy.load_state_dict(learned_policy.state_dict())
        else:
            raise NotImplementedError

    elif algorithm == "SAC":
        if load_checkpoint_path is None:
            model = SAC(
                "MlpPolicy",
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
                n_steps=4096,
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
                "MlpPolicy",
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
                n_steps=4096,
            )
        else:
            model = PPO.load(
                load_checkpoint_path,
                env,
                verbose=1,
                tensorboard_log=TENSORBOARD_LOG_DIR,
            )
    else:
        raise NotImplementedError
    checkpoint_name_prefix = f"px100_{algorithm}"
    checkpoint_name_prefix += "_pos-varied" if vary_object_position else "_static-pos"
    checkpoint_name_prefix += "_imit-learning" if use_imitation_learning else ""
    checkpoint_callback = CheckpointCallback(
        save_freq=5000,
        save_path=CHECKPOINT_DIR,
        name_prefix=checkpoint_name_prefix,
        save_replay_buffer=True,
        save_vecnormalize=True,
    )

    model.learn(
        log_interval=50,
        total_timesteps=10_000_000,
        callback=[checkpoint_callback, CustomSaveRewardsCallback()],
    )
    print("Training complete.")


# NOTE: Run the following two commands in their own terminals before running this script:
#   1. `roscore`
#   2. `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true`
#       or
#      `roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true gui:=false use_rviz:=true`

if __name__ == "__main__":
    train(algorithm="PPO", vary_object_position=False, use_imitation_learning=True)

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
                n_steps=4096,
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
                n_steps=4096,
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
    train(algorithm="PPO", vary_object_position=False, use_imitation_learning=False, load_checkpoint_path=f"/my_ros_data/cs119_robotics_final_project/src/object_picker/checkpoints/px100_PPO_static-pos_130000_steps.zip")
