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
    IfEqual, ischecked, 0xFFFFFF
      TrayTip, Read Receipts On, Outlook read receipts have been enabled.
    Else IfNotEqual, ischecked, 0xFFFFFF
      TrayTip, Read Receipts Off, Outlook read receipts have been disabled.
;   Sleep 2000
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
; Ctrl-O by default opens the message; USELESS
; Remap Ctrl-O to start Out Of Office Assistant
  ^o::
    Send !t
    Send u
    PixelGetColor, oohon, 313, 401
    IfEqual, oohon, 0xFFFFFF
      Send !n
    IfEqual, oohon, 0xFFFFFF  
      TrayTip, Out of Office Assistant Off, Outlook 'auto-replies' have been disabled.
    IfNotEqual, oohon, 0xFFFFFF
      Send !s
    IfNotEqual, oohon, 0xFFFFFF
      TrayTip, Out of Office Assistant On, Outlook 'auto-replies' have been enabled.
;   Sleep 2000
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

