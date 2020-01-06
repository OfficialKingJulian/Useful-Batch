@echo off

:: Setting Up All 'Routine' Tasks

  echo ====================
  echo SCREEN REMINDER TASK
  echo ====================
    schtasks /Create /tn "Screen Reminder" /tr "C:\CMD\routine\take-a-break.vbs" /sc hourly /st 00:00:00 /sd 01/01/2010 /ru jorchard

  echo ===============================
  echo OUTLOOK 2007 CALENDAR SYNC TASK
  echo ===============================
    schtasks /Create /xml "C:\CMD\routine\CalendarSync.xml" /tn "Cal Sync" /ru jorchard
