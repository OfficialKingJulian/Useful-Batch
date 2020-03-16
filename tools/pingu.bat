@echo off

:: This can see if a port is 
:: responding; like ping!

set input=%1
shift

setlocal enabledelayedexpansion
set count=1

for /F "tokens=* USEBACKQ" %%F in (`curl -I -s %input%`) do (
  set m!count!="%%F"
  set /a count=!count!+1
)

:: Echo the response code
if not [!m1!] == [] (
  echo Response code !m1!.
) else (
  echo No response at all.
)

endlocal
