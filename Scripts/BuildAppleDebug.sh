scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

projectDir="$(dirname $scriptDir )"
buildDir="$projectDir/Build"
projectName="HelloLib"
srcDir="$projectDir/$projectName"

platform="MAC_ARM64"
if [ -n "$1" ]; then
        platform="$1"
fi

platformNames=("MAC_ARM64" "MAC" "MAC_CATALYST" "MAC_CATALYST_ARM64" "MAC_UNIVERSAL" \
    "OS64" "SIMULATOR64" "SIMULATORARM64" "OS64COMBINED" \
    "WATCHOS" "SIMULATOR_WATCHOS" "SIMULATORARM64_WATCHOS" "WATCHOSCOMBINED" \
    "TVOS" "SIMULATOR_TVOS" "SIMULATORARM64_TVOS" "TVOSCOMBINED" )
platformPaths=("OSX/ARM64" "OSX/Intel" "OSX/Intel_Catalyst" "OSX/ARM64_Catalyst" "OSX/UNIVERSAL" \
    "iOS/ARM64" "iOS/Intel_Simulator" "iOS/ARM64_Simulator" "iOS/ALL_Simulator" \
    "iWatch/ARM64" "iWatch/Intel_Simulator" "iWatch/ARM64_Simulator" "iWatch/ALL_Simulator" \
    "iTVOS/ARM64" "iTVOS/Intel_Simulator" "iTVOS/ARM64_Simulator" "iTVOS/ALL_Simulator" )

partialPath=""
for ((i=0; i<${#platformNames[@]}; i++)); do
    if [ "${platformNames[i]}" = "$platform" ]; then
        partialPath=${platformPaths[i]}
        break
    fi
done

# Check the position variable to determine the result
if [ -n "$partialPath" ]; then
    
    config="Debug"
    echo  "Building  $platform  : $buildDir/$projectName/$partialPath/$config"

    cmake -B"$buildDir/$projectName/$partialPath" -G Xcode \
          -S"$srcDir" -DCMAKE_TOOLCHAIN_FILE="$projectDir/Toolchains/ios.toolchain.cmake" \
          -DPLATFORM="$platform"
    cmake --build "$buildDir/$projectName/$partialPath" --config $config
    cmake --install "$buildDir/$projectName/$partialPath" --config $config

else
    echo "Unknown Platform: $platform"
fi

