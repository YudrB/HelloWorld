cmake_minimum_required(VERSION 3.22.1)

project("HelloLib")
enable_language(CXX)

if(WIN32)
elseif(APPLE)
        if( (PLATFORM STREQUAL "OS") OR (PLATFORM STREQUAL "SIMULATOR") )
                message(FATAL_ERROR "Can't build for platform $Platform with this project: $PROJECT_NAME")
        endif()
        if(DEFINED DEPLOYMENT_TARGET )
                if( PLATFORM MATCHES "^MAC_CATALYST" AND ${DEPLOYMENT_TARGET} VERSION_LESS "13.1")
                set(DEPLOYMENT_TARGET 13.1)
                endif()
        endif()
elseif(ANDROID)
elseif(UNIX)
        set(LINUX 1) # assuming UNIX and not APPLE means LINUX
endif()

# Includes
include_directories(${PROJECT_SOURCE_DIR})

# The next two lines are here for when I need to debug variables.
#include(CMakePrintHelpers)
#cmake_print_variables(CMAKE_PROJECT_NAME)

# Source files
set(SOURCES
  HelloLib.cpp
  pch.cpp
)

# Headers
set(HEADERS
  HelloLib.h
)

set( CMAKE_POSITION_INDEPENDENT_CODE TRUE)

# Creates and names a library, sets it as either STATIC or SHARED, 
if(WIN32)
        add_library(HelloLib STATIC ${SOURCES} ${HEADERS})

elseif(APPLE)
	enable_language(OBJC)
        set( CMAKE_POSITION_INDEPENDENT_CODE FALSE)

        # Library
        if(BUILD_SHARED)
                add_library (HelloLib SHARED ${SOURCES} ${HEADERS})
                target_link_libraries(HelloLib ${FOUNDATION_LIBRARY})
                target_compile_definitions(HelloLib PUBLIC IS_BUILDING_SHARED)
                message(STATUS "Building shared version...")
        else()
                add_library (HelloLib STATIC ${SOURCES} ${HEADERS})
                target_link_libraries(HelloLib ${FOUNDATION_LIBRARY})
                message(STATUS "Building static version...")

        endif()

        string(FIND "${PLATFORM}" "WATCHOS" isWatchOS )
        if( isWatchOS GREATER -1 )
            set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/Watch)
            install( FILES HelloLib.h DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/Watch/Include)
            install( TARGETS HelloLib ARCHIVE DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/Watch/lib )
            install( TARGETS HelloLib LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/Watch/lib )
        else()
            set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/App)            
            install( FILES HelloLib.h DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/App/Include)
            install( TARGETS HelloLib ARCHIVE DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/App/lib )
            install( TARGETS HelloLib LIBRARY DESTINATION ${PROJECT_SOURCE_DIR}/../HelloWorld/XCode/App/lib )
        endif()
elseif(ANDROID)       
        add_library(${CMAKE_PROJECT_NAME} SHARED HelloLib.cpp)
        target_link_libraries(${CMAKE_PROJECT_NAME} android log)
elseif(LINUX)
        add_library(HelloLib STATIC ${SOURCES} ${HEADERS})
endif()
