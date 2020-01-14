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


	    ' Attempt at reading input
	    	WScript.Echo "You've already clocked out today."
	    	WScript.Echo "Are you sure you want to do that again? (y/n)"
        confirm = WScript.StdIn.ReadLine
        If confirm = "y"  or confirm = "yes" Then
            WScript.Echo "Overwriting..."
        Else 
            WScript.Echo "Cancelling..."
        End If



  End Function

	Function AddTime

	' Get File Object
 	  Set fso     = CreateObject("Scripting.FileSystemObject")
	  Set logfile = fso.OpenTextFile("C:\CMD\hours\log.csv",2,True)
    Set readlogfile = fso.OpenTextFile("C:\CMD\hours\log.csv",1)

	' Loop Through Whole File
	  Do While readlogfile.AtEndOfStream <> True

    ' Split Line To Array
	    linearray = Split(readlogfile.ReadLine, ",")
	    linedate  = DateValue(linearray(0))

    ' Found Todays Date
	    If linedate = Date Then

	    ' Update
	      linearray(1) = Time
        wscript.echo linearray(1)
	      outputstring = join(linearray, ",")
        logfile.WriteLine outputstring

	    End If
	  Loop
	  logfile.close
    readlogfile.close

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

      ' PSEUDOCODETIME
          ' if clockin requested
          '   if clockin empty
          '     add current time as clock in time
          '   elif clockin not empty
          '     if overwrite yes
          '       add current time as clock in time
          '   else exit
          ' elif clockout requested 
          '   if clockin empty
          '     ask for clock in time or exit
          '   elif clockout empty
          '     add current time as clock out time
          '   elif clockout not empty
          '     if overwrite yes
          '       add current time as clock out time
          '     else exit

      ' IN
        If inout = "in" Then
          ' Check if 'In' is populated
          If linearray(1) = "" Then

            ' Just input current time
          Else

            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  ' Call overwrite
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
              wscript.echo "Easy inputting current time"

          ' Clock out populated already
          Else
            ' Check if overwrite is requested
              If OverwriteConfirmation(inout) = "y" Then
                  wscript.echo "Overwriting..."
                  ' Call overwrite
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

