' Reminder to take a break 
' from the screen, hourly run

  mesg=Array("Just please take a break.", _
             "Honestly, you've been working hard. You've earned a break.", _
	     "Get your eyes off the screen, ASAP.", _
	     "Stop looking at this screen rIGhT NoW")

  nummessages=Ubound(mesg)+1

  Randomize
  MsgBox mesg(Int((nummessages)*Rnd)),16,"Screen Break"
