@echo off

:: Keep refreshing the Prompt for an effective clock

   :loop
	timeout /t 1 /nobreak >nul
 	cls
	cmd
   goto loop
