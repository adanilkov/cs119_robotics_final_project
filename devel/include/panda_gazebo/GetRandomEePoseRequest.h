// Generated by gencpp from file panda_gazebo/GetRandomEePoseRequest.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_GETRANDOMEEPOSEREQUEST_H
#define PANDA_GAZEBO_MESSAGE_GETRANDOMEEPOSEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <panda_gazebo/BoundingRegion.h>

namespace panda_gazebo
{
template <class ContainerAllocator>
struct GetRandomEePoseRequest_
{
  typedef GetRandomEePoseRequest_<ContainerAllocator> Type;

  GetRandomEePoseRequest_()
    : bounding_region()
    , attempts(0)  {
    }
  GetRandomEePoseRequest_(const ContainerAllocator& _alloc)
    : bounding_region(_alloc)
    , attempts(0)  {
  (void)_alloc;
    }



   typedef  ::panda_gazebo::BoundingRegion_<ContainerAllocator>  _bounding_region_type;
  _bounding_region_type bounding_region;

   typedef int32_t _attempts_type;
  _attempts_type attempts;





  typedef boost::shared_ptr< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetRandomEePoseRequest_

typedef ::panda_gazebo::GetRandomEePoseRequest_<std::allocator<void> > GetRandomEePoseRequest;

typedef boost::shared_ptr< ::panda_gazebo::GetRandomEePoseRequest > GetRandomEePoseRequestPtr;
typedef boost::shared_ptr< ::panda_gazebo::GetRandomEePoseRequest const> GetRandomEePoseRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator2> & rhs)
{
  return lhs.bounding_region == rhs.bounding_region &&
    lhs.attempts == rhs.attempts;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator1> & lhs, const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace panda_gazebo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e7019f7e493ccd848f6fee8b2f311b10";
  }

  static const char* value(const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe7019f7e493ccd84ULL;
  static const uint64_t static_value2 = 0x8f6fee8b2f311b10ULL;
};

template<class ContainerAllocator>
struct DataType< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "panda_gazebo/GetRandomEePoseRequest";
  }

  static const char* value(const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Service that can be used to get a valid EE pose for the robot.\n"
"BoundingRegion bounding_region\n"
"int32 attempts\n"
"\n"
"================================================================================\n"
"MSG: panda_gazebo/BoundingRegion\n"
"# Message used to define a bounding region by its min/max x,y z values.\n"
"float64 x_min\n"
"float64 x_max\n"
"float64 y_min\n"
"float64 y_max\n"
"float64 z_min\n"
"float64 z_max\n"
;
  }

  static const char* value(const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.bounding_region);
      stream.next(m.attempts);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetRandomEePoseRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::panda_gazebo::GetRandomEePoseRequest_<ContainerAllocator>& v)
  {
    s << indent << "bounding_region: ";
    s << std::endl;
    Printer< ::panda_gazebo::BoundingRegion_<ContainerAllocator> >::stream(s, indent + "  ", v.bounding_region);
    s << indent << "attempts: ";
    Printer<int32_t>::stream(s, indent + "  ", v.attempts);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_GETRANDOMEEPOSEREQUEST_H
