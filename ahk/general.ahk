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
