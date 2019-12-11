@echo off
set arg=%1
shift
if [%arg%] == [] ( 
  echo.
  echo This command requires arguments in order to run: 
  echo in				clock in argument
  echo out 				clock out argument
  goto :eof 
) else (
:: Call VBS
  cscript C:\CMD\hours\clock.vbs %* //nologo
)

