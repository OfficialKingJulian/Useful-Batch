@echo off

set location=%1
shift
		
if [%location%] == [] (
	dir /b /o
) else (
	dir /b /o %location%
)
