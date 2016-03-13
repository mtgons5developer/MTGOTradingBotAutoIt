


Func _YOUGETCONFIG() ;This will Set the Trade Filters for the items being taken.
If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETCONFIG Start")

If WinExists($NOT_ON_LIST) Then
	$i = 0
	While WinExists($NOT_ON_LIST)
		If $DEBUG = "YES" Then Tooltip($NOT_ON_LIST,0,0)
		$i += 1
		sleep(500)
		WinClose($NOT_ON_LIST)
		If $i = 5 Then ExitLoop
	Wend

EndIf

If WinExists($LIMITREACHED) Then
	$i = 0
	While WinExists($LIMITREACHED)
		If $DEBUG = "YES" Then Tooltip($LIMITREACHED,0,0)
		$i += 1
		sleep(500)
		WinClose($LIMITREACHED)
		If $i = 5 Then ExitLoop
	Wend

EndIf

If PixelGetColor(225, 514) = 15452028 Then

	MouseMove(225, 514, 0)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)

Else


$i = 0
While PixelGetColor(460, 470) <> 11776947  And WinExists($VISITORWINDOW,'')
	$i += 1
	Sleep(1000)
	If $i = 5 Then ExitLoop
WEnd

$ii = 0
$i = 0

If PixelGetColor(225, 514) = 15452028 Then

	MouseMove(225, 514, 0)
	Sleep(500)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)
	Sleep(500)

ElseIf PixelGetColor(460, 470) = 11776947  And WinExists($VISITORWINDOW,'') Then

	While WinExists($VISITORWINDOW, '')
		$i += 1
		While PixelGetColor(450, 488) <> 15452028
			MouseClick('left', 455, 513, 1, 2)
			Sleep(50)
			_HANDLEWINDOWS(0)
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

	If PixelGetColor($x, $1) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Color
		MouseMove($x, $1, 1)
		Sleep(100)
		MouseClick('left', $x, $1, 1, 1)
	ElseIf PixelGetColor($x, $2) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Mana Cost
		MouseMove($x, $2, 1)
		Sleep(100)
		MouseClick('left', $x, $2, 1, 1)
	ElseIf PixelGetColor($x, $3) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Type
		MouseMove($x, $3, 1)
		Sleep(100)
		MouseClick('left', $x, $3, 1, 1)
	ElseIf PixelGetColor($x, $4) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Power/Toughness
		MouseMove($x, $4, 1)
		Sleep(100)
		MouseClick('left', $x, $4, 1, 1)
	ElseIf PixelGetColor($x, $5) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Rarity
		MouseMove($x, $5, 1)
		Sleep(100)
		MouseClick('left', $x, $5, 1, 1)
	ElseIf PixelGetColor($x, $6) = 16777215 And PixelGetColor(451, 479) = 15452028 Then ;Text
		MouseMove($x, $6, 1)
		Sleep(100)
		MouseClick('left', $x, $6, 1, 1)
		$ii = 1
	ElseIf PixelGetColor($x, $7) <> 16777215 And $ii = 1 And PixelGetColor(451, 479) = 15452028 Then ;Collector #
		MouseMove($x, $7, 1)
		Sleep(100)
		MouseClick('left', $x, $7, 1, 1)
		$ii = 0
		ExitLoop
	EndIf
	Sleep(50)
	If $i = 10 Then ExitLoop
WEnd

ElseIf PixelGetColor(460, 464) <> 11776947  And WinExists($VISITORWINDOW,'') Then

	If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
	If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)
	MsgBox(0,'Error_YouGetConfig', "Position", 10)
	;If WinExists("Select Deck(s)", "") Then WinClose("Select Deck(s)", "")
	;WinClose($VISITORWINDOW)

EndIf

If $ii = 0 And PixelGetColor(225, 514) = 15452028 Then
	MouseMove(225, 514, 0)
	Sleep(500)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 225, 514, 315, 514, 60)
	Sleep(500)
EndIf

If WinExists($VISITORWINDOW,'') And PixelGetColor(447, 519) = 15452028 And PixelGetColor(448, 509) = 6649727 And PixelGetColor(449, 519) = 15452028 Then

Else
	SendMessage("Please re-open trade, there was a problem loading MTGO client.")
	WinClose($VISITORWINDOW)
EndIf

EndIf

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETCONFIG End")

EndFunc


;================================


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
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 687, 512, 777, 512, 60)
	Sleep(500)

ElseIf PixelGetColor(460, 470) = 11776947  And WinExists($VISITORWINDOW,'') Then

While 1
	$i += 1
	While PixelGetColor(912, 482) <> 15452028
		MouseClick('left', 919, 512, 1, 2)
		Sleep(50)
		_HANDLEWINDOWS(0)
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

ElseIf PixelGetColor(460, 464) <> 11776947  And WinExists($VISITORWINDOW,'') Then

	If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
	If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)
	MsgBox(0,'Error_YouGetConfig', "Postition", 10)


EndIf

If $ii = 0 And PixelGetColor(687, 512) = 15452028 Then
	MouseMove(687, 512, 0)
	Sleep(500)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 687, 512, 777, 512, 60)
	Sleep(500)
EndIf

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGIVECONFIG End")
EndFunc

Func _YouGetConfigFinal()

If PixelGetColor(225, 65) = 15452028 Then
	MouseMove(225, 65, 0)
	Sleep(500)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 225, 65, 316, 65, 60)
	Sleep(500)
EndIf

EndFunc



Func _YouGiveConfigFinal()

If PixelGetColor(687, 65) = 15452028 Then
	MouseMove(687, 65, 0)
	Sleep(500)
	If WinExists($VISITORWINDOW,'') Then MouseClickDrag("left", 687, 65, 778, 65, 60)
	Sleep(500)
EndIf

EndFunc







