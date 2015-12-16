
Func _CONSOLEWRITE($msg)
	TOOLTIP($msg,0,0)
	IF $CONSOLE = "YES" THEN ConsoleWrite($msg)
	IF $CONSOLE = "YES" THEN ConsoleWrite(@LF)
EndFunc

