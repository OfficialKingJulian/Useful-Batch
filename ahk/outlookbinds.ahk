; Adding some functionality to outlook, 2007
; This was a pain to do, but I've got the
; hang of IfWinActive now...

#IfWinActive, ahk_class rctrl_renwnd32
  ^w::
    SplashTextOn , 200, 70, ,`nToggling email reciepts
    Sleep 1000
    SplashTextOff
    Send !t
    Send o
    Send m
    Send !t
    Send r
    Send {Enter}
    Send {Escape}
    Send {Escape}
    Return
#IfWinActive
  ^w::
    Return
