// Generated by gencpp from file panda_gazebo/GetEeRpyResponse.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_GETEERPYRESPONSE_H
#define PANDA_GAZEBO_MESSAGE_GETEERPYRESPONSE_H


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
struct GetEeRpyResponse_
{
  typedef GetEeRpyResponse_<ContainerAllocator> Type;

  GetEeRpyResponse_()
    : r(0.0)
    , p(0.0)
    , y(0.0)
    , success(false)
    , message()  {
    }
  GetEeRpyResponse_(const ContainerAllocator& _alloc)
    : r(0.0)
    , p(0.0)
    , y(0.0)
    , success(false)
    , message(_alloc)  {
  (void)_alloc;
    }



   typedef float _r_type;
  _r_type r;

   typedef float _p_type;
  _p_type p;

   typedef float _y_type;
  _y_type y;

   typedef uint8_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetEeRpyResponse_

typedef ::panda_gazebo::GetEeRpyResponse_<std::allocator<void> > GetEeRpyResponse;

typedef boost::shared_ptr< ::panda_gazebo::GetEeRpyResponse > GetEeRpyResponsePtr;
typedef boost::shared_ptr< ::panda_gazebo::GetEeRpyResponse const> GetEeRpyResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator2> & rhs)
{
  return lhs.r == rhs.r &&
    lhs.p == rhs.p &&
    lhs.y == rhs.y &&
    lhs.success == rhs.success &&
    lhs.message == rhs.message;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace panda_gazebo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e0a899a2a3e84e53d60721d73970d6aa";
  }

  static const char* value(const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe0a899a2a3e84e53ULL;
  static const uint64_t static_value2 = 0xd60721d73970d6aaULL;
};

template<class ContainerAllocator>
struct DataType< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "panda_gazebo/GetEeRpyResponse";
  }

  static const char* value(const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 r\n"
"float32 p\n"
"float32 y\n"
"bool success\n"
"string message\n"
"\n"
;
  }

  static const char* value(const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.r);
      stream.next(m.p);
      stream.next(m.y);
      stream.next(m.success);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetEeRpyResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::panda_gazebo::GetEeRpyResponse_<ContainerAllocator>& v)
  {
    s << indent << "r: ";
    Printer<float>::stream(s, indent + "  ", v.r);
    s << indent << "p: ";
    Printer<float>::stream(s, indent + "  ", v.p);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_GETEERPYRESPONSE_H
