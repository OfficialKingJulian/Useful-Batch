; Some Bindings for Trello

; For deleting cards from
; the archived items list
#!a::
Loop, 5 {
; Open Card
  MouseMove, 1750, 260
  Sleep, 500
  Click
; Delete Button
  MouseMove, 1250, 950
  Sleep, 750
  Click
; Confirm Delete
  MouseMove, 1250, 900
  Sleep, 250
  Click
}
Return
