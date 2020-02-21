; A  selection of general 
; bindings for all across 
; the Windows environment

; Vim-Like Bindings (Holding Alt)
  ; h,j,k,l to arrow keys
  !h::Send {Left}
  !j::Send {Down}
  !k::Send {Up}
  !l::Send {Right}
  +!h::Send +{Left}
  +!j::Send +{Down}
  +!k::Send +{Up}
  +!l::Send +{Right}
  #!h::Send #{Left}
  #!j::Send #{Down}
  #!k::Send #{Up}
  #!l::Send #{Right}
  ; / to search
  !/::
  Send, ^f
  return

; Volume Key; Add Sound
  ~Volume_Up::
  ~Volume_Down::
    SoundPlay, C:\CMD\ahk\res\bing-1.wav
  return

; i3wm Similar Bindings (Holding Alt)
  ; q to close current window 
  !q::
    WinGetActiveTitle, OutputVar
    WinKill, %OutputVar%
  return
  ; Enter to start custom CMD 
  !Enter::Run "C:\CMD\cmdrc.bat"
  return 

; Misc (all with Alt)
  ; F4 Insert ~ Julian Orchard
  !F4::
    Send ~ Julian Orchard
  return
  ; F5 Insert Timestamp
  !F5::
    FormatTime, time, A_now, ddd d-MMM-yy hh:mm tt
    send %time%
  return
  ; F6 Insert Time and Sign
  !F6:: 
    FormatTime, time, A_now, ddd d-MMM-yy hh:mm tt
    Send %time% ~ JO : {Enter} 
  return
; Insert a random, serious sign off
  !F7::
    serious := [] 
    lines := 0
    Loop, Read, C:\CMD\ahk\res\serious.txt
    {
      serious.Push(A_LoopReadLine) 
      lines++ 
    }
    Random, randum, 0, %lines%
    Send, % serious[randum]
  return
; Insert a random, silly sign off - X regards, 
  !F8::
    silly := [] 
    lines := 0
    Loop, Read, C:\CMD\ahk\res\silly.txt
    {
      silly.Push(A_LoopReadLine) 
      lines++ 
    }
    Random, randum, 0, %lines%
    Send, % silly[randum]
    Send, {space}regards, 
  return
