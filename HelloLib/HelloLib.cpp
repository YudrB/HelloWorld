// HelloLib.cpp : Defines the functions for the static library.
//

#include "pch.h"
#include <stdio.h>
#include <string>
#include <memory>

// Platform specific macros
#define PLUS_SIMULATOR ""
#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
	#define PLATFORM_NAME "Windows" // Windows
	#ifdef _WIN64
	   //define something for Windows (64-bit only)
	#else
	   //define something for Windows (32-bit only)
    #endif
#elif __APPLE__
    #include <TargetConditionals.h>
    #if TARGET_OS_SIMULATOR
        #undef  PLUS_SIMULATOR
        #define PLUS_SIMULATOR " Simulator" // iOS, tvOS, or watchOS Simulator
    #endif

    #if TARGET_OS_MACCATALYST
        #define PLATFORM_NAME "Mac Catalyst"// Mac's Catalyst (ports iOS API into Mac, like UIKit).
    #elif TARGET_OS_TV
        #define PLATFORM_NAME "Apple TV"
    #elif TARGET_OS_WATCH
        #define PLATFORM_NAME "Apple Watch"
    #elif TARGET_OS_IOS
        #define PLATFORM_NAME "iOS" // iphone or ipad
    #elif TARGET_OS_MAC
        #ifdef TARGET_CPU_ARM
            #define PLATFORM_NAME "OSX on Apple Silicon" // Other kinds of Apple platforms
        #else
            #define PLATFORM_NAME "OSX on Intel" // Other kinds of Apple platforms
        #endif
    #else
        error "Unknown Apple platform"
    #endif
#elif __ANDROID__ 
    // Below __linux__ check should be enough to handle Android, but something may be unique to Android.
    #define PLATFORM_NAME "Android" // Android (implies Linux, so it must come first)
#elif __linux__
    #define PLATFORM_NAME "Linux" // Debian, Ubuntu, Gentoo, Fedora, openSUSE, RedHat, Centos and other
#elif defined(_POSIX_VERSION)
    #define PLATFORM_NAME "POSIX" // POSIX
#elif defined(__unix__) // All other Unix variants not caught above added for fun :-)
    #include <sys/param.h>
    #if defined(BSD)
        #define PLATFORM_NAME "BSD" // FreeBSD, NetBSD, OpenBSD, DragonFly BSD
    #elif defined(__hpux)
        #define PLATFORM_NAME "HP-UX" // HP-UX
    #elif defined(_AIX)
        #define PLATFORM_NAME "AIX" // IBM AIX
    #elif defined(__sun) && defined(__SVR4)
        #define PLATFORM_NAME "solaris" // Oracle Solaris
    #endif
#else
    error "Unknown compiler/platform"
#endif

#include "HelloLib.h"

HelloLib::HelloLib()
{
}

HelloLib::~HelloLib()
{
}

std::string HelloLib::getHelloWorldString()
{
    std::string hello = "Hello World from "
        + std::string(PLATFORM_NAME)
        + std::string(PLUS_SIMULATOR);

    return hello;
}

#ifdef __ANDROID__
    #include <jni.h>

    extern "C" JNIEXPORT jstring JNICALL
    Java_com_logicmedia_helloworld_MainActivity_stringFromJNI(
            JNIEnv* env,
            jobject /* this */) 
    {
        std::unique_ptr<HelloLib> helloLib = std::make_unique<HelloLib>();
        return env->NewStringUTF(helloLib->getHelloWorldString().c_str());
    }
#endif