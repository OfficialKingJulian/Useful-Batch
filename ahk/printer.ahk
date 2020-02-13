#Persistent

; Please enter your printing 
; number below:  
  printno=60

; Check Every Half a Second 
; (might be overkill, increase 
; number to reduce)
  SetTimer, CheckWin, 500

; Check Window and Send Keys! 
CheckWin:
IfWinActive, Store Details
{
  Send {Tab}
  Sleep 500
  Send %printno%
  Sleep 500
  Send {Enter}
}
Return
