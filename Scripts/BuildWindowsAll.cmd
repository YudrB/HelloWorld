set scriptDir=%~dp0

set projectDir=%scriptDir%..
set buildDir=%projectDir%\Build\Windows
set projectName=HelloLib
set srcDir=%projectDir%\%projectName%

cmake -G "Visual Studio 17 2022" -B"%buildDir%\%projectName%\x64" -S"%srcDir%" -A x64
cmake --build "%buildDir%\%projectName%\x64" --config Debug
cmake --build "%buildDir%\%projectName%\x64" --config Release

cmake -G "Visual Studio 17 2022" -B"%buildDir%\%projectName%\Win32" -S"%srcDir%" -A Win32
cmake --build "%buildDir%\%projectName%\Win32" --config Debug
cmake --build "%buildDir%\%projectName%\Win32" --config Release
