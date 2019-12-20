; Adding some functionality to outlook, 2007
; This was a pain to do, but I've got the
; hang of IfWinActive now...

#IfWinActive, ahk_class rctrl_renwnd32
; Toggle Read Receipts On/Off
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
    ;Check if toggled on or off
    IfEqual, ischecked, 0xFFFFFF
      SplashTextOn , 200, 70, ,`nRead receipts off
    Else IfNotEqual, ischecked, 0xFFFFFF
      SplashTextOn , 200, 70, ,`nRead receipts on
    Sleep 1000
    SplashTextOff
    Return
; Flag Mail In Index List
  ^1::
    Send +{F10}
    Send u
    Send m
    Send +{F10}
    Send i
    ;uhhhh
    Send {Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}{Down}
    Send {Enter}
    Return
; Some Nicer Bindings (vim)
  ^h::Send +{Tab}
  ^j::Send {Down}
  ^k::Send {Up}
  ^l::Send {Tab}
  ^+f::
    Send +{Tab}+{Tab}+{Tab}
    Return
#IfWinActive
  ^w::
    Return

