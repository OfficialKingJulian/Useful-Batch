; Close Current Window, with Alt+q 

  !q::
  WinGetActiveTitle, OutputVar
  WinKill, %OutputVar%

return
