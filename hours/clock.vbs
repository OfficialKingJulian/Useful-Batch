' Clock.vbs	    by Julian Orchard

' A little script that keeps track of
' hours worked, on the command line!

' Work Time Calculator
  Function wtcalc(ByRef starttime, endtime)
    worktimemins = DateDiff("n", starttime, endtime)
    worktimecalc = split(worktimemins/60,".")
    wktimeminute = left(round((worktimecalc(1)*60)/100,0),2)
    If len(wktimeminute) = 1 Then wktimeminute = "0" & wktimeminute End If
    wtcalc       = worktimecalc(0) & _
                   ":"             & _ 
                   wktimeminute
  End Function

  
' Call this to add/overwrite times
	Function AddTime(ByVal inout)

	' Get File Objects
 	  Set fso      = CreateObject("Scripting.FileSystemObject")
	  Set editfile = fso.OpenTextFile("C:\CMD\hours\log-temp.csv",2,True)
    Set readfile = fso.OpenTextFile("C:\CMD\hours\log.csv",1)

  ' Current Time
    curtime = FormatDateTime(Now,4)

	' Loop Through Whole File
	  Do While readfile.AtEndOfStream <> True

    ' Read Current Line, Array Delim Comma
      line = readfile.readline
	    linearray = split(line, ",")
	    linedate  = datevalue(linearray(0))

    ' Found Todays Date
	    If linedate = Date Then
        If inout = "in" Then
      ' Replacing In
          editfile.writeline linearray(0) & "," & _
                             curtime      & "," & _
                             linearray(2) & "," & _
                             linearray(3) & "," & _
                             linearray(4)
        Else
      ' Replacing Out
          editfile.writeline linearray(0) & "," & _
                             linearray(1) & "," & _
                             curtime      & "," & _
                             linearray(3) & "," & _
                             linearray(4)
        End If
      Else
        editfile.writeline line
	    End If
	  Loop
	  editfile.close
    readfile.close

    ' Replace Log with Log-Temp
      fso.deletefile "C:\CMD\hours\log.csv", True
      fso.movefile   "C:\CMD\hours\log-temp.csv", "C:\CMD\hours\log.csv"
	End Function


' Call if Row not found by Find-Row; makes new row
  Function NewRow(ByVal inout)
    Set fso  = CreateObject("Scripting.FileSystemObject")
    ' 1 read, 2 edit, 8 append
	  Set appendfile = fso.OpenTextFile("C:\CMD\hours\log.csv",8,True) 
     ' Current Time
       curtime = FormatDateTime(Now,4)
    appendfile.writeline Date & "," & _
                         curtime & "," & _
                         "," & _
                         ","
    appendfile.close
    Set appendfile = Nothing
  End Function


' Look Up Row
  Function FindRow(ByVal inout)

    found = "false"

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
        found = "true"
        afile.close
        Set afile = Nothing

      ' IN
        If inout = "in" Then
          ' Check if 'In' is populated
          If linearray(1) = "" Then
             Call AddTime(inout)
             wscript.quit 1
          Else
            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  Call AddTime(inout)
                  wscript.quit 1
              Else 
                  wscript.echo "Exiting..."
                  wscript.quit 1
              End If
          End If

      ' OUT
        Else 
          If linearray(1) = "" Then
          ' Error, trying to clock out when there is no clock in data
            wscript.echo "You cannot clock out when you haven't yet clocked in for the day."
            wscript.echo "Please enter a clock in time."
            wscript.quit 1
          ElseIf linearray(2) = "" Then
            Call AddTime(inout)
            wscript.quit 1
          Else
            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  Call AddTime(inout)
                  wscript.quit 1
              Else 
                  wscript.echo "Exiting..."
                  wscript.quit 1
              End If
          End If  
        End If 
	    End If
	  Loop
	  afile.close
    Set afile = Nothing
    ' Rown not found
    If found = "false" And inout = "in" Then 
      wscript.echo "Recording a new day..."
      Call NewRow(inout)
      wscript.quit 1
    Else 
      wscript.echo "Error. You cannot add an 'out' time before adding an 'in' time for the day."
      wscript.quit 1
    End If
	End Function


  Function OverwriteConfirmation(ByVal inout)
    If inout = "in" Then
      wscript.echo "You have already clocked in today."
    Else 
      wscript.echo "You have already clocked out today."
    End If 
    wscript.echo "Would you like to overwrite your current time? (y/n)"
  ' Return confirmation
    OverwriteConfirmation = wscript.stdin.readline
  End Function



' Script Called by cl.bat
' Get arguments to work with
	Set args = wscript.arguments
	If args(0) = "in" Then
    inout = "in"
	ElseIf args(0) = "out" Then
    inout = "out"
	Else 
		wscript.echo "There has been a fatal error."
    wscript.quit 1
	End If
' Find Row to get underway
  Call FindRow(inout)

















' Misc-Codea
Function misccode
' Use Line Array, etc. 
  starttime    = TimeValue(linearray(1))
  endtime      = TimeValue(linearray(2))
  workingtime  = linearray(3)
  dayoftheweek = linearray(4)

' This isn't working... yet
  If workingtime = "TBC" Then
    Call wtcalc(starttime, endtime)
  End If

' Show Today's Hours
  wscript.echo ""
  wscript.echo "Today is looking like this... "
  wscript.echo "Start time:      " & starttime
  wscript.echo "End time:        " & endtime
  wscript.echo "Day of the week: " & dayoftheweek
  wscript.echo "Hours worked:    " & wtcalc
  wscript.echo ""

End Function

    On Error Resume Next
      wscript.echo "Exiting program."


