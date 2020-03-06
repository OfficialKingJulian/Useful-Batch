; A  selection of general 
; bindings for all across 

  ; NOTES: 
    ; #: win
    ; !: alt
    ; ^: ctrl
    ; +: shift
    ; *: wildcard
    ; ~: pass through

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
  !/::Send ^f

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
  !Enter::
    Run "C:\CMD\cmdrc.bat"
  return 

; Print Screen Opens 'Snipping Tool'
  $PrintScreen::
    Run, "C:\Windows\system32\SnippingTool.exe"
    Sleep, 500
    Send, {ctrl down}{n down}
    Sleep, 100
    Send, {ctrl up}{n up}
  return

; Insert Markdown Syntax
; ~ this could be a little bit nicer
;   but for the moment I think it's fine
  ~h & 1:: title(1) 
  ~h & 2:: title(2) 
  ~h & 3:: title(3) 
  ~h & 4:: title(4) 
  ~h & 5:: title(5) 
  ~h & 6:: title(6) 
  title(numput) 
  {
    Send, {backspace}
    Loop, %numput% 
    {
      Send, {#}
    }
    Send, {space}
  }
  return
 	Convert_Lower()
	{
	  Clip_Save:= ClipboardAll
	  Clipboard:= ""
	  Send ^c{delete}
	  StringLower Clipboard, Clipboard
	  Send %Clipboard%
	  Len:= Strlen(Clipboard)
	  Send +{left %Len%}
	  Clipboard:= Clip_Save
	}

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

; Font-mode
  ; Microsoft Word, OpusApp
  ; Microsoft PowerPoint, PP12FrameClass
  ; Microsoft Excel, XLMAIN
  ; Microsoft Outlook, rctrl_renwnd32
  if WinActive("ahk_class OpusApp") or WinActive("ahk_class PP12FrameClass") or WinActive("ahk_class XLMAIN") or WinActive("ahk_class rctrl_renwnd32") 
  {
    fontmodeoff()
    {
      Hotkey, s, SegoeUI, Off
      Hotkey, t, TwCen, Off
      SplashTextOff
    }
    !f::
      Hotkey, s, SegoeUI, On
      Hotkey, t, TwCen, On
      SplashTextOn, , , Font Mode, Enabled.
      WinMove, Font Mode, Enabled., 50, 970
      Sleep, 500
    return
    SegoeUI:
      Send, !hffSegoe{space}UI{space}Light{enter}
      fontmodeoff()
    return
    TwCen:
      Send, !hffTw{space}Cen{space}MT{enter}
      fontmodeoff()
    return
  }    

; 'mod+e' on roids
;  Usage; alt+e, then h/w/j/p/s/etc.
;  opens up folder in Win Expl
  emodeoff()
  {
    Hotkey, h, C, Off
    Hotkey, w, W, Off
    Hotkey, j, J, Off
    Hotkey, p, P, Off
    Hotkey, s, S, Off
  }
  !e::
    Hotkey, h, C, On
    Hotkey, w, W, On
    Hotkey, j, J, On
    Hotkey, p, P, On
    Hotkey, s, S, On
  return
  C:
    Run, C:\Users\jorchard
    emodeoff()
  return
  W:
    Run, C:\Users\jorchard\Documents\Website
    emodeoff()
  return
  J:
    Run, J:\TSD\
    emodeoff()
  return
  P:
    Run, P:\
    emodeoff()
  return
  S:
    Run, S:\
    emodeoff()
  return
