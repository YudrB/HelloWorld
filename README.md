# HelloWorld
Cross Platform C++ Hello World example with minimal dependencies. 
Works on iOS (Phone, watch, TV, etc), Android, Windows, OSX, Linux. 
Shared C++ code is in HelloLib.cpp.
And each platform has it's own application that calls the shared library.

# Required to build
To build this example you will need the following tools:

* CMake - on all platforms
* [Ninja](https://github.com/ninja-build/ninja) - For building on Mac 
* Visual Studio - to build for Windows
* XCode - to build for Mac
* Android Studio to build for Android

# Building
## On Windows

* From the commnad line run Scripts/BuildWindowsAll.cmd to create all flavors of HelloLib.lib
* Open the HelloWorld.sln with Visual Studio.
* Select the startup project and build/run

## On Mac
* From the commnad line run Scripts/BuildAppleAll.sh to create all flavors of libHelloLib.a
* From the command line run the corresponding cmake install for the app you want to build.
    * Some examples: 
        * Targetting Mac OSX running on apple silicon
            cmake --install "./Build/HelloLib/OSX/ARM64" --config Debug
        * Targetting Mac OSX running on Intel Mac
            cmake --install "./Build/HelloLib/OSX/Intel" --config Debug
        * Targetting iPhone Simulator on Apple silicon
            cmake --install "./Build/HelloLib/iOS/ARM64_Simulator" --config Debug
        * etc.
    
    * ./Scripts/BuildAppleDebug.sh can also be used to build and install a specific flavor
        * MAC - for intel based Mac's
        * MAC_ARM64 - for OSX running on Apple silicon
        * OS64 - for iPhone
        * SIMULATOR64 - for iPhone simulator running on Intel Mac
        * SIMULATORARM64 - for iPhone simulator running on Apple silicon
        * TVOS - for apple TV device
        * SIMULATOR_TVOS - for TV simulator running on Intel Mac
        * SIMULATORARM64_TVOS - for TV simulator running on Apple silicon
        * WATCHOS - for apple watch device
        * SIMULATOR_WATCHOS - for apple watch simulator running on Intel Mac
        * SIMULATORARM64_WATCHOS - for apple watch simulator running on Apple silicon
* Open the HelloWorld.xcodeproj with XCode and select a target config for the app.
    * HelloWorld/XCode/App for Mac, Phone, TV 
    * HelloWorld/XCode/Watch for Watch. The apple Watch requires a different app project.
* Remember to run the correct cmake --install before building 

## On Android
* Use Android studio to open, build and run the project HelloWorld/AndroidStudio

## on Linux
* From the command line run BuildLinuxAll.sh to create release and debug versions of HelloWorld
