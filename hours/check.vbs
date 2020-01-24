' Check.vbs	        by Julian Orchard

' A little script that keeps track of
' hours worked, on the command line!

' This handles empty cl.bat requests

  Function wtcalc(ByRef starttime, endtime)
    worktimemins = DateDiff("n", starttime, endtime)
    worktimecalc = split(worktimemins/60,".")
    wktimeminute = left(round((worktimecalc(1)*60)/100,0),2)
    If len(wktimeminute) = 1 Then wktimeminute = "0" & wktimeminute End If
    wtcalc       = worktimecalc(0) & _
                   ":"             & _ 
                   wktimeminute
  End Function


	' Get File Object
    Set fso  = CreateObject("Scripting.FileSystemObject")
	  Set filenm = fso.OpenTextFile("C:\CMD\hours\log.csv", 1)
  ' Start of the week:
  ' https://stackoverflow.com/questions/8884098/find-this-weeks-monday
    d=date
    sotw = dateadd("d", -((weekday(d) + 7 - 2) Mod 7), d)
    printweek = 0

  ' Get each line of file
	  Do While filenm.AtEndOfStream <> True

    ' Split line into array, comma delim
	    linearray = split(filenm.readline, ",")
    ' Current date is the first of the array
	    linedate  = datevalue(linearray(0))

	    If linedate = sotw Then
        printweek = 5
	    End If
      If printweek <> 0 Then 
        wscript.echo linedate
        printweek = printweek - 1
      End If 
	  Loop
	  filenm.close
    Set filenm = Nothing

