
Func _OPENTOAST()

	If WinExists("ToastView") Then
		WinActivate("ToastView")
		Sleep($MTGOINPUTDELAY)
		For $i = 0 to 4
			Send(@TAB)
			Sleep(10)
		Next
		_Enter()
		Sleep($MTGOINPUTDELAY)
	EndIf

EndFunc
