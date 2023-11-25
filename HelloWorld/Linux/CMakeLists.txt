cmake_minimum_required(VERSION 3.22.1)

project("HelloWorld")
enable_language(CXX)

add_executable( HelloWorld "main.cpp")

add_library(HelloLib STATIC IMPORTED)
string(FIND "${CMAKE_CURRENT_BINARY_DIR}" "Debug" position)
if(NOT ${position} EQUAL -1)
  set_target_properties(HelloLib PROPERTIES IMPORTED_LOCATION "${PROJECT_SOURCE_DIR}/../../Build/Linux/HelloLib/Debug/libHelloLib.a")
  target_link_libraries(HelloWorld HelloLib)
else()
  set_target_properties(HelloLib PROPERTIES IMPORTED_LOCATION "${PROJECT_SOURCE_DIR}/../../Build/Linux/HelloLib/Release/libHelloLib.a")
  target_link_libraries(HelloWorld HelloLib)
endif()
