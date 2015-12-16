
Func _AddBuddyWindow()

		local $windows = WinList()
		For $i = 0 to $windows[0][0]
			If StringInStr($windows[$i][0], "Add Buddy") Then
				$BUDDY = $windows[$i][0]
				WinClose($BUDDY)
			EndIf
		Next

EndFunc
