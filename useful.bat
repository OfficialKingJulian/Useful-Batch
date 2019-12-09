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
	if not exist C:\CMD 		   mkdir C:\CMD
	if not exist C:\CMD\bin 	   mkdir C:\CMD\bin
	if not exist C:\CMD\fun 	   mkdir C:\CMD\fun
	if not exist C:\CMD\routine 	   mkdir C:\CMD\routine
	if not exist C:\CMD\tools 	   mkdir C:\CMD\tools
	if not exist C:\CMD\tools\layouts  mkdir C:\CMD\tools\layouts
	if not exist C:\CMD\ahk            mkdir C:\CMD\ahk
	if not exist C:\CMD\ahk\run 	   mkdir C:\CMD\ahk\run
	setx PATH "%PATH%;C:\CMD"
	setx PATH "%PATH%;C:\CMD\bin"
	setx PATH "%PATH%;C:\CMD\fun"
	setx PATH "%PATH%;C:\CMD\routine"
	setx PATH "%PATH%;C:\CMD\tools"
	setx PATH "%PATH%;C:\CMD\tools\layouts"
	xcopy *               C:\CMD               /q /f
	xcopy bin\*           C:\CMD\bin 	   /q /f
	xcopy fun\*           C:\CMD\fun 	   /q /f
	xcopy routine\*       C:\CMD\routine 	   /q /f
	xcopy tools\*         C:\CMD\tools 	   /q /f
	xcopy tools\layouts\  C:\CMD\tools\layouts /q /f
        xcopy ahk\*           C:\CMD\ahk	   /q /f
        xcopy ahk\run\*       C:\CMD\ahk\run       /q /f
) else if !instr! == -uninstall (
	del C:\CMD\tools\layouts\* /q
	rmdir C:\CMD\tools\layouts
	del C:\CMD\bin\* /q
	rmdir C:\CMD\bin
	del C:\CMD\fun\* /q
	rmdir C:\CMD\fun
	del C:\CMD\routine\* /q
	rmdir C:\CMD\routine
	del C:\CMD\routine\* /q
	rmdir C:\CMD\routine
	del C:\CMD\tools\* /q
	rmdir C:\CMD\tools
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
