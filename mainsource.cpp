#include <iostream>
#include "ros/ros.h"

int main(int argc, char **argv){
	ros::init(argc, argv, "nameofpackage");
	ros::NodeHandle nh;

	// Publisher and Subsriber stuff
	// ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);
	
	// ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);
	
	return 0;


}
