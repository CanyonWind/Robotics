"""autogenerated by genpy from prx_utilities/planning_query_msg.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class planning_query_msg(genpy.Message):
  _md5sum = "8cd60d47a5924bccad7fb9133aa80db4"
  _type = "prx_utilities/planning_query_msg"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string planned_system
float64[] goal_state
float64[] start_state
bool smooth
float64 time_limit
int32 time_stamp

"""
  __slots__ = ['planned_system','goal_state','start_state','smooth','time_limit','time_stamp']
  _slot_types = ['string','float64[]','float64[]','bool','float64','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       planned_system,goal_state,start_state,smooth,time_limit,time_stamp

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(planning_query_msg, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.planned_system is None:
        self.planned_system = ''
      if self.goal_state is None:
        self.goal_state = []
      if self.start_state is None:
        self.start_state = []
      if self.smooth is None:
        self.smooth = False
      if self.time_limit is None:
        self.time_limit = 0.
      if self.time_stamp is None:
        self.time_stamp = 0
    else:
      self.planned_system = ''
      self.goal_state = []
      self.start_state = []
      self.smooth = False
      self.time_limit = 0.
      self.time_stamp = 0

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
      _x = self.planned_system
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.goal_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.goal_state))
      length = len(self.start_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.start_state))
      _x = self
      buff.write(_struct_Bdi.pack(_x.smooth, _x.time_limit, _x.time_stamp))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.planned_system = str[start:end].decode('utf-8')
      else:
        self.planned_system = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.goal_state = struct.unpack(pattern, str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.start_state = struct.unpack(pattern, str[start:end])
      _x = self
      start = end
      end += 13
      (_x.smooth, _x.time_limit, _x.time_stamp,) = _struct_Bdi.unpack(str[start:end])
      self.smooth = bool(self.smooth)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.planned_system
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.goal_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.goal_state.tostring())
      length = len(self.start_state)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.start_state.tostring())
      _x = self
      buff.write(_struct_Bdi.pack(_x.smooth, _x.time_limit, _x.time_stamp))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.planned_system = str[start:end].decode('utf-8')
      else:
        self.planned_system = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.goal_state = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.start_state = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      _x = self
      start = end
      end += 13
      (_x.smooth, _x.time_limit, _x.time_stamp,) = _struct_Bdi.unpack(str[start:end])
      self.smooth = bool(self.smooth)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_Bdi = struct.Struct("<Bdi")