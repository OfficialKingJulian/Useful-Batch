@echo off 

:: Creates Startup Links For AHK

    set supfolder=C:\Users\jorchard\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
    set ahkfolder=C:\CMD\ahk

:: All files in root folder
    for /f %%a in ('dir /b /a:-d %ahkfolder%') do (
      echo %ahkfolder%\%%a
rem      echo y | xcopy "%ahkfolder%\%%a" "%supfolder%\%%a"
    )

:: All files in subfolders 
:: (one level depth - that's all I need!)
    for /f %%b in ('dir /b /a:d %ahkfolder%') do (
REM > Echo Testing
REM   echo %%b
      echo Folder : %%b 
      echo.
      for /f %%c in ('dir /b /a:-d %ahkfolder%\%%b') do (
        echo %ahkfolder%\%%b\%%c
rem     echo y | xcopy %ahkfolder%\%%b\%%c %supfolder%\%%c
      )
    )


