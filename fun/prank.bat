@echo off

set instr=%1
shift

setlocal enabledelayedexpansion

if [!instr!] == [] (set "instr=lol_")

for /L %%a IN (1,1,300) do (
  mkdir %USERPROFILE%\Desktop\!instr!%%a
)
