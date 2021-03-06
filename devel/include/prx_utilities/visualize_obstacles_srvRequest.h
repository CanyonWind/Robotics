// Generated by gencpp from file prx_utilities/visualize_obstacles_srvRequest.msg
// DO NOT EDIT!


#ifndef PRX_UTILITIES_MESSAGE_VISUALIZE_OBSTACLES_SRVREQUEST_H
#define PRX_UTILITIES_MESSAGE_VISUALIZE_OBSTACLES_SRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace prx_utilities
{
template <class ContainerAllocator>
struct visualize_obstacles_srvRequest_
{
  typedef visualize_obstacles_srvRequest_<ContainerAllocator> Type;

  visualize_obstacles_srvRequest_()
    : obstacles_path()  {
    }
  visualize_obstacles_srvRequest_(const ContainerAllocator& _alloc)
    : obstacles_path(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _obstacles_path_type;
  _obstacles_path_type obstacles_path;




  typedef boost::shared_ptr< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct visualize_obstacles_srvRequest_

typedef ::prx_utilities::visualize_obstacles_srvRequest_<std::allocator<void> > visualize_obstacles_srvRequest;

typedef boost::shared_ptr< ::prx_utilities::visualize_obstacles_srvRequest > visualize_obstacles_srvRequestPtr;
typedef boost::shared_ptr< ::prx_utilities::visualize_obstacles_srvRequest const> visualize_obstacles_srvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace prx_utilities

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'prx_utilities': ['/home/parallels/Desktop/ROS_workspace/src/prx_utilities/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9981a66aae205a31636ef37b6da7095e";
  }

  static const char* value(const ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9981a66aae205a31ULL;
  static const uint64_t static_value2 = 0x636ef37b6da7095eULL;
};

template<class ContainerAllocator>
struct DataType< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "prx_utilities/visualize_obstacles_srvRequest";
  }

  static const char* value(const ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string obstacles_path\n\
";
  }

  static const char* value(const ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.obstacles_path);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct visualize_obstacles_srvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::prx_utilities::visualize_obstacles_srvRequest_<ContainerAllocator>& v)
  {
    s << indent << "obstacles_path: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.obstacles_path);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PRX_UTILITIES_MESSAGE_VISUALIZE_OBSTACLES_SRVREQUEST_H
