# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from brl_pxh_api/CartTrajGoal.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class CartTrajGoal(genpy.Message):
  _md5sum = "db3424a7a9bc8795db95e0a23d1c2e25"
  _type = "brl_pxh_api/CartTrajGoal"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Goal
float32 x
float32 z
float32 roll
float32 pitch
float32 moving_time
float32 wp_moving_time
float32 wp_accel_time
float32 wp_period
"""
  __slots__ = ['x','z','roll','pitch','moving_time','wp_moving_time','wp_accel_time','wp_period']
  _slot_types = ['float32','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       x,z,roll,pitch,moving_time,wp_moving_time,wp_accel_time,wp_period

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CartTrajGoal, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.x is None:
        self.x = 0.
      if self.z is None:
        self.z = 0.
      if self.roll is None:
        self.roll = 0.
      if self.pitch is None:
        self.pitch = 0.
      if self.moving_time is None:
        self.moving_time = 0.
      if self.wp_moving_time is None:
        self.wp_moving_time = 0.
      if self.wp_accel_time is None:
        self.wp_accel_time = 0.
      if self.wp_period is None:
        self.wp_period = 0.
    else:
      self.x = 0.
      self.z = 0.
      self.roll = 0.
      self.pitch = 0.
      self.moving_time = 0.
      self.wp_moving_time = 0.
      self.wp_accel_time = 0.
      self.wp_period = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_8f().pack(_x.x, _x.z, _x.roll, _x.pitch, _x.moving_time, _x.wp_moving_time, _x.wp_accel_time, _x.wp_period))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.x, _x.z, _x.roll, _x.pitch, _x.moving_time, _x.wp_moving_time, _x.wp_accel_time, _x.wp_period,) = _get_struct_8f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_8f().pack(_x.x, _x.z, _x.roll, _x.pitch, _x.moving_time, _x.wp_moving_time, _x.wp_accel_time, _x.wp_period))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 32
      (_x.x, _x.z, _x.roll, _x.pitch, _x.moving_time, _x.wp_moving_time, _x.wp_accel_time, _x.wp_period,) = _get_struct_8f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_8f = None
def _get_struct_8f():
    global _struct_8f
    if _struct_8f is None:
        _struct_8f = struct.Struct("<8f")
    return _struct_8f
