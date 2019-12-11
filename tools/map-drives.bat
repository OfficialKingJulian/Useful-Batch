@echo off

:: Tiny thing, but it just offers a shorter way of 
:: swapping between drives. Instead of J:, this script
:: makes it just j (or J, it's case insensitive)

:: Create Shortcuts Dir
set shortcuts=C:\CMD\shortcuts
if not exist %shortcuts% ( mkdir %shortcuts% )

:: Set Path
::    setx PATH "%PATH%;C:\CMD\tools\shortcuts\"   & REM THIS NEEDS LOOKING AT

:: Create All The Shortcut Files
for %%a in (a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z) do (
  echo @echo off>%shortcuts%\%%a.bat
  echo REM added automatically by script>>%shortcuts%\%%a.bat
  echo %%a:>>%shortcuts%\%%a.bat
)
