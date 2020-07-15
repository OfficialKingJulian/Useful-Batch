#Persistent

; Run BakkesMod when Rocket League Opens

; Check Every Half Minute
  SetTimer, CheckForRL, 30000

; Open If RL
  CheckForRL:
  IfWinActive, Rocket League
  {
    Run, "D:\Programs\Bakkesmod"
  }
  Return
