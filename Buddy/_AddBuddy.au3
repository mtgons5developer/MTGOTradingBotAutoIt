
Func _AddBuddy()

	_HomeTab()

	_CONSOLEWRITE("_AddBuddy")

	While Not WinExists("Add Buddy")
		MouseClick("left", 287, 507, 1, 5)
		Sleep(1000)
	WEnd

	ClipPut($user)
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")

	While WinExists("Add Buddy")
		Sleep(1000)
	WEnd

EndFunc

