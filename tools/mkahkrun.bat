@echo off

if (%1 == []) set /p 1="What do you want to call the new shortcut?"
echo F|xcopy C:\CMD\ahk\run\run_template.txt C:\CMD\ahk\run\%1.ahk

