@echo off

:: Add Custom $PROFILE Every Time
  xcopy C:\CMD\psrc.ps1 C:\Users\jorchard\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 /Y > nul

:: Run PowerShell, without Admin
  echo.
  powershell.exe -ExecutionPolicy bypass -NoLogo
