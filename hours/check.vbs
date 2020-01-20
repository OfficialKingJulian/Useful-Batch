' Check.vbs	        by Julian Orchard

' A little script that keeps track of
' hours worked, on the command line!

' This handles empty cl.bat requests

' Note: 
  ' 1 sun
  ' 2 mon
  ' 3 tue
  ' 4 wed
  ' 5 thu
  ' 6 fri
  ' 7 sat

' Vague psudocode: 
'   get todays date
'   get start of the week from there
'   if no data, just leave blank entry

	' Get File Object
    Set fso  = CreateObject("Scripting.FileSystemObject")
	  Set afile = fso.OpenTextFile("C:\CMD\hours\log.csv", 1)
  ' Start of the week - https://stackoverflow.com/questions/8884098/find-this-weeks-monday
    d=Date
    sotw = DateAdd("d", -((Weekday("d") + 7 - 2) Mod 7), d)
    wscript.echo sotw

    wscript.quit 1
  ' Get each line of file
	  Do While afile.AtEndOfStream <> True

    ' Split line into array, comma delim
	    linearray = split(afile.readline, ",")
    ' Current date is the first of the array
	    linedate  = datevalue(linearray(0))

	    If linedate = sotw Then
        dotw Weekday(CDate(linearray(0)),2)
        For i = 1 To 6
         ' echo 
        Next
	    End If
	  Loop
	  afile.close
    Set afile = Nothing

