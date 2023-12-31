#pragma once
#include <string>

#if defined(__clang__)
#define SHARED_EXPORT __attribute__((visibility("default")))
#define SHARED_LOCAL __attribute__((visibility("hidden")))
#endif

#if defined(IS_BUILDING_SHARED)
#define API SHARED_EXPORT
#else
#define API
#endif

class  HelloLib
{
public:
	HelloLib();
	~HelloLib();
	std::string getHelloWorldString();
};
