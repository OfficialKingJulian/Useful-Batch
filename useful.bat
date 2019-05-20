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
) else if !instr! == -install (
	if not exist C:\CMD\ mkdir C:\CMD
	if not exist C:\CMD\layouts mkdir C:\CMD\layouts
	setx PATH "%PATH%;C:\CMD"
	xcopy *.bat C:\CMD /q /f
	xcopy layouts\*.txt C:\CMD\layouts /q /f
) else if !instr! == -uninstall (
	del C:\CMD\layouts\* /q
	rmdir C:\CMD\layouts
	del C:\CMD\* /q
	rmdir C:\CMD
) else (
	echo. 
	echo ERROR, this command accepts the following instructions:
	echo. 
	echo -install                    moves commands to your path
	echo. 
	echo -uninstall            removes the commands to your path
)
