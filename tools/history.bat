@echo off

:: Search for files before or after
:: a certain date... echo the full path

set dat=%1
set sea=%2
shift
shift
if [%dat%] == [] (
  echo Enter a date, like -dd/MM/yyyy to get all file before, or +dd/MM/yyyy to get all files after.
  echo You can also enter a search path. 
) else (
  if [%sea%] == [] (
    forfiles /S /D %dat% /C "cmd /c echo @path"
  ) else (
    forfiles /S /D %dat% /m %sea% /C "cmd /c echo @path"
  )
)
