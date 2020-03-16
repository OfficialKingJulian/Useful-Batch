@echo off

:: Fixes a variety of files, making the 
:: file names not suck so much
setlocal enabledelayedexpansion

:: Ask the important questions
  set /p bs="Remove brackets and spaces? (y/n) "
  if %bs% == y ( 
  set /p br="Replace spaces with a dash? (y/n) " 
  )
  set /p re="Use command recursively?    (y/n) "
  if %re% == y (
    set re= /R 
  ) else (
    set re=
  )

:: Loop Files
for %re% %%a in (*) do (

  REM // file = f
    set f=%%a

  REM // Remove 
    if %bs% == y (
      set f=!f:^(=!
      set f=!f:^)=!
      if %br% == y (
        set f=!f: =-!
      ) else (
        set f=!f:^ =!
      )
    )
  echo !f!

  REM // jpg file case fixes
    set f=!f:^JPG=jpg!
    set f=!f:^jpeg=jpg!
  echo !f!

  REM // png fix cases
    set f=!f:^PNG=png!
  echo !f!

  REM // HTML, not very used
    set f=!f:^htm=html!
  echo !f!

  REM // replace original files
    ren "%%a" !f!
)

endlocal
