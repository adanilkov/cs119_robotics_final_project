// Generated by gencpp from file brl_pxh_api/CartTrajResult.msg
// DO NOT EDIT!


#ifndef BRL_PXH_API_MESSAGE_CARTTRAJRESULT_H
#define BRL_PXH_API_MESSAGE_CARTTRAJRESULT_H


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
struct CartTrajResult_
{
  typedef CartTrajResult_<ContainerAllocator> Type;

  CartTrajResult_()
    : log()
    , success(false)  {
    }
  CartTrajResult_(const ContainerAllocator& _alloc)
    : log(_alloc)
    , success(false)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _log_type;
  _log_type log;

   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> const> ConstPtr;

}; // struct CartTrajResult_

typedef ::brl_pxh_api::CartTrajResult_<std::allocator<void> > CartTrajResult;

typedef boost::shared_ptr< ::brl_pxh_api::CartTrajResult > CartTrajResultPtr;
typedef boost::shared_ptr< ::brl_pxh_api::CartTrajResult const> CartTrajResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::brl_pxh_api::CartTrajResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::brl_pxh_api::CartTrajResult_<ContainerAllocator1> & lhs, const ::brl_pxh_api::CartTrajResult_<ContainerAllocator2> & rhs)
{
  return lhs.log == rhs.log &&
    lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::brl_pxh_api::CartTrajResult_<ContainerAllocator1> & lhs, const ::brl_pxh_api::CartTrajResult_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace brl_pxh_api

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d80d1d6f73b67aee28bf93977c589629";
  }

  static const char* value(const ::brl_pxh_api::CartTrajResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd80d1d6f73b67aeeULL;
  static const uint64_t static_value2 = 0x28bf93977c589629ULL;
};

template<class ContainerAllocator>
struct DataType< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "brl_pxh_api/CartTrajResult";
  }

  static const char* value(const ::brl_pxh_api::CartTrajResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Result\n"
"string log\n"
"bool success\n"
;
  }

  static const char* value(const ::brl_pxh_api::CartTrajResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.log);
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CartTrajResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::brl_pxh_api::CartTrajResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::brl_pxh_api::CartTrajResult_<ContainerAllocator>& v)
  {
    s << indent << "log: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.log);
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BRL_PXH_API_MESSAGE_CARTTRAJRESULT_H
