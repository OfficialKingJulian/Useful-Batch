@echo off

set location=%1
shift

if [%location%] == [] (
  ls
::	echo. 
::	echo.Folders:
::	dir /b /o /a:d .
::	echo.
::	echo.Files:
::	dir /b /o /a:-d .
) else (
  if not exist %location% (
    echo.Cannot find the folder specified. Please try again.
  ) else (
    echo. 
    echo.Folders:
    dir /b /o /a:d %location%
    echo.
    echo.Files:
    dir /b /o /a:-d %location%
  )
)
