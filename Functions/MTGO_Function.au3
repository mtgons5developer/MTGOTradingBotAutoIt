
Func _BOARD_CONVERT()

	Local $aRecords, $CARDNAMEB

	$POST = IniRead($INIFILE, "BOARDS", "BOARDS", "")

	$TT2 = FileOpen("PU.ini", 2)
	FileWriteLine($TT2, "[PU]")

	$NN = StringReplace($POST, ">", @CRLF)
	$NN = StringReplace($NN, "#", " (")
	$NN = StringReplace($NN, "=", ")=")

	FileWriteLine($TT2, $NN)
	FileClose($TT2)

	If Not _FileReadToArray("PU.ini", $aRecords) Then
		MsgBox(4096, "Error", " Error reading log to Array  error:" & @error)
		Exit
	EndIf

	$SYMBOL = ">"

	For $x = 2 To $aRecords[0]

		$aRecords1 = StringInStr($aRecords[$x], "=")
		$NAME = StringLeft($aRecords[$x], $aRecords1 - 1)

		$PRICETXT = IniRead($PRICEINI, "CARDS", $NAME, "0,0,999,999")
		$PARRAY1 = StringSplit($PRICETXT, ",")
		$PRICEB = Round($PARRAY1[1], 2)

		$NAME = StringReplace($NAME, " (ORI)", "") ;Removes the SETCODE
		$CARDNAMEB = $CARDNAMEB & $NAME & "|" & $PRICEB & "|" & $SYMBOL

	Next

	IniWrite($INIFILE, "BOARDS", "POST", " BUYING " & $CARDNAMEB)

EndFunc


Func _MsgBoardBUSY()

WinActivate($BOTTITLE)
Sleep(500)

If WinExists($VISITORWINDOW) Then

	$x = 596 ;Coordinates for _the messages on MTGO_WRITE()
	$y = 654

	If $DEBUG = "YES" Then ToolTip("Waiting for Post...",0,0)
	_DEL_ALL(418, 598) ;Deletes all old messages from boards.
	_MTGO_WRITE('[sEventTicket] [sLifeHeart][sEventTicket]BUSY[sEventTicket] [sLifeHeart][sEventTicket]' & $message, 482, 600) ;Replace the old messages from boards.
	ClipPut('') ;empties the clipboard.

;~ 	While WinExists($VISITORWINDOW)
;~ 		$search = _ImageSearchArea("INI\Submit.bmp",0,601, 668, 710, 696,$x,$y,0) ;Checks if the Submit button has been pressed.
;~ 		MouseClick('left', 653, 679, 2, 2)
;~ 		If $search = 0 Then ExitLoop
;~ 		_HANDLEWINDOWS(0) ;Checks if there's other window showing or any changes to the client.
;~ 		Sleep(50)
;~ 	WEnd

EndIf

$BOARD_STATUS = "BUSY"

EndFunc

Func _MsgBoardOPEN()

$x = 596
$y = 654

If $DEBUG = "YES" Then ToolTip("Waiting for Post...",0,0)
_DEL_ALL(418, 598)
_MTGO_WRITE('[sAdept]OPEN[sAdept]' & $message, 482, 600)
ClipPut('')

;~ While 1
;~ 	$search = _ImageSearchArea("INI\Submit.bmp",0,601, 668, 710, 696,$x,$y,0)
;~ 	MouseClick('left', 653, 679, 2, 2)
;~ 	If $search = 0 Then ExitLoop
;~ 	_HANDLEWINDOWS(0)
;~ 	Sleep(50)
;~ WEnd

$BOARD_STATUS = "OPEN"
$message = ''

EndFunc



Func _MsgBoard()

$x = 596
$y = 654

;~ $i = 0
;~ While 1
;~ 	$i += 1
;~ 	If $DEBUG = "YES" Then ToolTip("Waiting for Post...",0,0)
;~ 	_TR() ;Closes Trade Request window if it does appear in background.
;~ 	$search = _ImageSearchArea("INI\Submit.bmp",0,601, 668, 710, 696,$x,$y,0)
;~ 	If $search = 1 Then _DEL_ALL(418, 598)
;~ 	If $message = '' Then $message = "My Post: Message Maximum 250 Characters."
;~ 	_MTGO_WRITE($message, 482, 600)
;~ 	ClipPut('')

