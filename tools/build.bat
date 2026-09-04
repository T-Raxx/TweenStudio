@echo off
REM Compila TweenStudio con la toolchain MinGW de Qt.
REM Uso: tools\build.bat [directorio-de-build]     (por defecto: build)
setlocal
set "ROOT=%~dp0.."
if "%QT_MINGW_ROOT%"=="" set "QT_MINGW_ROOT=C:\Qt\Tools\mingw1310_64"
if "%QT_DIR%"=="" set "QT_DIR=C:\Qt\6.8.3\mingw_64"
set "PATH=%QT_MINGW_ROOT%\bin;%QT_DIR%\bin;%PATH%"

set "BUILDDIR=%~1"
if "%BUILDDIR%"=="" set "BUILDDIR=build"

pushd "%ROOT%"
if not exist "%BUILDDIR%\CMakeCache.txt" (
  cmake -S . -B "%BUILDDIR%" -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release ^
        -DCMAKE_PREFIX_PATH="%QT_DIR%" -DCMAKE_MAKE_PROGRAM="%QT_MINGW_ROOT%\bin\mingw32-make.exe" || (popd & exit /b 1)
)
cmake --build "%BUILDDIR%" -j 8 || (popd & exit /b 1)
popd
endlocal
