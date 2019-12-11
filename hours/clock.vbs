' Clock.vbs	    by Julian Orchard

' A little script that keeps track of
' hours worked, on the command line!
' Using VB Syntax for this stuff on 
' the command line is very weird.

      ' Work Time Calculator
	Function wtcalc(ByRef starttime, endtime)
	  worktimemins = DateDiff("n", starttime, endtime)
	  worktimecalc = split(worktimemins/60,".")
	  wktimeminute = left(round((worktimecalc(1)*60)/100,0),2)
	  If len(wktimeminute) = 1 Then wktimeminute = "0" & wktimeminute End If
	  wtcalc       = worktimecalc(0) & _
	  		 ":" & _ 
			 wktimeminute
	End Function






	Function AddTime

	' Get File Object
       	  Set fso     = CreateObject("Scripting.FileSystemObject")
	  Set logfile = fso.OpenTextFile("C:\CMD\hours\log.csv", 1)

	' Loop Through File 
	  Do While logfile.AtEndOfStream <> True
	    linearray = Split(logfile.ReadLine, ",")
	    linedate  = DateValue(linearray(0))
	    If linedate = Date Then

	    ' Update linearray for the correct column
	      WScript.Echo Time
	      linearray(1) = Time
	      output
	      

	    End If
	  Loop
	  logfile.close
	End Function





      ' Look Up Row
       	Function FindCurrentRow

	' Get File Object
       	  Set fso     = CreateObject("Scripting.FileSystemObject")
	  Set logfile = fso.OpenTextFile("log.csv", 1)

	' Loop Through File 
	  Do While logfile.AtEndOfStream <> True
	    linearray = Split(logfile.ReadLine, ",")
	    linedate  = DateValue(linearray(0))
	    If linedate = Date Then

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

	    End If
	  Loop
	  logfile.close
	End Function




	Set argus = WScript.Arguments
	If argus(0) = "in" Then

		WScript.Echo "Clocking you in..."
		Call AddTime

	ElseIf argus(0) = "out" Then


	    ' Attempt at reading input

	    	WScript.Echo "You've already clocked out today."
	    	WScript.Echo "Are you sure you want to do that again? (y/n)"
		confirm = WScript.StdIn.ReadLine
		If confirm = "y"  or confirm = "yes" Then
		    WScript.Echo "Overwriting..."
		Else 
		    WScript.Echo "Cancelling..."
		End If

	Else 
		Wscript.Echo "This command is unrecognised"
	End If

