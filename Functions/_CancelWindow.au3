
Func _CancelWindow()

		local $windows = WinList()
		For $i = 0 to $windows[0][0]
			If StringInStr($windows[$i][0], "Trade Canceled") Then
				$WINDOW = $windows[$i][0]
				WinClose($WINDOW)
				$INTRADE = "OPEN"
			EndIf
		Next

EndFunc
