@echo off

:: Add Custom $PROFILE Every Time
  set psdir="C:\%homepath%\Documents\WindowsPowerShell"
  :: Folder
  if not exist %psdir% mkdir %psdir%
  :: File (Manually sync first run)
  if not exist %psdir%\Microsoft.PowerShell_profile.ps1 (
    xcopy C:\CMD\psrc.ps1 %psdir%\Microsoft.Powershell_profile.ps1 
  ) else (
    xcopy C:\CMD\psrc.ps1 %psdir%\Microsoft.PowerShell_profile.ps1 /Y > nul
  )

:: Run PowerShell, without Admin
  echo.
  powershell.exe -ExecutionPolicy bypass -NoLogo
