This script file will perform the steps necessary to build a ros package. 

Go to the catkin workspace and run this script there. (You dont have to put the script there, just call it from inside the workspace)

On running the script, the source file will be created and the corresponding CMakeLists.txt will be updated with the name of the source file in the add_executable() function. 

Sample run: 

cd ~/catkin_ws

sh /PATH_TO/create_ros_package.sh name_of_package
