' https://stackoverflow.com/questions/774175/show-a-popup-message-box-from-a-windows-batch-file

	Set objArgs = WScript.Arguments
	messageText = objArgs(0)
	MsgBox messageText

