cmake_minimum_required(VERSION 3.5)
project(nameofpackage)

## Use C++14
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

## By adding -Wall and -Werror, the compiler does not ignore warnings anymore,
## enforcing cleaner code.

#add_definitions(-Wall -Werror)
# Using Eigen from the GTSAM library to avoid headaches


## Find catkin macros and libraries
##
find_package(catkin REQUIRED
  COMPONENTS
    roscpp
    sensor_msgs
    roslint
)
#find_package(Eigen REQUIRED)
find_package(OpenCV REQUIRED)
find_package(Boost REQUIRED)
find_package(yaml-cpp REQUIRED)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  INCLUDE_DIRS
    include
    LIBRARIES
    #${PROJECT_NAME}_core
    CATKIN_DEPENDS
    roscpp
    sensor_msgs
  DEPENDS
  ## find_package(Eigen3) provides a non standard EIGEN3_INCLUDE_DIR instead of Eigen3_INCLUDE_DIRS.
  ## Therefore, the DEPEND does not work as expected and we need to add the directory to the INCLUDE_DIRS
  # Eigen3

  ## Boost is not part of the DEPENDS since it is only used in source files,
  ## Dependees do not depend on Boost when they depend on this package.
)

###########
## Build ##
###########
# Set all auxillary header files here
set(AUX_SRC_FILES include/nameofpackage/RosData.h
               )


## Specify additional locations of header files
## Your package locations should be listed before other locations


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  # Set manually because Eigen sets a non standard INCLUDE DIR
        #${GTSAM_EIGEN_INCLUDE_DIRS}
  # Set because Boost is an internal dependency, not transitive.
  ${Boost_INCLUDE_DIRS} #${GTSAM_INCLUDE_DIR}
)

#link_directories("${CMAKE_CURRENT_SOURCE_DIR}/../ThirdParty/aruco3.1.6/build/src")
## Declare a cpp library #TODO: Maybe remove the AUX_SRC_FILES from here
#add_library(${PROJECT_NAME}_core
#    ${AUX_SRC_FILES}
#)
#target_compile_features(${PROJECT_NAME}_core INTERFACE cxx_std_14)

## Declare cpp executables
add_executable(${PROJECT_NAME}
  src/${PROJECT_NAME}_node.cpp
        src/RosHandle.cpp
)
#target_compile_features(${PROJECT_NAME} INTERFACE cxx_std_14)

## Add dependencies to exported targets, like ROS msgs or srvs
#add_dependencies(${PROJECT_NAME}_core
#  ${catkin_EXPORTED_TARGETS}
#)

add_dependencies(${PROJECT_NAME}
  ${catkin_EXPORTED_TARGETS}
)

## Specify libraries to link executable targets against
#target_link_libraries(${PROJECT_NAME}_core
#  ${catkin_LIBRARIES} ${OpenCV_LIBS}
#        yaml-cpp 
        # gtsam aruco
#)

target_link_libraries(${PROJECT_NAME}
#  ${PROJECT_NAME}_core
  ${catkin_LIBRARIES} ${OpenCV_LIBS}
        yaml-cpp 
	#aruco gtsam
)

#############
## Install ##
#############

# Mark executables and/or libraries for installation
#install(
#  TARGETS ${PROJECT_NAME} ${PROJECT_NAME}_core
#  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
#)

# Mark cpp header files for installation
install(
  DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
  FILES_MATCHING PATTERN "*.hpp"
)

# Mark other files for installation
install(
  DIRECTORY doc
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

#############
## Testing ##
#############

if(${CATKIN_ENABLE_TESTING})
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
## Add gtest based cpp test target and link libraries
catkin_add_gtest(${PROJECT_NAME}-test
        test/test_nameofpackage.cpp
	)

#target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME}_core)
endif()

##########################
## Static code analysis ##
##########################

roslint_cpp()
