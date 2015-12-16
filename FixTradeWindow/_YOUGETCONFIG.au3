
Func _YOUGETCONFIG()
If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETCONFIG Start")
If WinExists($NOT_ON_LIST, '') Then
	WinClose($NOT_ON_LIST)
	Sleep(500)
EndIf

If PixelGetColor(225, 514) = 15452028 Then

	MouseMove(225, 514, 0)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)

Else


$i = 0
While PixelGetColor(460, 470) <> 11776947  And WinExists($TRADEWINDOW,'')
	$i += 1
	Sleep(1000)
	If $i = 5 Then ExitLoop
WEnd

$ii = 0
$i = 0

If PixelGetColor(225, 514) = 15452028 Then

	MouseMove(225, 514, 0)
	Sleep(500)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)
	Sleep(500)

ElseIf PixelGetColor(460, 470) = 11776947  And WinExists($TRADEWINDOW,'') Then

	While WinExists($TRADEWINDOW, '')
		$i += 1
		While PixelGetColor(450, 488) <> 15452028
			MouseClick('left', 455, 513, 1, 2)
			Sleep(50)
			_MTGO_POPUP()
			If $INTRADE = "OPEN" Then ExitLoop
		WEnd

	$x = 460

	$1 = 204
	$2 = 260
	$3 = 288
	$4 = 345
	$5 = 401
	$6 = 429
	$7 = 485

	If PixelGetColor($x, $1) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $1, 1)
		Sleep(100)
		MouseClick('left', $x, $1, 1, 1)
	ElseIf PixelGetColor($x, $2) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $2, 1)
		Sleep(100)
		MouseClick('left', $x, $2, 1, 1)
	ElseIf PixelGetColor($x, $3) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $3, 1)
		Sleep(100)
		MouseClick('left', $x, $3, 1, 1)
	ElseIf PixelGetColor($x, $4) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $4, 1)
		Sleep(100)
		MouseClick('left', $x, $4, 1, 1)
	ElseIf PixelGetColor($x, $5) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $5, 1)
		Sleep(100)
		MouseClick('left', $x, $5, 1, 1)
	ElseIf PixelGetColor($x, $6) = 16777215 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $6, 1)
		Sleep(100)
		MouseClick('left', $x, $6, 1, 1)
		$ii = 1
	ElseIf PixelGetColor($x, $7) <> 16777215 And $ii = 1 And PixelGetColor(451, 479) = 15452028 Then
		MouseMove($x, $7, 1)
		Sleep(100)
		MouseClick('left', $x, $7, 1, 1)
		$ii = 0
		ExitLoop
	EndIf
	Sleep(50)
	If $i = 10 Then ExitLoop
WEnd

ElseIf PixelGetColor(460, 464) <> 11776947  And WinExists($TRADEWINDOW,'') Then

	MsgBox(0,'Error_YouGetConfig', "Position")
	;If WinExists("Select Deck(s)", "") Then WinClose("Select Deck(s)", "")
	;WinClose($VISITORWINDOW)

EndIf

If $ii = 0 And PixelGetColor(225, 514) = 15452028 Then
	MouseMove(225, 514, 0)
	Sleep(500)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)
	Sleep(500)
EndIf

If WinExists($TRADEWINDOW,'') And PixelGetColor(447, 519) = 15452028 And PixelGetColor(448, 509) = 6649727 And PixelGetColor(449, 519) = 15452028 Then

Else
	_MTGO_WRITE("Please re-open trade, there was a problem loading MTGO client.", $x, $y)
	WinClose($CHATWINDOW)
EndIf

EndIf

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETCONFIG End")

EndFunc
