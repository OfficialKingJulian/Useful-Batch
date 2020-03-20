@echo off

:: Generate some Common Win Shortcuts
:: Automatically, e.g. home=%homepath%

:: Args
  set sname=%1
  shift

:: Or No Args
  if [%sname%] == [] set /p sname="What would you like to name the shortcut to this folder? "

:: Detect if .cmd or .bat are already 
:: present; remove them if they are
  set snameext=%sname:~-3%
  if %snameext% == bat set sname=%sname:~0,-4%
  if %snameext% == cmd set sname=%sname:~0,-4% 

:: Shortcut DIR, if not exist
:: and add some sensible defualts
  set shortdir=C:\CMD\shortcuts
  if not exist %shortdir% (
    mkdir %shortdir%
    :: Recycle Bin
      echo @echo off>%shortdir%\bin.bat
      echo start shell:recyclebinfolder>>%shortdir%\bin.bat
    :: Home Dir
      echo @echo off>%shortdir%\home.bat
      echo C:^>nul>>%shortdir%\home.bat
      echo cd %homepath%>>%shortdir%\home.bat
    )

:: Check if File Exists
  if exist "%shortdir%\%sname%.bat" (
    echo Error; this file already exists!
    exit /b
  )

:: Actually Write the Shortcut
:: Format of each command...
::    @echo off
::    C:>nul
::    cd %cd%
  echo @echo off>%shortdir%\%sname%.bat
  echo  C:^>nul>>%shortdir%\%sname%.bat
  echo  cd %cd%>>%shortdir%\%sname%.bat
  
