
Func _AddBank()

	_HomeTab()

	_CONSOLEWRITE("_AddBank")

	While Not WinExists("Add Buddy")
		MouseClick("left", 287, 507, 1, 5)
		Sleep(1000)
	WEnd

	ClipPut($bank)
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")

	While WinExists("Add Buddy")
		Sleep(1000)
	WEnd

EndFunc
