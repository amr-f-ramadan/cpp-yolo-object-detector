cmake_minimum_required(VERSION 3.11.3)

set(CMAKE_CXX_STANDARD 17)
project(objectdetector)
set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

find_package(OpenCV 4.1 REQUIRED)

include_directories(include)
include_directories(${OpenCV_INCLUDE_DIRS})
link_directories(${OpenCV_LIBRARY_DIRS})
add_definitions(${OpenCV_DEFINITIONS})

# Find all executables
file(GLOB SOURCES "src/*.cpp") #src/*.h

add_executable(objectdetector ${SOURCES})
target_link_libraries(objectdetector ${OpenCV_LIBS} )
