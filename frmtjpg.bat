@echo off
REM please use this if you want to, 
REM but speak to Julian first

setlocal enabledelayedexpansion
set /p Input=Beginning of files in this folder you want to rename: 

REM %Input% is user input, this is where you can 
REM change what type of file e.g. .jpg, .png, .txt 
for %%a in (%Input%*.jpg) do (

	set f=%%a


REM sets characters to remove from the file names 
REM in this case, it's "(", ")", and " " chars
	set f=!f:^(=!
	set f=!f:^)=!
	set f=!f:^ =!

REM ren = rename :)
	ren "%%a" "!f!"

)