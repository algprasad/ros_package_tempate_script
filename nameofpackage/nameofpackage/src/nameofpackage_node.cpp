#include <ros/ros.h>
#include "nameofpackage/RosHandle.hpp"

int main(int argc, char** argv)
{
  ros::init(argc, argv, "nameofpackage");
  ros::NodeHandle node_handle("~");


  nameofpackage::RosHandle ros_handle(node_handle); 

  while(ros::ok()){
      
      ros::spinOnce();
  }

  return 0;
}
