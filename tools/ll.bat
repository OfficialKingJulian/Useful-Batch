@echo off

set location=%1
shift
		
if [%location%] == [] (
	echo. 
	dir /b /o /a:d
	dir /b /o /a:-d
) else (
	echo. 
	dir /b /o /a:d %location%
	dir /b /o /a:-d %location%
)
