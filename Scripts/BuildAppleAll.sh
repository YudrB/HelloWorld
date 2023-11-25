scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
projectDir="$(dirname $scriptDir )"
buildDir="$projectDir/Build"
projectName="HelloLib"
srcDir="$projectDir/$projectName"

platformNames=("MAC_ARM64" "MAC" "MAC_CATALYST" "MAC_CATALYST_ARM64" "MAC_UNIVERSAL" \
    "OS64" "SIMULATOR64" "SIMULATORARM64" "OS64COMBINED" \
    "WATCHOS" "SIMULATOR_WATCHOS" "SIMULATORARM64_WATCHOS" "WATCHOSCOMBINED" \
    "TVOS" "SIMULATOR_TVOS" "SIMULATORARM64_TVOS" "TVOSCOMBINED" )
platformPaths=("OSX/ARM64" "OSX/Intel" "OSX/Intel_Catalyst" "OSX/ARM64_Catalyst" "OSX/UNIVERSAL" \
    "iOS/ARM64" "iOS/Intel_Simulator" "iOS/ARM64_Simulator" "iOS/ALL_Simulator" \
    "iWatch/ARM64" "iWatch/Intel_Simulator" "iWatch/ARM64_Simulator" "iWatch/ALL_Simulator" \
    "iTVOS/ARM64" "iTVOS/Intel_Simulator" "iTVOS/ARM64_Simulator" "iTVOS/ALL_Simulator" )
    
configTypes=("Debug" "Release")

position=0
for platform in "${platformNames[@]}"; do

    partialPath="${platformPaths[position]}"
     
    echo "***********"
    echo
    echo  "Building  $platform  : $buildDir/$projectName/$partialPath"
    cmake -B"$buildDir/$projectName/$partialPath" -G Xcode \
          -S"$srcDir" -DCMAKE_TOOLCHAIN_FILE="$projectDir/Toolchains/ios.toolchain.cmake" \
          -DPLATFORM="$platform" 

    for config in ${configTypes[@]}; do
        cmake --build "$buildDir/$projectName/$partialPath" --config $config
    done
    ((position++))
done
