
Func _UNREAD_MESSAGE()

	$X = 858
	$Y = 225
	Sleep($MTGOINPUTDELAY)
	local $CHATWINDOW = Null
	local $windows = WinList()

	For $i = 0 to $windows[0][0]
		If StringInStr($windows[$i][0], "Chat:") Then
			$CHATWINDOW = $windows[$i][0]
			WinMove($CHATWINDOW, "", 0, 0, 960, 300)
		EndIf
	Next

	;return to main loop if no open chats
	If $CHATWINDOW == Null Then	Return
	WinActivate($CHATWINDOW)

	;store user
 	$user = StringLower(StringReplace($CHATWINDOW, "Chat: ", ""))
	_CONSOLEWRITE("chat from " & $user)

	;Check if account is registered
	$registered_user_count = ( _RESULT("SELECT COUNT(*) FROM Magic_Accounts WHERE lower(name) = lower('" & $user & "')")[1] )[0][0]
	_CONSOLEWRITE($registered_user_count & " associated accounts found.")

	If $registered_user_count == 0 Then
 		;No associated accounts
 		_MTGO_WRITE("/clear", $X, $Y)
 		_MTGO_WRITE("This MTGO Account has not been added to any DrawDiscard accounts.", $X, $Y)
 		_MTGO_WRITE("Visit the website http://drawdiscard.com:3000/ to add your account.", $X, $Y)
 	Else
		_CONSOLEWRITE("parsing PM")
		WinActivate($CHATWINDOW)
		Sleep($MTGOINPUTDELAY)
		MouseMove(943, 73, 2)
		MouseWheel("UP", 1)
		Sleep($MTGOINPUTDELAY)
		MouseWheel("DOWN", 2)
		Sleep($MTGOINPUTDELAY)
		$CHAT_MESSAGE_FROM_USER = _READPM()
		If $CHAT_MESSAGE_FROM_USER == "trade" Then
			If ( _RESULT("SELECT COUNT(*) FROM Trade_Queues WHERE NOT status = 'finished' AND lower(magic_account_name) = lower('" & $user & "')")[1] )[0][0] == 0 Then
				;add user to queue
				_CONSOLEWRITE("user added to queue")
				_EXECUTE("INSERT INTO Trade_Queues ( magic_account_name, status, created_at, updated_at ) VALUES ( '" & $user & "', 'new', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP) ")
				_EXECUTE("INSERT INTO Trade_Histories (trade_queue_id, status, bot_id, created_at, updated_at ) VALUES ( ( SELECT id FROM Trade_Queues WHERE magic_account_name = '" & $user & "' AND status = 'new' LIMIT 1 ), 'new', " & ($BOT_ACCOUNT[1])[0][0] & ", CURRENT_TIMESTAMP , CURRENT_TIMESTAMP ) ")
 				_MTGO_WRITE("/clear", $X, $Y)
 				_MTGO_WRITE("You have been added to the trade queue. A runner bot will contact you shortly.", $X, $Y)
 			Else
				;user already in queue
				_CONSOLEWRITE("user already in queue")
 				_MTGO_WRITE("/clear", $X, $Y)
 				_MTGO_WRITE("You are already in the trade queue.", $X, $Y)
 			Endif
 		ElseIf $CHAT_MESSAGE_FROM_USER == "cancel" Then
			;xxx cancel sql
 		Else
 			_MTGO_WRITE("/clear", $X, $Y)
 			_MTGO_WRITE("Please enter a valid command.", $X, $Y)
 		EndIf
 	EndIf
	WinClose($CHATWINDOW)


EndFunc

Func _READPM()

ClipPut("")
MouseClick('left', 453, 196, 1, 1)
Sleep(50)
Send("^c")
Sleep(50)

	If stringreplace(StringRight(ClipGet(), 7), @CRLF, "") = "trade" Then
		_CONSOLEWRITE('trade captured')
		return 'trade'
	ElseIf stringreplace(StringRight(ClipGet(), 8), @CRLF, "") = "cancel" Then
		_CONSOLEWRITE('cancel captured')
		return 'cancel'
	Else
		return ""
	EndIf

EndFunc


