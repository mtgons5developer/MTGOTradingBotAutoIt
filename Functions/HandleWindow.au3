
Func _HANDLEWINDOWS($CLOSE)

local $windows = WinList()

If $CLOSE = 0 Or $CLOSE = 1 Then

	For $i = 0 to $windows[0][0]
		If StringInStr($windows[$i][0], "(1-on-1):") Then
			$CHALLENGE = $windows[$i][0]
			_CHALLENGEWINDOW()
		ElseIf StringInStr($windows[$i][0], $TRADE_CANCELED) Then
			_TRADECANCEL()
		ElseIf StringInStr($windows[$i][0], $SYSTEM) Then
			_SYSTEM()
		ElseIf StringInStr($windows[$i][0], $TRADE_COMPLETED) Then
			_TRADECOMPLETED()
		ElseIf StringInStr($windows[$i][0], $MAIN_NAV) Then
			WinClose("MainNavigation")
		ElseIf StringInStr($windows[$i][0], $LOST) Then
			_CON_LOST()
		ElseIf StringInStr($windows[$i][0], $ADDED_TO_COLLECTION) Then
			_ADDED_TO_COLLECTION()
		ElseIf StringInStr($windows[$i][0], $WAITING) Then
			_WAITING()
		ElseIf StringInStr($windows[$i][0], $TRADEREQUEST) Then
			_TRADE_REQUEST()
		ElseIf StringInStr($windows[$i][0], "Trade: ") Then
			$INTRADE = "BUSY"
		ElseIf StringInStr($windows[$i][0], "Chat: ") Then
			WinClose($windows[$i][0])
		ElseIf StringInStr($windows[$i][0], "Sponsored session") Then
			WinClose($windows[$i][0])
		ElseIf StringInStr($windows[$i][0], "Error") Then
			_ERROR()
		ElseIf StringInStr($windows[$i][0], "Sponsored Session") Then
			WinClose($windows[$i][0])
		EndIf
	Next

	If Not WinExists($BOTTITLE) Then
		MsgBox(0,$BOTTITLE, "Missing MTGO Client", 5)
		_UpdateQ_OPEN()
		ProcessClose("MTGO.exe")
		Run("VycerBuy.exe")
		Exit
	EndIf

EndIf

EndFunc



Func _CHALLENGEWINDOW()

		WinClose("Challenge Details")

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


Func _TRADECANCEL()

While WinExists($TRADE_CANCELED)
	If $DEBUG = "YES" Then Tooltip($TRADE_CANCELED,0,0)
	sleep(100)
	WinClose($TRADE_CANCELED)
Wend

$INTRADE = "OPEN"
$avArray = ""
_UpdateQ_OPEN()
$BOARD_STATUS = "BUSY"

EndFunc


Func _SYSTEM()

While WinExists($SYSTEM)
	If $DEBUG = "YES" Then Tooltip($SYSTEM,0,0)
	Send("{ENTER}")
	Sleep(500)
	sleep(100)
	WinClose($SYSTEM)
Wend


EndFunc


Func _TRADECOMPLETED()

While WinExists("Trade Completed")
	If $DEBUG = "YES" Then Tooltip("Trade Completed",0,0)
	sleep(100)
	WinClose("Trade Completed")
Wend

_RecordTrade()
_UpdateQ_OPEN()
$INTRADE = "OPEN"
$BOARD_STATUS = "BUSY"

EndFunc

Func _CON_LOST()

_UpdateQ_OPEN()
ProcessClose("MTGO.exe")
Run("VycerBuy.exe")
Exit

EndFunc


Func _ADDED_TO_COLLECTION()


While WinExists($ADDED_TO_COLLECTION)
	Sleep(100)
	WinClose($ADDED_TO_COLLECTION)
Wend

_RecordTrade()
_UpdateQ_OPEN()
$INTRADE = "OPEN"
$BOARD_STATUS = "BUSY"

EndFunc


Func _WAITING()

Sleep(100)
Send("{Esc}")
Sleep(100)
WinClose($WAITING)

EndFunc



Func _TRADE_REQUEST()

WinActivate($TRADEREQUEST)
Sleep(100)
Send("{ENTER}")
Sleep(500)
While WinExists($TRADEREQUEST)
	WinActivate($TRADEREQUEST)
	Sleep(100)
	Send("{ENTER}")
WEnd

$INTRADE = "BUSY"

EndFunc


Func _ERROR()

	$date = @YEAR & "_" & @MON & "_" & @MDAY
	$time = @HOUR & "_" & @MIN

	_ScreenCapture_Capture("Error\" & $date & "_" & $time & ".bmp", 0,0,960,720, False)
	Sleep(1000)
	ProcessClose("MTGO.exe")
	Run("VycerBuy.exe")
	Exit
EndFunc