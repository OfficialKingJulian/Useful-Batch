@echo off

set instr=%1
shift

setlocal enabledelayedexpansion

set /A counter=1

REM  the new way
for /f "tokens=*" %%a in (C:\CMD\layouts\!instr!.txt) do (
	
  REM  0 start or no0 
	if !counter! GEQ 10 (
		mkdir "!counter!. %%a"
	) else (
		mkdir "0!counter!. %%a"
	)
	set /A counter+=1

)