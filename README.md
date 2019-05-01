# Launch Linux GUI applications / window managers on Windows

Scripts to launch GUI applications / window managers installed on a Linux distribution.

Requires VcXsrv installed. Install directory should either be in %programfiles% (e.g. C:\Program Files\VcXsrv), or registered in the system path.

## Features

- checks if X server is running and automatically launches one

## Syntax

`bashx app_to_lauch app_arg1 app_arg2 ... `
`bashx-console app_to_lauch app_arg1 app_arg2 ... `

## Tip

For high-DPI displays tick "Override high DPI scaling behavior" and select "Application" in "Compatibility" tab of vcxsrv.exe properties.
