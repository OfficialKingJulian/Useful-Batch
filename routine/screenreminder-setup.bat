@echo off

:: Set Up Screen Reminder Task
  schtasks /Create /tn "Screen Reminder" /tr "C:\CMD\routine\take-a-break.vbs" /sc hourly /st 00:00:00 /sd 01/01/2010 /ru jorchard
