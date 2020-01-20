@echo off
set arg=%1
shift
if [%arg%] == [] ( 
:: Call check.vbs  
  cscript C:\CMD\hours\check.vbs //nologo
) else (
:: Call clock.vbs
  cscript C:\CMD\hours\clock.vbs %* //nologo
)

