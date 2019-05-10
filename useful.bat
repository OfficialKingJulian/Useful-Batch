@echo off

set instr=%1
shift

setlocal enabledelayedexpansion
		
if [!instr!] == [] (
	echo. 
	echo This command needs instructions:
	echo. 
	echo -install                    moves commands to your path
	echo. 
	echo -uninstall            removes the commands to your path

REM    test these at a later stage
) else if !instr! == -install (
	if not exist C:\Windows\System32\Useful-Batch mkdir C:\Windows\System32\Useful-Batch
	xcopy *.bat C:\Windows\System32\Useful-Batch /q /f
) else if !instr! == -uninstall (
	del C:\Windows\System32\Useful-Batch\* /q
	rmdir C:\Windows\System32\Useful-Batch
	
	
) else (
	echo. 
	echo ERROR, this command accepts the following instructions:
	echo. 
	echo -install                    moves commands to your path
	echo. 
	echo -uninstall            removes the commands to your path
)
