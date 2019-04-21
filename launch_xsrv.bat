@echo off

set dispnum=%1
set windowmode=%2
set PATH=%PATH%;%programfiles%\VcXsrv

start "Xserver" vcxsrv :%dispnum% -ac -terminate -lesspointer -%windowmode% -clipboard -wgl

exit