// Generated by gencpp from file panda_gazebo/LockJointsResponse.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_LOCKJOINTSRESPONSE_H
#define PANDA_GAZEBO_MESSAGE_LOCKJOINTSRESPONSE_H


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
struct LockJointsResponse_
{
  typedef LockJointsResponse_<ContainerAllocator> Type;

  LockJointsResponse_()
    : success(false)
    , message()  {
    }
  LockJointsResponse_(const ContainerAllocator& _alloc)
    : success(false)
    , message(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> const> ConstPtr;

}; // struct LockJointsResponse_

typedef ::panda_gazebo::LockJointsResponse_<std::allocator<void> > LockJointsResponse;

typedef boost::shared_ptr< ::panda_gazebo::LockJointsResponse > LockJointsResponsePtr;
typedef boost::shared_ptr< ::panda_gazebo::LockJointsResponse const> LockJointsResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::panda_gazebo::LockJointsResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::panda_gazebo::LockJointsResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::LockJointsResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success &&
    lhs.message == rhs.message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::panda_gazebo::LockJointsResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::LockJointsResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace panda_gazebo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "937c9679a518e3a18d831e57125ea522";
  }

  static const char* value(const ::panda_gazebo::LockJointsResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x937c9679a518e3a1ULL;
  static const uint64_t static_value2 = 0x8d831e57125ea522ULL;
};

template<class ContainerAllocator>
struct DataType< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "panda_gazebo/LockJointsResponse";
  }

  static const char* value(const ::panda_gazebo::LockJointsResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"string message\n"
"\n"
;
  }

  static const char* value(const ::panda_gazebo::LockJointsResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LockJointsResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::panda_gazebo::LockJointsResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::panda_gazebo::LockJointsResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_LOCKJOINTSRESPONSE_H
