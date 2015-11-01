// Generated by gencpp from file prx_utilities/take_screenshot_srv.msg
// DO NOT EDIT!


#ifndef PRX_UTILITIES_MESSAGE_TAKE_SCREENSHOT_SRV_H
#define PRX_UTILITIES_MESSAGE_TAKE_SCREENSHOT_SRV_H

#include <ros/service_traits.h>


#include <prx_utilities/take_screenshot_srvRequest.h>
#include <prx_utilities/take_screenshot_srvResponse.h>


namespace prx_utilities
{

struct take_screenshot_srv
{

typedef take_screenshot_srvRequest Request;
typedef take_screenshot_srvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct take_screenshot_srv
} // namespace prx_utilities


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::prx_utilities::take_screenshot_srv > {
  static const char* value()
  {
    return "7549dad931fa848fc767a55b74b0961b";
  }

  static const char* value(const ::prx_utilities::take_screenshot_srv&) { return value(); }
};

template<>
struct DataType< ::prx_utilities::take_screenshot_srv > {
  static const char* value()
  {
    return "prx_utilities/take_screenshot_srv";
  }

  static const char* value(const ::prx_utilities::take_screenshot_srv&) { return value(); }
};


// service_traits::MD5Sum< ::prx_utilities::take_screenshot_srvRequest> should match 
// service_traits::MD5Sum< ::prx_utilities::take_screenshot_srv > 
template<>
struct MD5Sum< ::prx_utilities::take_screenshot_srvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::take_screenshot_srv >::value();
  }
  static const char* value(const ::prx_utilities::take_screenshot_srvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::take_screenshot_srvRequest> should match 
// service_traits::DataType< ::prx_utilities::take_screenshot_srv > 
template<>
struct DataType< ::prx_utilities::take_screenshot_srvRequest>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::take_screenshot_srv >::value();
  }
  static const char* value(const ::prx_utilities::take_screenshot_srvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::prx_utilities::take_screenshot_srvResponse> should match 
// service_traits::MD5Sum< ::prx_utilities::take_screenshot_srv > 
template<>
struct MD5Sum< ::prx_utilities::take_screenshot_srvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::take_screenshot_srv >::value();
  }
  static const char* value(const ::prx_utilities::take_screenshot_srvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::take_screenshot_srvResponse> should match 
// service_traits::DataType< ::prx_utilities::take_screenshot_srv > 
template<>
struct DataType< ::prx_utilities::take_screenshot_srvResponse>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::take_screenshot_srv >::value();
  }
  static const char* value(const ::prx_utilities::take_screenshot_srvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PRX_UTILITIES_MESSAGE_TAKE_SCREENSHOT_SRV_H