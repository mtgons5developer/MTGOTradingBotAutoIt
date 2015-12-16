
Func _CHALLENGEWINDOW()

		local $windows = WinList()
		For $i = 0 to $windows[0][0]
			If StringInStr($windows[$i][0], "(1-on-1):") Then
				$CHALLENGE = $windows[$i][0]
				WinClose("Challenge Details")
			EndIf
		Next

		While 1
			WinClose($CHALLENGE)
			Sleep(1000)
			If WinExists("Leave Event?") Then WinActivate("Leave Event?")
			Sleep(500)
			$i = 0
			For $i = 0 to 3
				Send(@TAB)
				Sleep(10)
			Next
			Sleep(50)
			Send("{ENTER}")
			If Not WinExists($CHALLENGE) Then ExitLoop
		WEnd

EndFunc
