// Generated by gencpp from file brl_pxh_api/GripperMotionGoal.msg
// DO NOT EDIT!


#ifndef BRL_PXH_API_MESSAGE_GRIPPERMOTIONGOAL_H
#define BRL_PXH_API_MESSAGE_GRIPPERMOTIONGOAL_H


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
struct GripperMotionGoal_
{
  typedef GripperMotionGoal_<ContainerAllocator> Type;

  GripperMotionGoal_()
    : delay(0.0)  {
    }
  GripperMotionGoal_(const ContainerAllocator& _alloc)
    : delay(0.0)  {
  (void)_alloc;
    }



   typedef float _delay_type;
  _delay_type delay;





  typedef boost::shared_ptr< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct GripperMotionGoal_

typedef ::brl_pxh_api::GripperMotionGoal_<std::allocator<void> > GripperMotionGoal;

typedef boost::shared_ptr< ::brl_pxh_api::GripperMotionGoal > GripperMotionGoalPtr;
typedef boost::shared_ptr< ::brl_pxh_api::GripperMotionGoal const> GripperMotionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator1> & lhs, const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator2> & rhs)
{
  return lhs.delay == rhs.delay;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator1> & lhs, const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace brl_pxh_api

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "083c040d329e25abca99d1f85a44138c";
  }

  static const char* value(const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x083c040d329e25abULL;
  static const uint64_t static_value2 = 0xca99d1f85a44138cULL;
};

template<class ContainerAllocator>
struct DataType< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "brl_pxh_api/GripperMotionGoal";
  }

  static const char* value(const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Goal\n"
"float32 delay \n"
;
  }

  static const char* value(const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.delay);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperMotionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::brl_pxh_api::GripperMotionGoal_<ContainerAllocator>& v)
  {
    s << indent << "delay: ";
    Printer<float>::stream(s, indent + "  ", v.delay);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BRL_PXH_API_MESSAGE_GRIPPERMOTIONGOAL_H
