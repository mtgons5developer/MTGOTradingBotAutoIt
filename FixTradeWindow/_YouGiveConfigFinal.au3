
Func _YouGiveConfigFinal()

If PixelGetColor(687, 65) = 15452028 Then
	MouseMove(687, 65, 0)
	Sleep(500)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 687, 65, 778, 65, 60)
	Sleep(500)
EndIf

EndFunc
