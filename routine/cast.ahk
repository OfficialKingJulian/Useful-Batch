; A script to Chrome cast the Live
; News to our break room at work

; URL https://news.sky.com/watch-live

Run Chrome.exe
Sleep, 2000
Send https://news.sky.com/watch-live
Send {Enter}
Sleep, 3000
MouseMove, 565, 650
Click
Sleep, 2000
MouseMove, 1365, 1005
Sleep, 7000
Send !q
