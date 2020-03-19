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

:: Shortcut DIR
  set shortdir=C:\CMD\shortcuts

:: Check if File Exists
  if exist "%shortdir%\%sname%.bat" (
    echo Error; this file already exists!
    exit /b
  )
  
:: 
  echo "%shortdir%\%sname%.bat" 


