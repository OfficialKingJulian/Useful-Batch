@echo off

set location=%1
shift
		
if [%location%] == [] (
	dir /b /o
	goto :eof
) else (
	dir /b /o %location%
)
:eof
