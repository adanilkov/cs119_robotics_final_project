// Generated by gencpp from file panda_gazebo/GetMoveItControlledJointsResponse.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_GETMOVEITCONTROLLEDJOINTSRESPONSE_H
#define PANDA_GAZEBO_MESSAGE_GETMOVEITCONTROLLEDJOINTSRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace panda_gazebo
{
template <class ContainerAllocator>
struct GetMoveItControlledJointsResponse_
{
  typedef GetMoveItControlledJointsResponse_<ContainerAllocator> Type;

  GetMoveItControlledJointsResponse_()
    : controlled_joints()
    , controlled_joints_arm()
    , controlled_joints_hand()
    , success(false)
    , message()  {
    }
  GetMoveItControlledJointsResponse_(const ContainerAllocator& _alloc)
    : controlled_joints(_alloc)
    , controlled_joints_arm(_alloc)
    , controlled_joints_hand(_alloc)
    , success(false)
    , message(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _controlled_joints_type;
  _controlled_joints_type controlled_joints;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _controlled_joints_arm_type;
  _controlled_joints_arm_type controlled_joints_arm;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _controlled_joints_hand_type;
  _controlled_joints_hand_type controlled_joints_hand;

   typedef uint8_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetMoveItControlledJointsResponse_

typedef ::panda_gazebo::GetMoveItControlledJointsResponse_<std::allocator<void> > GetMoveItControlledJointsResponse;

typedef boost::shared_ptr< ::panda_gazebo::GetMoveItControlledJointsResponse > GetMoveItControlledJointsResponsePtr;
typedef boost::shared_ptr< ::panda_gazebo::GetMoveItControlledJointsResponse const> GetMoveItControlledJointsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator2> & rhs)
{
  return lhs.controlled_joints == rhs.controlled_joints &&
    lhs.controlled_joints_arm == rhs.controlled_joints_arm &&
    lhs.controlled_joints_hand == rhs.controlled_joints_hand &&
    lhs.success == rhs.success &&
    lhs.message == rhs.message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace panda_gazebo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "de338cfffbebe92f5e336e5f98b28598";
  }

  static const char* value(const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xde338cfffbebe92fULL;
  static const uint64_t static_value2 = 0x5e336e5f98b28598ULL;
};

template<class ContainerAllocator>
struct DataType< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "panda_gazebo/GetMoveItControlledJointsResponse";
  }

  static const char* value(const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string[] controlled_joints\n"
"string[] controlled_joints_arm\n"
"string[] controlled_joints_hand\n"
"bool success\n"
"string message\n"
"\n"
;
  }

  static const char* value(const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.controlled_joints);
      stream.next(m.controlled_joints_arm);
      stream.next(m.controlled_joints_hand);
      stream.next(m.success);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetMoveItControlledJointsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::panda_gazebo::GetMoveItControlledJointsResponse_<ContainerAllocator>& v)
  {
    s << indent << "controlled_joints[]" << std::endl;
    for (size_t i = 0; i < v.controlled_joints.size(); ++i)
    {
      s << indent << "  controlled_joints[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.controlled_joints[i]);
    }
    s << indent << "controlled_joints_arm[]" << std::endl;
    for (size_t i = 0; i < v.controlled_joints_arm.size(); ++i)
    {
      s << indent << "  controlled_joints_arm[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.controlled_joints_arm[i]);
    }
    s << indent << "controlled_joints_hand[]" << std::endl;
    for (size_t i = 0; i < v.controlled_joints_hand.size(); ++i)
    {
      s << indent << "  controlled_joints_hand[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.controlled_joints_hand[i]);
    }
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_GETMOVEITCONTROLLEDJOINTSRESPONSE_H
