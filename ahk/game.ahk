#Persistent 
CoordMode Pixel, Screen
CoordMode Mouse, Screen
; Autoplay the Chrome Dinosaur Game
SetTimer, obj, 1
return

obj:
  #IfWinActive, ahk_class Chrome_WidgetWin_1
  PixelGetColor, isobj, 670, 230
  PixelGetColor, ibjec, 700, 230
  IfNotEqual, isobj, 0x242120
    Send, {space}
  IfNotEqual, ibjec, 0x242120
    Send, {space}
  Return
