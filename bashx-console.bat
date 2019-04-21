@echo off

Setlocal enabledelayedexpansion

set args=empty
set args=%args:empty=%

for %%x in (%*) do set "args=!args!\"%%~x\" "

REM echo Number of processed arguments: %args%

set windowmode=multiwindow

set pause=false

set dispnum=0
set disp=localhost:%dispnum%.0

set bash="%systemroot%\system32\bash.exe"
set cmdbin=%systemroot%\system32\cmd.exe
call :tounixpath cmdbin

set xsrv_run=%cd%\launch_xsrv.bat
set xsrv_run=\"%xsrv_run:\=\\\\%\"
set xsrv_run=%xsrv_run% %dispnum% %windowmode%

REM ******************************************************
REM The linux/windows back-and-forth x-server opening
REM ******************************************************
%bash% -c "export DISPLAY=%disp% && if ! xdpyinfo -display %disp% > /dev/null 2>&1; then \"%cmdbin%\" /C %xsrv_run%; fi; %args%"

IF %pause%==true (
  pause
)

goto :eof

REM ******************************************************
REM Convert a windows path to a unix path Expensive O(26N)
REM ******************************************************
:tounixpath
    for %%c in (^^ a b c d e f g h i j k l m n o p q r s t u v w x y z) DO SET %1=!%1:%%c:=/mnt/%%c!
	set %1=!%1:\=/!
    goto :eof

:eof