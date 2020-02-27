@echo off

:: Search for files before or after
:: a certain date... echo the full path

set dat=%1
shift
if [%dat%] == [] (
  echo Enter a date, like -dd/MM/yyyy to get all file before, or +dd/MM/yyyy to get all files after 
) else (
  forfiles /S /D %dat% /C "cmd /c echo @path"
)
