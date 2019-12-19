; Adding some functionality to outlook, 2007
; This was a pain to do, but I've got the
; hang of IfWinActive now...

#IfWinActive, ahk_class rctrl_renwnd32
  ^w::
    Send !t
    Send o
    Send m
    Send !t
    Send r
    PixelGetColor, ischecked, 79, 184
    Send {Enter}
    Send {Escape}
    Send {Escape}
  ; Check if toggled on or off
    IfEqual, ischecked, 0xFFFFFF
      SplashTextOn , 200, 70, ,`nRead recipts off
    Else IfNotEqual, ischecked, 0xFFFFFF
      SplashTextOn , 200, 70, ,`nRead recipts on
    Sleep 1000
    SplashTextOff
    Return
#IfWinActive
  ^w::
    ;MsgBox %ischecked%
    ;MouseMove 81,209
    Return
