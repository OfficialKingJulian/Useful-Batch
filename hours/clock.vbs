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


' If cell is empty; call this
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
	    linedate  = DateValue(linearray(0))

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
      fso.deletefile "log.csv", True
      fso.movefile   "log-temp.csv", "log.csv"
	End Function




' Look Up Row
  Function FindRow(ByVal inout)

	' Get File Object
    Set fso  = CreateObject("Scripting.FileSystemObject")
	  Set file = fso.OpenTextFile("log.csv", 1)

  ' Get each line of file
	  Do While file.AtEndOfStream <> True

    ' Split line into array, comma delim
	    linearray = Split(file.ReadLine, ",")
    ' Current date is the first of the array
	    linedate  = DateValue(linearray(0))

	    If linedate = Date Then

      ' IN
        If inout = "in" Then
          ' Check if 'In' is populated
          If linearray(1) = "" Then
             file.close
             Set file = Nothing
             Call AddTime(inout)
          Else
            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  Call AddTime(inout)
              Else 
                  wscript.echo "Exiting..."
                  wscript.quit 1
              End If
          End If

      ' OUT
        Else 
          ' Haven't clocked in yet; error and quit
          If linearray(1) = "" Then
            wscript.echo "You cannot clock out when you haven't yet clocked in for the day."
            wscript.echo "Please enter a clock in time."
            wscript.quit 1

          ' Easy clock in
          ElseIf linearray(2) = "" Then
              Call AddTime(inout)
          ' Clock out populated already
          Else
            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  Call AddTime(inout)
              Else 
                  wscript.echo "Exiting..."
                  wscript.quit 1
              End If
          End If  
        End If 
	    End If
	  Loop
	  file.close
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

