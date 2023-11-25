scriptDir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

projectDir="$(dirname $scriptDir )"
buildDir="$projectDir/Build"
    
config="Debug"
cmake -B"$buildDir/Linux/HelloLib/$config" -S"$projectDir/HelloLib"  
cmake --build "$buildDir/Linux/HelloLib/$config" --config $config

cmake -B"$buildDir/Linux/HelloWorld/$config" -S"$projectDir/HelloWorld/Linux"  
cmake --build "$buildDir/Linux/HelloWorld/$config" --config $config

chmod +x $buildDir/Linux/HelloWorld/$config/HelloWorld
$buildDir/Linux/HelloWorld/$config/HelloWorld