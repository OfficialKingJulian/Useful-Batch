@echo off

   :: My Version Of GNU Shred ::
   ::     - pretty crude -    ::


:: Get filename like this... for now
  set /p "file=enter filename: "
  for %%i in (%file%) do @set chars=%%~zi

:: We have the number of characters in 
:: the file. Now overwrite with the same
:: number of random chars again
  echo this file has %chars% characters including whitespaces and special chars like line-feed/carriage-return etc.

:: Generate Chars
echo.>%file%

REM Get Random Ascii Char Between:
REM      Dec48   =  Ascii 0
REM      Dec122  =  Ascii z

for /l %%a in (1, 1, %chars%) do (
 
  set /a "ascii = %random% * 74 / 32768 + 48"
  cmd /c exit /b %ascii%
  echo %=ExitCodeAscii%

)

