
Func _SENDPM()

_CONSOLEWRITE("_SENDPM")

If PixelGetColor(410, 530) == 6736896 Then ;Checks if user is online for private messaging.

	While Not WinExists("Chat: " & $user)
		MouseClick("left", 391, 510, 2, 5)
		Sleep(2000)
	WEnd

EndIf


_MTGO_WRITE("Type message here.", $x, $y)
WinClose("Chat: " & $user)


EndFunc

