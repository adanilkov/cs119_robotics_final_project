// Generated by gencpp from file panda_gazebo/JointLimits.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_JOINTLIMITS_H
#define PANDA_GAZEBO_MESSAGE_JOINTLIMITS_H


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
struct JointLimits_
{
  typedef JointLimits_<ContainerAllocator> Type;

  JointLimits_()
    : names()
    , values()  {
    }
  JointLimits_(const ContainerAllocator& _alloc)
    : names(_alloc)
    , values(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _names_type;
  _names_type names;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _values_type;
  _values_type values;





  typedef boost::shared_ptr< ::panda_gazebo::JointLimits_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::panda_gazebo::JointLimits_<ContainerAllocator> const> ConstPtr;

}; // struct JointLimits_

typedef ::panda_gazebo::JointLimits_<std::allocator<void> > JointLimits;

typedef boost::shared_ptr< ::panda_gazebo::JointLimits > JointLimitsPtr;
typedef boost::shared_ptr< ::panda_gazebo::JointLimits const> JointLimitsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::panda_gazebo::JointLimits_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::panda_gazebo::JointLimits_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::panda_gazebo::JointLimits_<ContainerAllocator1> & lhs, const ::panda_gazebo::JointLimits_<ContainerAllocator2> & rhs)
{
  return lhs.names == rhs.names &&
    lhs.values == rhs.values;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::panda_gazebo::JointLimits_<ContainerAllocator1> & lhs, const ::panda_gazebo::JointLimits_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace panda_gazebo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::JointLimits_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::panda_gazebo::JointLimits_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::JointLimits_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::panda_gazebo::JointLimits_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::JointLimits_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::panda_gazebo::JointLimits_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::panda_gazebo::JointLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d75ca66ca305927d9452c8ab1c55e95e";
  }

  static const char* value(const ::panda_gazebo::JointLimits_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd75ca66ca305927dULL;
  static const uint64_t static_value2 = 0x9452c8ab1c55e95eULL;
};

template<class ContainerAllocator>
struct DataType< ::panda_gazebo::JointLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "panda_gazebo/JointLimits";
  }

  static const char* value(const ::panda_gazebo::JointLimits_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::panda_gazebo::JointLimits_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message used to define joint limits\n"
"string[] names\n"
"float64[] values\n"
;
  }

  static const char* value(const ::panda_gazebo::JointLimits_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::panda_gazebo::JointLimits_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.names);
      stream.next(m.values);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct JointLimits_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::panda_gazebo::JointLimits_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::panda_gazebo::JointLimits_<ContainerAllocator>& v)
  {
    s << indent << "names[]" << std::endl;
    for (size_t i = 0; i < v.names.size(); ++i)
    {
      s << indent << "  names[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.names[i]);
    }
    s << indent << "values[]" << std::endl;
    for (size_t i = 0; i < v.values.size(); ++i)
    {
      s << indent << "  values[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.values[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_JOINTLIMITS_H
