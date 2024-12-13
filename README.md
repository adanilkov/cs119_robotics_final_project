# PX100 RL Trained Object Picker

### Authors
Sonny George & Alex Danilkovas

### ROS Version
Noetic

### Dependencies 
This workspace relies on the following software and libraries: 
#### ROS Packages 
- [`ros-noetic-interbotix-xsarm`](https://docs.trossenrobotics.com/interbotix_xsarms_docs/ros_interface/ros1/software_setup.html#amd64-architecture)
- `ros-noetic-gazebo-ros` 
#### Python Libraries 
- `rospy` 
- `gym`
- `torch`
-  `numpy` 
#### Other Tools 
- Gazebo
- RViz

## Codebase Details

Altough a ROS package, this repository is meant to be used as a workspace, `object-picker` supports the Interbotix px100 robot arm and includes:

1. **Training RL policies** (PPO or SAC) for picking up a "T"-shaped object.
2. **Initializing policies with IL** (Behavioral Cloning).
3. **Running trained policies** on the real robot.
4. **Pre-trained models** from our experiments.

To see more details on both our process and general information (via our lab notebook), click [`here`](https://campusrover.github.io/labnotebook2/reports/2024/rl-trained_object_picker/)

Video Walkthrough:

[![https://youtu.be/48MWSUeu9Rg](https://img.youtube.com/vi/48MWSUeu9Rg/0.jpg)](https://www.youtube.com/watch?v=48MWSUeu9Rg)

### Code Structure

The `src` of our package (`object-picker`) is structured as follows:

```python
📁 src
├── 📄 config.py # global constants and parameters
├── 📄 env.py    # training-env code (reward logic & training primitives)
├── 📄 gazebo.py # code handling topic and service comms with gazebo sim
├── 📄 run.py    # loads and runs policies on real px100
├── 📄 train.py  # main entrypoint for training
└── 📄 utils.py  # generic helper functions
```

### How to Run the Code

ℹ️ **Run training:** To run the training script with the parameters specified in the `if __name__ == '__main__':` block, you must:

1. Launch ROS with:
    ```bash
    roslaunch
    ```
2. Start the Gazebo simulation with:
    ```bash
    roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true gui:=false use_rviz:=true
    ```
    Or (depending on whether you want the Gazebo GUI or RViz to open)
    ```bash
    roslaunch interbotix_xsarm_gazebo xsarm_gazebo.launch robot_model:=px100 use_position_controllers:=true gui:=true
    ```
3. Start the training script with:
    ```bash
    rosrun object-picker train.py
    ```
    Or, `cd` into the `src` directory and run:
    ```bash
    python train.py
    ```


ℹ️ **Run real px100:** To run the trained models on the real px100 robot arm:

1. Run:
    ```bash
    rosrun object-picker run.py
    ```
    Or, `cd` into the `src` directory and run:
    ```bash
    python run.py
    ```

### Reward Function

The reward function is stateful and is as follows:

1. **_'Assuming lifting position'_ term** term:
    - **_'Get low'_ term:** Z-value of gripper
    - **_'Get close'_ term:** Only once the gripper is low (and not before), the negative of the distance between the gripper and the object (since the forklift must get low before it can insert).
        - Once the gripper is both low and close (and not before), the _'get low'_ term is removed and replaced with a constant `1.0` (to prevent the _'get low'_ term from discouraging the lifting up of the object).
2. **_'Lifting the object'_ term:** The negative of the distance between the object and the goal position (raised in the air).

### Nodes Created

| Node Created | Function |
| --- | --- |
| `px100-training` | Orchestrate policy training by:<br>1. subscribing to the joint-state topics<br>2. publishing to joint-control topics |

### Topics Used

| Topics and Their Messages | Function |
| --- | --- |
| `/px100/waist_controller/state` | publish waist position |
| `/px100/waist_controller/command` | receive target waist position commands |
| `/px100/shoulder_controller/state` | publish shoulder position |
| `/px100/shoulder_controller/command` | receive target shoulder position commands |
| `/px100/elbow_controller/state` | publish elbow position |
| `/px100/elbow_controller/command` | receive target elbow position commands |
| `/px100/wrist_angle_controller/state` | publish wrist angle position |
| `/px100/wrist_angle_controller/command` | receive target wrist angle position commands |
| `/px100/right_finger_controller/state` | publish right finger position |
| `/px100/right_finger_controller/command` | receive target right finger position commands |
| `/px100/left_finger_controller/state` | publish right finger position |
| `/px100/left_finger_controller/command` | receive target right finger position commands |
