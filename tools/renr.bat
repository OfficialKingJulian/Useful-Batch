@echo off

:: Recursive REN
set arg1=%1
set arg2=%2
shift
shift

for /r %%x in (%arg1%) do ren "%%x" %arg2%
