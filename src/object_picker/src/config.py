#!/usr/bin/env python
import numpy as np

# Misc
TENSORBOARD_LOG_DIR = "./src/object_picker/logs/"
CHECKPOINT_DIR = "./src/object_picker/checkpoints/"

# Valid position ranges
WAIST_LIM = (-3.141583, 3.141583)
SHOULDER_LIM = (-1.937315, 1.867502)
ELBOW_LIM = (-2.111848, 1.605703)
WRIST_ANGLE_LIM = (-1.745329, 0)  # Hard limit to 0, preventing downward tilt
RIGHT_FINGER_LIM = (-0.036, -0.017)
LEFT_FINGER_LIM = (0.017, 0.036)

# Max position change per step
MAX_WAIST_DELTA = (WAIST_LIM[1] - WAIST_LIM[0]) / 100
MAX_SHOULDER_DELTA = (SHOULDER_LIM[1] - SHOULDER_LIM[0]) / 25
MAX_ELBOW_DELTA = (ELBOW_LIM[1] - ELBOW_LIM[0]) / 25
MAX_WRIST_ANGLE_DELTA = (WRIST_ANGLE_LIM[1] - WRIST_ANGLE_LIM[0]) / 10
# No longer needed since we are fixing the fingers to the open position
# MAX_RIGHT_FINGER_DELTA = (RIGHT_FINGER_LIM[1] - RIGHT_FINGER_LIM[0]) / 4  # was 15
# MAX_LEFT_FINGER_DELTA = (LEFT_FINGER_LIM[1] - LEFT_FINGER_LIM[0]) / 4  # was 15

# Observation space bounds
OBS_SPACE_LOW = [
    0,
    0,
    0,
    0,
    # No longer observe finger since we are fixing the fingers to the open position
]
OBS_SPACE_HIGH = [
    1,
    1,
    1,
    1,
    # No longer observe finger since we are fixing the fingers to the open position
]

# Action space bounds
ACTION_SPACE_LOW = [
    -1,
    -1,
    -1,
    -1,
    # No longer act on finger since we are fixing the fingers to the open position
]
ACTION_SPACE_HIGH = [
    1,
    1,
    1,
    1,
    # No longer act on finger since we are fixing the fingers to the open position
]

GRABBER_PROP_LINK_NAME = "px100/gripper_prop_link"
RIGHT_FINGER_LINK_NAME = "px100/right_finger_link"
LEFT_FINGER_LINK_NAME = "px100/left_finger_link"


EXPERT_TRAJECTORY = [
    # Position in front
    np.array([0, 0.0042087333, 0.9907400114, -0.9922135049]),
    np.array([0, 0.0042087333, 0.9707400114, -0.9922135049]),
    np.array([0, 0.1042087333, 0.1707400114, -0.9922135049]),
    np.array([0, 0.2042087333, 0.0707400114, -0.9822135049]),
    np.array([0, 0.9042087333, 0.0507400114, -0.9822135049]),
    np.array([0, 0.9342087333, 0, -0.9722135049]),
    np.array([0, 0.9542087333, 0, -0.9622135049]),
    np.array([0, 0.9742087333, -0.13, -0.4]),
    np.array([0, 0.9742087333, -0.27, -0.3]),
    np.array([0, 0.9842087333, -0.28, -0.2]),
    # Spear the pallette
    np.array([0, 0.3185309123, -0.9989828766, 0.5864789389]),
    np.array([0, 0.3185309123, -0.9989828766, 0.5564789389]),
    np.array([0, 0.3085309123, -0.9969828766, 0.3964789389]),
    np.array([0, 0.3185309123, -0.9969828766, 0.3864789389]),
    np.array([0, 0.3185309123, -0.9869828766, 0.3764789389]),
    np.array([0, 0.3185309123, -0.9769828766, 0.3764789389]),
    np.array([0, 0.3185309123, -0.9669828766, 0.3464789389]),
    np.array([0, 0.3185309123, -0.9369828766, 0.3764789389]),
    np.array([0, 0.3185309123, -0.8269828766, 0.3064789389]),
    # Pick up
    np.array([0, -0.14, -0.9406071632, 0.39]),
    np.array([0, -0.14, -0.9406071632, 0.38]),
    np.array([0, -0.14, -0.9406071632, 0.38]),
    np.array([0, -0.1, -0.9406071632, 0.35]),
    np.array([0, -0.0, -0.0, 0.15]),
    # Chill
    np.array([0, -0.1, -0.1406071632, 0.01]),
    np.array([0, -0.1, -0.1406071632, 0.01]),
    np.array([0, -0.1, -0.1406071632, 0.01]),
    np.array([0, -0.1, -0.1406071632, 0.01]),
    np.array([0, -0.1, -0.1406071632, 0.01]),
    np.array([0, -0.1, -0.1406071632, 0.01]),
]


PICKABLE_OBJ_MODEL_NAME = "t_object"
PICKABLE_OBJ_SDF = f"""
<?xml version="1.0" ?>
<sdf version='1.6'>
  <model name='{PICKABLE_OBJ_MODEL_NAME}'>
    <link name="link">
      <inertial>
        <mass>0.38</mass>
        <pose>0 0 0 0 0 0</pose>
        <inertia>
          <ixx>0.00125</ixx>
          <ixy>0</ixy>
          <ixz>0</ixz>
          <iyy>0.00125</iyy>
          <iyz>0</iyz>
          <izz>0.00025</izz>
        </inertia>
      </inertial>
      <collision name="collision_vertical">
        <pose>0 0 -0.029 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.058</size>
          </box>
        </geometry>
        <surface>
          <friction>
            <ode>
              <mu>1.0</mu>
              <mu2>1.0</mu2>
            </ode>
          </friction>
        </surface>
      </collision>
      <collision name="collision_horizontal">
        <pose>0 0 0.005 0 0 0</pose>
        <geometry>
          <box>
            <size>0.057 0.01 0.01</size>
          </box>
        </geometry>58
              <mu2>10.0</mu2>
            </ode>
          </friction>
        </surface>
      </collision>
      <visual name="visual_vertical">
        <pose>0 0 -0.029 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.058</size>
          </box>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Wood</name>
          </script>
        </material>
      </visual>
      <visual name="visual_horizontal">
        <pose>0 0 0.005 0 0 0</pose>
        <geometry>
          <box>
            <size>0.057 0.01 0.01</size>
          </box>
        </geometry>
        <material>
          <script>
            <name>Gazebo/Wood</name>
          </script>
        </material>
      </visual>
    </link>
  </model>
</sdf>
"""
