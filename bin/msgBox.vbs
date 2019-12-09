
' Useful if a message box is required in
' a batch script; just call this

	Set objArgs = WScript.Arguments
	messageText = objArgs(0)
	MsgBox messageText

