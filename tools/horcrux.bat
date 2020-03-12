@echo off

:: Horcrux https://github.com/jesseduffield/horcrux
:: implementation in batch, for portability... and fun

:: Variables
  set file=%1
  set parts=%2
  shift
  shift
  :: If File Does Not Exist
  if not exist %file% ( 
    echo.Sorry, the file '%file%' does not exist. Please try again.
    exit /b
  ) 
  :: If Parts Not Specified
  if [%parts%] == [] ( set parts=3 )

  for /f "usebackq" %%a in ('%file%') do set size=%%~za
:: Add this later
:: if %size% GEQ "1000" echo This might take a while...

  set /a cruxsize=%size%/%parts%
  echo.%cruxsize% bytes

:: Read whole file
  for /F "usebackq tokens=*" %%A in ("%file%") do (
    set eos=___ENDOFSTRING___
    set /p text=<%file%
    set temp=%text%%eos%
    :loop
      set char=%temp:~0,1%
      set temp=%temp:~1%
      echo.char: %char%
    if not "%temp%" == "%eos%" goto loop
  )

