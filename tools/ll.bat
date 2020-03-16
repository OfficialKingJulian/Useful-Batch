@echo off

set location=%1
shift

if [%location%] == [] (
	echo. 
	echo.Folders:
	dir /b /o /a:d .
	echo.
	echo.Files:
	dir /b /o /a:-d .
) else (
  echo. 
  echo.Folders:
  dir /b /o /a:d %location%
  echo.
  echo.Files:
  dir /b /o /a:-d %location%
)
