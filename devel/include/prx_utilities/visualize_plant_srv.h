// Generated by gencpp from file prx_utilities/visualize_plant_srv.msg
// DO NOT EDIT!


#ifndef PRX_UTILITIES_MESSAGE_VISUALIZE_PLANT_SRV_H
#define PRX_UTILITIES_MESSAGE_VISUALIZE_PLANT_SRV_H

#include <ros/service_traits.h>


#include <prx_utilities/visualize_plant_srvRequest.h>
#include <prx_utilities/visualize_plant_srvResponse.h>


namespace prx_utilities
{

struct visualize_plant_srv
{

typedef visualize_plant_srvRequest Request;
typedef visualize_plant_srvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct visualize_plant_srv
} // namespace prx_utilities


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::prx_utilities::visualize_plant_srv > {
  static const char* value()
  {
    return "32452e89350b0fbc1c1de51eda1e9deb";
  }

  static const char* value(const ::prx_utilities::visualize_plant_srv&) { return value(); }
};

template<>
struct DataType< ::prx_utilities::visualize_plant_srv > {
  static const char* value()
  {
    return "prx_utilities/visualize_plant_srv";
  }

  static const char* value(const ::prx_utilities::visualize_plant_srv&) { return value(); }
};


// service_traits::MD5Sum< ::prx_utilities::visualize_plant_srvRequest> should match 
// service_traits::MD5Sum< ::prx_utilities::visualize_plant_srv > 
template<>
struct MD5Sum< ::prx_utilities::visualize_plant_srvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::visualize_plant_srv >::value();
  }
  static const char* value(const ::prx_utilities::visualize_plant_srvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::visualize_plant_srvRequest> should match 
// service_traits::DataType< ::prx_utilities::visualize_plant_srv > 
template<>
struct DataType< ::prx_utilities::visualize_plant_srvRequest>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::visualize_plant_srv >::value();
  }
  static const char* value(const ::prx_utilities::visualize_plant_srvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::prx_utilities::visualize_plant_srvResponse> should match 
// service_traits::MD5Sum< ::prx_utilities::visualize_plant_srv > 
template<>
struct MD5Sum< ::prx_utilities::visualize_plant_srvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::visualize_plant_srv >::value();
  }
  static const char* value(const ::prx_utilities::visualize_plant_srvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::visualize_plant_srvResponse> should match 
// service_traits::DataType< ::prx_utilities::visualize_plant_srv > 
template<>
struct DataType< ::prx_utilities::visualize_plant_srvResponse>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::visualize_plant_srv >::value();
  }
  static const char* value(const ::prx_utilities::visualize_plant_srvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PRX_UTILITIES_MESSAGE_VISUALIZE_PLANT_SRV_H
