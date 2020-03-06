

; Functions of a Tiling Window Manager: 

;   An ultra minimalistic tiling window 
;   implementation for Windows 10.

;   Does not feature such luxuries as 
;   multiple desktops. But it does keep
;   track of windows, where they are,
;   and allows you to easily switch 
;   between them (the most important
;   things, imo).

; Spawn Window In
  !space:: 
    spawnwin()
  return
  spawnwin() 
    {
      Run, cmd.exe
      WinGet, WinPID, PID, A
      FileAppend,%WinPID%`,t`n, C:\CMD\ahk\ahkwm\wm.csv
    }

; Purge Window Out
  !+k::
    purgewin()
  return
  purgewin() 
    {
      WinGet, WinToKill, PID, A
      Loop, Read, C:\CMD\ahk\wm.csv
      {
        LineNumber := A_Index
        Loop, parse, A_LoopReadLine, CSV
        {
          MsgBox %A_LoopField% and %WinToKill%
          if %A_LoopField% = %WinToKill%
            MsgBox Found!
        }
      } 
    }


; Loop That Keeps Checking 
; On The Status Of Windows
  !F9::
    silly := []
    lines := 1
    Loop, Read, C:\CMD\ahk\wm.csv
    {
      silly.Push(A_LoopReadLine)
      MsgBox, % silly[lines]
      lines++
    }
  return
 
