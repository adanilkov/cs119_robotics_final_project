// Generated by gencpp from file brl_pxh_api/EePoseCompGoal.msg
// DO NOT EDIT!


#ifndef BRL_PXH_API_MESSAGE_EEPOSECOMPGOAL_H
#define BRL_PXH_API_MESSAGE_EEPOSECOMPGOAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace brl_pxh_api
{
template <class ContainerAllocator>
struct EePoseCompGoal_
{
  typedef EePoseCompGoal_<ContainerAllocator> Type;

  EePoseCompGoal_()
    : x(0.0)
    , z(0.0)
    , roll(0.0)
    , pitch(0.0)
    , execute(false)
    , moving_time(0.0)
    , accel_time(0.0)
    , blocking(false)  {
    }
  EePoseCompGoal_(const ContainerAllocator& _alloc)
    : x(0.0)
    , z(0.0)
    , roll(0.0)
    , pitch(0.0)
    , execute(false)
    , moving_time(0.0)
    , accel_time(0.0)
    , blocking(false)  {
  (void)_alloc;
    }



   typedef float _x_type;
  _x_type x;

   typedef float _z_type;
  _z_type z;

   typedef float _roll_type;
  _roll_type roll;

   typedef float _pitch_type;
  _pitch_type pitch;

   typedef uint8_t _execute_type;
  _execute_type execute;

   typedef float _moving_time_type;
  _moving_time_type moving_time;

   typedef float _accel_time_type;
  _accel_time_type accel_time;

   typedef uint8_t _blocking_type;
  _blocking_type blocking;





  typedef boost::shared_ptr< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> const> ConstPtr;

}; // struct EePoseCompGoal_

typedef ::brl_pxh_api::EePoseCompGoal_<std::allocator<void> > EePoseCompGoal;

typedef boost::shared_ptr< ::brl_pxh_api::EePoseCompGoal > EePoseCompGoalPtr;
typedef boost::shared_ptr< ::brl_pxh_api::EePoseCompGoal const> EePoseCompGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator1> & lhs, const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.z == rhs.z &&
    lhs.roll == rhs.roll &&
    lhs.pitch == rhs.pitch &&
    lhs.execute == rhs.execute &&
    lhs.moving_time == rhs.moving_time &&
    lhs.accel_time == rhs.accel_time &&
    lhs.blocking == rhs.blocking;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator1> & lhs, const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace brl_pxh_api

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7d4193829330657a5eee6b3438daef12";
  }

  static const char* value(const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7d4193829330657aULL;
  static const uint64_t static_value2 = 0x5eee6b3438daef12ULL;
};

template<class ContainerAllocator>
struct DataType< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "brl_pxh_api/EePoseCompGoal";
  }

  static const char* value(const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Goal\n"
"float32 x\n"
"float32 z\n"
"float32 roll\n"
"float32 pitch\n"
"bool execute\n"
"float32 moving_time\n"
"float32 accel_time \n"
"bool blocking\n"
;
  }

  static const char* value(const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.z);
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.execute);
      stream.next(m.moving_time);
      stream.next(m.accel_time);
      stream.next(m.blocking);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EePoseCompGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::brl_pxh_api::EePoseCompGoal_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "z: ";
    Printer<float>::stream(s, indent + "  ", v.z);
    s << indent << "roll: ";
    Printer<float>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<float>::stream(s, indent + "  ", v.pitch);
    s << indent << "execute: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.execute);
    s << indent << "moving_time: ";
    Printer<float>::stream(s, indent + "  ", v.moving_time);
    s << indent << "accel_time: ";
    Printer<float>::stream(s, indent + "  ", v.accel_time);
    s << indent << "blocking: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.blocking);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BRL_PXH_API_MESSAGE_EEPOSECOMPGOAL_H
