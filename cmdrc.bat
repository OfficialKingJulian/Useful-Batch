@echo off

:: NOTE: 
::
:: 	CMD.exe is located in C:\Windows\system32,
::	so when editing the looks of the terminal
::	change it there
::
::	This is designed to run with the AHK Script
::	'term.ahk'. It is mapped to Alt+Enter 
::	which is the same as my terminal for i3wm


:: https://superuser.com/questions/144347/is-there-windows-equivalent-to-the-bashrc-file-in-linux/916478#916478
:: Setting Custom 'Prompt' (basically bash PS1)
    set PROMPT=$S$$$SJulian$S$Q$STime:$S$T$H$H$H$S$_$S$S$P$S$G$S
:: Start in Home Dir
    cd %homepath%
:: Start the command prompt for real
    CMD

