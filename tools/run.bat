@echo off
REM Ejecuta un binario compilado con las DLL de Qt en el PATH y ffmpeg accesible.
REM Uso: tools\run.bat build\TweenStudio.exe --self-test
setlocal
set "ROOT=%~dp0.."
if "%QT_MINGW_ROOT%"=="" set "QT_MINGW_ROOT=C:\Qt\Tools\mingw1310_64"
if "%QT_DIR%"=="" set "QT_DIR=C:\Qt\6.8.3\mingw_64"
set "PATH=%QT_MINGW_ROOT%\bin;%QT_DIR%\bin;%ROOT%;%PATH%"
pushd "%ROOT%"
%*
popd
endlocal
