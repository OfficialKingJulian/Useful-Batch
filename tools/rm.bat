@echo off


for %%a in (%*) do (

  if exist %%a\NUL (rmdir "%%a" /S /Q) else (del "%%a")

)
