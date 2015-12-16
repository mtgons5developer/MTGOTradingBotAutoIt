
Func _MTGO_POPUP($depth = 0)
;	$NOTFOUND = "Some Cards Not Found"
;	$LIMIT = "Trade Limit Reached"
	$TRADEREQUEST = 'Trade Request'

	;Check if MTGO Client is at x = 0 and y = 0 coordinates.
	;WinMove($MTGOWINDOW, "", 0, 0)

	If WinExists("Trade Request") Then
		WinActivate($TRADEREQUEST)
		While WinExists($TRADEREQUEST)
			WinActivate($TRADEREQUEST)
			Sleep(100)
			Send("{ENTER}")
		WEnd
		$STATUS = 'trade'
		;If $BOT_ACCOUNT.Fields("role").Value == "admin" Then WinClose("Trade Request")
	ElseIf WinExists("System Alert") Then
		WinClose("System Alert")
		Sleep($MTGOINPUTDELAY)
	ElseIf WinExists("Waiting for Response") Then
		Sleep(1000)
		if $depth == 60  Then
			_CONSOLEWRITE("Waiting for Response")
			;_LOGOUT()
		else
			_MTGO_POPUP($depth + 1)
		EndIf
	ElseIf WinExists("Connection Lost") Then
		_CONSOLEWRITE("Connection Lost")
		;_LOGOUT()
	EndIf

	If WinExists("Added to your Collection:") Then ;trade completion
		While WinExists("Added to your Collection:")
			Tooltip("Added to your Collection:",0,0)
			sleep(100)
			WinClose("Added to your Collection:")
		Wend
		Tooltip("")
	EndIf

	If WinExists("Trade Completed") Then  ;trade completion
		While WinExists("Trade Completed")
			Tooltip("Trade Completed",0,0)
			sleep(100)
			WinClose("Trade Completed")
		Wend
		Tooltip("")
	EndIf

	If WinExists("Add Buddy") Then _AddBuddyWindow()

	If WinExists("Challenge Details") Then _CHALLENGEWINDOW()

	If WinExists("Trade Canceled") Then _CancelWindow()

EndFunc
