@echo off

setlocal enabledelayedexpansion

for %%a in (*) do (

	set f=%%a

REM sets characters to remove from the file names 
	set f=!f:^(=!
	set f=!f:^)=!
	set f=!f:^ =!

	ren "%%a" "!f!"

)
