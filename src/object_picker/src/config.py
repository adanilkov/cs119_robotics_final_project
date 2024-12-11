# Misc
TENSORBOARD_LOG_DIR = "./src/object_picker/logs/"
CHECKPOINT_DIR = "./src/object_picker/checkpoints/"

# Valid position ranges
WAIST_LIM = (-3.141583, 3.141583)
SHOULDER_LIM = (-1.937315, 1.867502)
ELBOW_LIM = (-2.111848, 1.605703)
WRIST_ANGLE_LIM = (-1.745329, 0) # Hard limit to 0, was 
RIGHT_FINGER_LIM = (-0.036, -0.017)
LEFT_FINGER_LIM = (0.017, 0.036)

# Max position change per step
MAX_WAIST_DELTA = (WAIST_LIM[1] - WAIST_LIM[0]) / 100
MAX_SHOULDER_DELTA = (SHOULDER_LIM[1] - SHOULDER_LIM[0]) / 25
MAX_ELBOW_DELTA = (ELBOW_LIM[1] - ELBOW_LIM[0]) / 25
MAX_WRIST_ANGLE_DELTA = (WRIST_ANGLE_LIM[1] - WRIST_ANGLE_LIM[0]) / 8
MAX_RIGHT_FINGER_DELTA = (RIGHT_FINGER_LIM[1] - RIGHT_FINGER_LIM[0]) / 4  # was 15
MAX_LEFT_FINGER_DELTA = (LEFT_FINGER_LIM[1] - LEFT_FINGER_LIM[0]) / 4  # was 15

# Observation space bounds
OBS_SPACE_LOW = [
    WAIST_LIM[0],
    SHOULDER_LIM[0],
    ELBOW_LIM[0],
    WRIST_ANGLE_LIM[0],
    RIGHT_FINGER_LIM[0],
    LEFT_FINGER_LIM[0],
]
OBS_SPACE_HIGH = [
    WAIST_LIM[1],
    SHOULDER_LIM[1],
    ELBOW_LIM[1],
    WRIST_ANGLE_LIM[1],
    RIGHT_FINGER_LIM[1],
    LEFT_FINGER_LIM[1],
]

# Action space bounds
ACTION_SPACE_LOW = [
    -MAX_WAIST_DELTA,
    -MAX_SHOULDER_DELTA,
    -MAX_ELBOW_DELTA,
    -MAX_WRIST_ANGLE_DELTA,
    -MAX_RIGHT_FINGER_DELTA,
    -MAX_LEFT_FINGER_DELTA,
]
ACTION_SPACE_HIGH = [
    MAX_WAIST_DELTA,
    MAX_SHOULDER_DELTA,
    MAX_ELBOW_DELTA,
    MAX_WRIST_ANGLE_DELTA,
    MAX_RIGHT_FINGER_DELTA,
    MAX_LEFT_FINGER_DELTA,
]

GRIPPER_PROP_LINK_NAME = "px100/gripper_prop_link"
RIGHT_FINGER_LINK_NAME = "px100/right_finger_link"
LEFT_FINGER_LINK_NAME = "px100/left_finger_link"

PICKABLE_OBJ_MODEL_NAME = "t_object"
PICKABLE_OBJ_SDF = f"""
<?xml version="1.0" ?>
<sdf version='1.6'>
  <model name='{PICKABLE_OBJ_MODEL_NAME}'>
    <link name="link">
      <inertial>
        <mass>0.1</mass>
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
        <pose>0 0 -0.02 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.04</size>
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
            <size>0.04 0.01 0.01</size>
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
      <visual name="visual_vertical">
        <pose>0 0 -0.02 0 0 0</pose>
        <geometry>
          <box>
            <size>0.01 0.01 0.04</size>
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
            <size>0.04 0.01 0.01</size>
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