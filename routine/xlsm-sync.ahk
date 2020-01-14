; AHK script to check a spreadsheet daily
; which sends an email if chaseup hasn't happened

; Takes 6 Seconds
Run, Excel.exe J:\TSD\AgentEnquiries.xlsm
Sleep, 3000
Send ^+w
Sleep, 3000
Send !q
