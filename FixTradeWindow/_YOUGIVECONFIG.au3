
Func _YOUGIVECONFIG()
If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGIVECONFIG Start")

If WinExists($NOT_ON_LIST, '') Then
	WinClose($NOT_ON_LIST)
	Sleep(2000)
EndIf

$ii = 0
$i = 0

If PixelGetColor(687, 512) = 15452028 Then

	MouseMove(687, 512, 0)
	Sleep(500)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 687, 512, 777, 512, 60)
	Sleep(500)

ElseIf PixelGetColor(460, 470) = 11776947  And WinExists($TRADEWINDOW,'') Then

While 1
	$i += 1
	While PixelGetColor(912, 482) <> 15452028
		MouseClick('left', 919, 512, 1, 2)
		Sleep(50)
		_MTGO_POPUP()
		If $INTRADE = "OPEN" Then ExitLoop
	WEnd

	$x = 922
	$y = 913

	$1 = 204
	$2 = 260
	$3 = 288
	$4 = 345
	$5 = 401
	$6 = 429
	$7 = 485

	If PixelGetColor($x, $1) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $1, 1)
		Sleep(100)
		MouseClick('left', $x, $1, 1, 1)
	ElseIf PixelGetColor($x, $2) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $2, 1)
		Sleep(100)
		MouseClick('left', $x, $2, 1, 1)
	ElseIf PixelGetColor($x, $3) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $3, 1)
		Sleep(100)
		MouseClick('left', $x, $3, 1, 1)
	ElseIf PixelGetColor($x, $4) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $4, 1)
		Sleep(100)
		MouseClick('left', $x, $4, 1, 1)
	ElseIf PixelGetColor($x, $5) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $5, 1)
		Sleep(100)
		MouseClick('left', $x, $5, 1, 1)
	ElseIf PixelGetColor($x, $6) = 16777215 And PixelGetColor($y, 479) = 15452028 Then
		MouseMove($x, $6, 1)
		Sleep(100)
		MouseClick('left', $x, $6, 1, 1)
		$ii = 1
	ElseIf PixelGetColor($x, $7) <> 16777215 And $ii = 1 And PixelGetColor($y, 479) = 15452028 Then
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

	MsgBox(0,'Error_YouGetConfig', "Postition")

EndIf

If $ii = 0 And PixelGetColor(687, 512) = 15452028 Then
	MouseMove(687, 512, 0)
	Sleep(500)
	If WinExists($CHATWINDOW,'') Then MouseClickDrag("left", 687, 512, 777, 512, 60)
	Sleep(500)
EndIf

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGIVECONFIG End")
EndFunc
