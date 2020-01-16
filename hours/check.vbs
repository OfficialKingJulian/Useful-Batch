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

  ' Get each line of file
	  Do While afile.AtEndOfStream <> True

    ' Split line into array, comma delim
	    linearray = split(afile.readline, ",")
    ' Current date is the first of the array
	    linedate  = datevalue(linearray(0))

	    If linedate = Date Then
        wscript.echo "Found the date"
        wscript.echo Weekday(CDate(linearray(0)),2)
	    End If
	  Loop
	  afile.close
    Set afile = Nothing


