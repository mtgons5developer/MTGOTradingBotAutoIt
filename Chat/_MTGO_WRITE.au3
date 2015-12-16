
Func _MTGO_WRITE($msg, $x = -1 , $y = -1 )
	
	ClipPut($msg)
	Sleep(5)
	If Not ( $x == -1 And $y == -1 ) Then
		MouseClick("left", $x, $y, 1, 1)
		Sleep($MTGOINPUTDELAY)
	EndIf
	_PASTE()
	sleep(50)
	_ENTER()
	sleep(50)
	_ENTER()

EndFunc
