@echo off

:: Get Args
  set add=%1
  shift

:: Check Args
  if [%add%] == [] ( set add=%cd% )

:: Add Location to PATH
  if exist %add% (
    set PATH="%PATH%;%add%"
  ) else (
    echo Error; the location %add% could not be found.
    echo Please try again.
  )

:: Refresh
  C:\CMD\tools\refreshenv.bat
