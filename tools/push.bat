@echo off

::  git add .
 
::    git commit -m "%*"

  

  for %%a in (%*) do (
    if %%a==-f (
	echo Forcing push...
    ) else (
	set "message=%message% %%a"
    )
  )

  echo %message%
  set "message=Update: "

      ::git commit -m "%message%"

    	::git push origin master
