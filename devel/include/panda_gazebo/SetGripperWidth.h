// Generated by gencpp from file panda_gazebo/SetGripperWidth.msg
// DO NOT EDIT!


#ifndef PANDA_GAZEBO_MESSAGE_SETGRIPPERWIDTH_H
#define PANDA_GAZEBO_MESSAGE_SETGRIPPERWIDTH_H

#include <ros/service_traits.h>


#include <panda_gazebo/SetGripperWidthRequest.h>
#include <panda_gazebo/SetGripperWidthResponse.h>


namespace panda_gazebo
{

struct SetGripperWidth
{

typedef SetGripperWidthRequest Request;
typedef SetGripperWidthResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetGripperWidth
} // namespace panda_gazebo


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::panda_gazebo::SetGripperWidth > {
  static const char* value()
  {
    return "f1391f700eac44a55b7a2011ef94058b";
  }

  static const char* value(const ::panda_gazebo::SetGripperWidth&) { return value(); }
};

template<>
struct DataType< ::panda_gazebo::SetGripperWidth > {
  static const char* value()
  {
    return "panda_gazebo/SetGripperWidth";
  }

  static const char* value(const ::panda_gazebo::SetGripperWidth&) { return value(); }
};


// service_traits::MD5Sum< ::panda_gazebo::SetGripperWidthRequest> should match
// service_traits::MD5Sum< ::panda_gazebo::SetGripperWidth >
template<>
struct MD5Sum< ::panda_gazebo::SetGripperWidthRequest>
{
  static const char* value()
  {
    return MD5Sum< ::panda_gazebo::SetGripperWidth >::value();
  }
  static const char* value(const ::panda_gazebo::SetGripperWidthRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::panda_gazebo::SetGripperWidthRequest> should match
// service_traits::DataType< ::panda_gazebo::SetGripperWidth >
template<>
struct DataType< ::panda_gazebo::SetGripperWidthRequest>
{
  static const char* value()
  {
    return DataType< ::panda_gazebo::SetGripperWidth >::value();
  }
  static const char* value(const ::panda_gazebo::SetGripperWidthRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::panda_gazebo::SetGripperWidthResponse> should match
// service_traits::MD5Sum< ::panda_gazebo::SetGripperWidth >
template<>
struct MD5Sum< ::panda_gazebo::SetGripperWidthResponse>
{
  static const char* value()
  {
    return MD5Sum< ::panda_gazebo::SetGripperWidth >::value();
  }
  static const char* value(const ::panda_gazebo::SetGripperWidthResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::panda_gazebo::SetGripperWidthResponse> should match
// service_traits::DataType< ::panda_gazebo::SetGripperWidth >
template<>
struct DataType< ::panda_gazebo::SetGripperWidthResponse>
{
  static const char* value()
  {
    return DataType< ::panda_gazebo::SetGripperWidth >::value();
  }
  static const char* value(const ::panda_gazebo::SetGripperWidthResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PANDA_GAZEBO_MESSAGE_SETGRIPPERWIDTH_H
