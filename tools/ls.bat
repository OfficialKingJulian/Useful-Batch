@echo off

set location=%1
shift
		
if [%location%] == [] (
	echo. 
	dir /b /o
) else (
	echo. 
	dir /b /o %location%
)