;~ 	Sleep(5000)
;~ 	$search = _ImageSearchArea("INI\Submit.bmp",0,601, 668, 710, 696,$x,$y,0)
;~ 	If $search = 1 Then ExitLoop
;~ 	If $i = 5 Then ExitLoop
;~ 	_HANDLEWINDOWS(0)
;~ WEnd

;~ $i = 0
;~ While 1
;~ 	$i += 1
;~ 	If $DEBUG = "YES" Then ToolTip("Clicking Submit...",0,0)
;~ 	$search = _ImageSearchArea("INI\Remove Post.bmp",0,596, 654, 817, 696,$x,$y,0)
;~ 	_TR()
;~ 	Sleep(500)
;~ 	MouseClick('left', 653, 679, 1, 2)
;~ 	Sleep(500)
;~ 	MouseMove(0,0,0)
;~ 	If $search = 1 Then ExitLoop
;~ 	If $i = 5 Then ExitLoop
;~ 	_HANDLEWINDOWS(0)
;~ WEnd

;~ $i = 0
;~ While PixelGetColor(251, 178) <> 16776960
;~ 	$i += 1
	_TR()
	Sleep(1000)
	_CONSOLEWRITE("Sending botname to search")
	_MTGO_WRITE($ourname, 93, 102)
	ClipPut('')
;~ 	If $i = 5 Then ExitLoop
;~ 	_HANDLEWINDOWS(0)
;~ WEnd

;MsgBox(0,'','update_board')
Q_Update('message_board', 'update_board', '0', 'botname', $ourname)

EndFunc

;=================================================

Func _MsgBoard_Update()

If PixelGetColor(251, 178) <> 16776960 Then MouseClick('left', 653, 679, 2, 2)

Q_Select('message_board', 'botname', $ourname, 'update_board')
$update = $return_value

If $update = 1 Then
	$x = 596
	$y = 654
	Q_Select('message_board', 'botname', $ourname, 'message')
	$message = $return_value
;~ 	While 1
;~ 		If $DEBUG = "YES" Then ToolTip("Waiting for Post...",0,0)
;~ 		_TR()
;~ 		_DEL_ALL(418, 598)
;~ 		_MTGO_WRITE($message, 482, 600)
;~ 		ClipPut('')
;~ 		Sleep(2000)
;~ 		$search = _ImageSearchArea("INI\Submit.bmp",0,601, 668, 710, 696,$x,$y,0)
;~ 		If $search = 1 Then ExitLoop
;~ 		_HANDLEWINDOWS(0)
;~ 	WEnd

;~ 	While 1
;~ 		If $DEBUG = "YES" Then ToolTip("Clicking Submit...",0,0)
;~ 		$search = _ImageSearchArea("INI\Remove Post.bmp",0,596, 654, 817, 696,$x,$y,0)
;~ 		_TR()
;~ 		Sleep(500)
;~ 		MouseClick('left', 653, 679, 1, 2)
;~ 		If $search = 1 Then ExitLoop
;~ 		_HANDLEWINDOWS(0)
;~ 	WEnd

EndIf


;MsgBox(0,'','update_board2')
Q_Update('message_board', 'update_board', '0', 'botname', $ourname)

EndFunc

Func _TradeTab()
	Local $N
	$i = 0
	While PixelChecksum(12, 127, 93, 140) <> $N ;3892515084
		If $CONSOLE = "YES" Then _CONSOLEWRITE("Trade Tab")
		$i += 1
		If WinExists($TRADEREQUEST) Then WinClose($TRADEREQUEST)
		Sleep(500)
		MouseClick("left", 530, 51, 1, 2)
		If $i = 5 Then $N = PixelChecksum(12, 127, 93, 140)

		If PixelChecksum(14, 542, 134, 554) <> 2138318137 Then ExitLoop
	WEnd

	;Waiting for Classifieds to appear.
	While PixelChecksum(241, 127, 297, 140) = 1283080449 ;Loading Posts
		If $CONSOLE = "YES" Then _CONSOLEWRITE("Loading Posts")
		If WinExists($TRADEREQUEST) Then WinClose($TRADEREQUEST)
		Sleep(1000)
		If PixelChecksum(13, 99, 72, 109) = 3304622309 Then ExitLoop
	WEnd


EndFunc

Func _TR()
	Sleep(100)
	If WinExists($TRADEREQUEST) Then Send("{Esc}")
EndFunc


Func _PM()

Local $AAA

$CONN.Open( $DB_CONNECT ) ;connects to db

$sQuery = "SELECT * FROM credits"
$result = $conn.Execute($sQuery)

