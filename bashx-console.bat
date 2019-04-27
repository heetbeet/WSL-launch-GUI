@echo off

REM Add unescapable quatations around args: \"blabla\"
SETLOCAL EnableDelayedExpansion
	set args=empty
	set args=%args:empty=%
	for %%x in (%*) do set "args=!args!\"%%~x\" "
SETLOCAL DisableDelayedExpansion

REM Default parameters
set windowmode=multiwindow
set dispnum=0
set disp=localhost:%dispnum%.0
set bash=%systemroot%\system32\bash.exe

REM Setup vcmsrv parameters; to escape \ make sure \ is wrapped as \\\\
set path=%path%;%programfiles%\VcXsrv
set vcxsrv_exc=start vcxsrv :%dispnum% -ac -terminate -lesspointer -%windowmode% -clipboard -wgl
set vcxsrv_exc=%vcxsrv_exc:\=\\\\%

REM from linux/bash 
REM   1. setup display output,
REM   2. call from within linux to the windows vcxsrv exe to open an instance, and
REM   3. call the program in linux to open as a GUI
%bash% -c "export DISPLAY=%disp% && if ! xdpyinfo -display %disp% > /dev/null 2>&1; then /mnt/c/Windows/System32/cmd.exe /C %vcxsrv_exc%; fi; %args%"