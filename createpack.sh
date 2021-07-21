#!/bin/bash

cd src/
catkin_create_pkg $1 roscpp rospy std_msgs $2 $3 $4 $5 $6 
cp /home/alg/Documents/create_package_script/create_package/mainsource.cpp $1/src/
echo 'package and main source file created!'
echo 'add_executable(nameofpackage src/nameofpackage.cpp)' >> $1/CMakeLists.txt
echo 'target_link_libraries(nameofpackage ${catkin_LIBRARIES})' >> $1/CMakeLists.txt

sed -i -e 's/nameofpackage/'$1'/g' $1/CMakeLists.txt
sed -i -e 's/nameofpackage/'$1'/g' $1/src/mainsource.cpp

mv $1/src/mainsource.cpp $1/src/$1.cpp








 

