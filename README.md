# Launch Linux GUI applications / window managers on Windows

Scripts to launch GUI applications / window managers installed on a Linux distribution.

Requires either (a) VcXsrv installed in default Program Files location, (b) the VcXsrv portable directory in the same directory as bashx, or (c) or VcXsrv registered in the system path.

Note, for some reason the latest version of VcXsrv does not run on my system with error: `Failed to activate virtual core keyboard 2`. This version seems to work fine: https://sourceforge.net/projects/portable-x-server

## Features

`bashx` runs from windows, it opens Linux bash and sets the display output correctly, then reach-aroundly opens VcXsrv.exe from windows to run the requested Linux GUI program. It's awesome.

## Syntax

`bashx app_to_lauch app_arg1 app_arg2 ... ` <br>
`bashx-console app_to_lauch app_arg1 app_arg2 ... `

## Tip

For high-DPI displays tick "Override high DPI scaling behavior" and select "Application" in "Compatibility" tab of vcxsrv.exe properties.

## Protip
To make a shortcut to a GUI linux app in windows, say Sublime, make a shortcut to bashx on your desktop, set the (right-click Property's) target to Target: `C:\path_to_WSL-launch-GUI\bashx.vbs subl`, choose a Icon that looks like your linux app, and bam, you can double-click to seamlessly open.
