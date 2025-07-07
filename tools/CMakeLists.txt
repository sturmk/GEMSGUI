#include_directories(${CMAKE_SOURCE_DIR})
#find_package(Threads REQUIRED)

# Building convertor data/*.ini to json format
message(STATUS "Building convertor data/*.ini to json format")
add_executable(data-json-generator config.h config.cpp ini2json.cpp)
target_link_libraries(data-json-generator GEMS3K::GEMS3K)

