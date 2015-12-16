
Func _DelBuddy()

_HomeTab()

_CONSOLEWRITE("_DelBuddy")

If PixelGetColor(392, 511) <> 15198440 Then

	While PixelGetColor(576, 520) <> 15452028
		_CONSOLEWRITE("Removing Buddy")
		MouseClick("right", 394, 512, 1)
		Sleep(2000)
	WEnd

	MouseMove(460, 603, 5)
	Sleep(1000)
	_ENTER()
	_CONSOLEWRITE("Done Removing Buddy")

EndIf

EndFunc
