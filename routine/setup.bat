@echo off

:: Setting Up All 'Routine' Tasks

  echo ====================
  echo SCREEN REMINDER TASK
  echo ====================
    schtasks /Create /tn "Screen Reminder" /tr "C:\CMD\routine\take-a-break.vbs" /sc hourly /st 00:00:00 /sd 01/01/2010 /ru jorchard

  echo ===============================
  echo OUTLOOK 2007 CALENDAR SYNC TASK
  echo ===============================
    schtasks /Create /tn "Cal Sync" /tr "C:\CMD\routine\outlook-sync.ahk" /sc daily /st 12:55 /sd 01/01/2010 /ru jorchard
