@echo off

setlocal enabledelayedexpansion
set /p Input=Beginning of files in this folder you want to rename: 

for %%a in (%Input%*.jpg) do (

	set f=%%a


REM sets characters to remove from the file names 
	set f=!f:^(=!
	set f=!f:^)=!
	set f=!f:^ =!

	ren "%%a" "!f!"

)
