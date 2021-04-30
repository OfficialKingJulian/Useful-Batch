#Persistent

; Run BakkesMod when Rocket League Opens

; Check Every Half Minute
  SetTimer, CheckForRL, 30000

; Open If RL
  CheckForRL:
  if WinExist("Rocket League") and !WinExist("ahk_exe BakkesMod.exe")
  {
    
    Run, "D:\Programs\Bakkesmod"
  }
  Return
