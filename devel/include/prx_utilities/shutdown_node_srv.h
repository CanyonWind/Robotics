// Generated by gencpp from file prx_utilities/shutdown_node_srv.msg
// DO NOT EDIT!


#ifndef PRX_UTILITIES_MESSAGE_SHUTDOWN_NODE_SRV_H
#define PRX_UTILITIES_MESSAGE_SHUTDOWN_NODE_SRV_H

#include <ros/service_traits.h>


#include <prx_utilities/shutdown_node_srvRequest.h>
#include <prx_utilities/shutdown_node_srvResponse.h>


namespace prx_utilities
{

struct shutdown_node_srv
{

typedef shutdown_node_srvRequest Request;
typedef shutdown_node_srvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct shutdown_node_srv
} // namespace prx_utilities


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::prx_utilities::shutdown_node_srv > {
  static const char* value()
  {
    return "6b261e5b15df599b49cbecb3c73fa812";
  }

  static const char* value(const ::prx_utilities::shutdown_node_srv&) { return value(); }
};

template<>
struct DataType< ::prx_utilities::shutdown_node_srv > {
  static const char* value()
  {
    return "prx_utilities/shutdown_node_srv";
  }

  static const char* value(const ::prx_utilities::shutdown_node_srv&) { return value(); }
};


// service_traits::MD5Sum< ::prx_utilities::shutdown_node_srvRequest> should match 
// service_traits::MD5Sum< ::prx_utilities::shutdown_node_srv > 
template<>
struct MD5Sum< ::prx_utilities::shutdown_node_srvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::shutdown_node_srv >::value();
  }
  static const char* value(const ::prx_utilities::shutdown_node_srvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::shutdown_node_srvRequest> should match 
// service_traits::DataType< ::prx_utilities::shutdown_node_srv > 
template<>
struct DataType< ::prx_utilities::shutdown_node_srvRequest>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::shutdown_node_srv >::value();
  }
  static const char* value(const ::prx_utilities::shutdown_node_srvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::prx_utilities::shutdown_node_srvResponse> should match 
// service_traits::MD5Sum< ::prx_utilities::shutdown_node_srv > 
template<>
struct MD5Sum< ::prx_utilities::shutdown_node_srvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::prx_utilities::shutdown_node_srv >::value();
  }
  static const char* value(const ::prx_utilities::shutdown_node_srvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::prx_utilities::shutdown_node_srvResponse> should match 
// service_traits::DataType< ::prx_utilities::shutdown_node_srv > 
template<>
struct DataType< ::prx_utilities::shutdown_node_srvResponse>
{
  static const char* value()
  {
    return DataType< ::prx_utilities::shutdown_node_srv >::value();
  }
  static const char* value(const ::prx_utilities::shutdown_node_srvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PRX_UTILITIES_MESSAGE_SHUTDOWN_NODE_SRV_H
