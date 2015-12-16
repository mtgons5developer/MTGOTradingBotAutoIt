
Func _YouGetConfigFinal()

If PixelGetColor(225, 65) = 15452028 Then
	MouseMove(225, 65, 0)
	Sleep(500)
	If WinExists($TRADEWINDOW,'') Then MouseClickDrag("left", 225, 65, 316, 65, 60)
	Sleep(500)
EndIf

EndFunc
