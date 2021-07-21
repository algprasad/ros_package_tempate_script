#!/bin/bash

cd src/

#copy the main folder
cp -r /home/alg/Documents/create_package_script/create_package/nameofpackage .  

# rename files and folders
mv nameofpackage $1
mv $1/nameofpackage $1/$1
mv $1/$1/include/nameofpackage $1/$1/include/$1
mv $1/$1/launch/nameofpackage_basic.launch $1/$1/launch/$1_basic.launch
mv $1/$1/launch/nameofpackage_overlying_params.launch $1/$1/launch/$1_overlying_params.launch
mv $1/$1/src/nameofpackage_node.cpp  $1/$1/src/$1_node.cpp
mv $1/$1/test/test_nameofpackage.cpp $1/$1/test/test_$1.cpp
 
# rename nameofpackage inside files
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/CMakeLists.txt
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/src/RosHandle.cpp
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/src/$1_node.cpp
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/package.xml
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/include/$1/RosHandle.hpp
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/include/$1/RosData.h
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/launch/$1_basic.launch
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/launch/$1_overlying_params.launch
sed -i -e 's/nameofpackage/'$1'/g' $1/$1/README.md


# remove filler files
rm $1/$1/doc/fillerfile
rm $1/$1/rviz/fillerfile
rm $1/ThirdParty/fillerfile