$CREDIT = -1

With $result
While Not .EOF
	If $result.Fields("visitor").Value = $VISITOR Then $CREDIT = $result.Fields("credit").Value ;Search for the Visitor from DB.
	.movenext
WEnd
EndWith

$conn.Close

If $CREDIT = -1 Then
	Q_Insert5('credits','visitor','date',$VISITOR,@YEAR & "-" & @MON & "-" & @MDAY) ;Records the Visitor if not yet Registered.
	$CREDIT = 0
EndIf

SendMessage("/clear")
SendMessage("Welcome[sWiz]" & $VISITOR & " you have " & $CREDIT & " saved. [sWiz]Buy Mode Only.")
SendMessage("Loading please wait...")

EndFunc


Func _Cancel()

	If PixelChecksum(749, 692, 826, 702) = 977399560 Then MouseClick("left", 787, 697, 2, 2)

EndFunc

Func _CARDSINI()

Local $starttime = _Timer_Init()
Local $ZZ, $x

If Not _FileReadToArray($CARDINI, $ZZ) Then
	MsgBox(0,$CARDINI,"File Not Found", 1)
EndIf

For $x = 2 To $ZZ[0]
	;$CARDS_MEM = $CARDS_MEM & $ZZ[$x] & @CRLF
	_ArrayAdd($CARDS_MEM, $ZZ[$x])
Next
EndFunc


Func SendMessage($MSG)

If $DEBUG =  "NO" Then
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
EndIf

	If $MSG <> $LASTMESSAGE Then
		ClipPut($MSG)
		MouseClick("left", $x1, $y1, 1, 1)
		Sleep(50)
		Send("^v")
		Sleep(250)
		Send("{ENTER}")
	EndIf

	ClipPut("")
	$MSG = $LASTMESSAGE

EndFunc


Func _X()
	Exit
EndFunc


Func SendMessage2($x, $y, $MSG)

	Sleep(10)
	If $MSG <> $LASTMESSAGE Then
		Sleep(5)
		ClipPut($MSG)
		Sleep(50)
		MouseClick("left", $x, $Y, 1, 0)
		Sleep(50)
		Send("^v")
		Sleep(250)
		Send("{ENTER}")

	EndIf

	MouseMove(907, 527, 0)

	$MSG = $LASTMESSAGE

EndFunc



Func _SUP()

	;Goto the top card.
	Send("{CTRLDOWN}")
	Sleep(50)
	Send("{HOME}")
	Sleep(500)
	Send("{CTRLUP}")

EndFunc

Func _SAP()

	;Selects all items in preparation to be read by pixel.

	Sleep(500)
	Send("{CTRLDOWN}")
	Sleep(50)
	Send("{a}")
	Sleep(500)
	Send("{CTRLUP}")

EndFunc


Func _Pause()
	$PAUSED = Not $PAUSED

	While $PAUSED
		ToolTip("SmartBot is Paused", 0, 0)
		Sleep(1000)
	WEnd
	ToolTip("", 0, 0)
EndFunc   ;==>_Pause



Func _CONSOLEWRITE($msg)
	IF $CONSOLE = "YES" THEN TOOLTIP($msg,0,0)
EndFunc


Func _MTGO_WRITE($msg, $x = -1 , $y = -1 )
	;_MTGO_POPUP() ;disabled temporarily
	ClipPut($msg)
	Sleep(5)
	If Not ( $x == -1 And $y == -1 ) Then
		MouseClick("left", $x, $y, 2, 1)
		Sleep($MTGOINPUTDELAY)
	EndIf
	_PASTE()
	sleep(50)
	_ENTER()
	sleep(50)
	_ENTER()

EndFunc


Func _SENDPM()

If $CONSOLE = "YES" Then _CONSOLEWRITE("_SENDPM")

_MTGO_WRITE("Type message here.", $x, $y)

EndFunc

Func _SELECT_ALL()
	Send("{CTRLDOWN}")
	Sleep(10)
	Send("{a}")
	Sleep(10)
	Send("{CTRLUP}")
EndFunc

Func _PASTE()
	Send("^v")
EndFunc

Func _ENTER()
	Send("{ENTER}")
EndFunc


Func _DEL_ALL($x, $y)
	MouseClick('left', $x, $y, 2, 2)
	Send("{CTRLDOWN}")
	Sleep(10)
	Send("{a}")
	Sleep(10)
	Send("{CTRLUP}")
	Send("{DEL}")

EndFunc


