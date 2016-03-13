
Func _AutoLogin()

If ProcessExists("MTGO.exe") Then ProcessClose("MTGO.exe")

Run(@comspec & " /c cd " & chr(34) & @DesktopDir & "\" & chr(34) & " && start " & "v4.appref-ms")

While 1

	Local $windows = WinList()
	For $i = 0 to $windows[0][0]
		If StringInStr($windows[$i][0], "Magic: ") Then ;Will search the MTGO Client
			$BOTTITLE = $windows[$i][0]
			WinActivate($BOTTITLE,'')
			Sleep(1000)
			WinMove($BOTTITLE, '', 0, 0)
		EndIf
	Next

	If WinExists("Cannot Start Application", '') Then ;If connection or server is down this window will appear.
		WinClose('Cannot Start Application','')
		Sleep(5000)
		Run(@comspec & " /c cd " & chr(34) & @DesktopDir & "\" & chr(34) & " && start " & "v4.appref-ms")
	ElseIf WinExists($BOTTITLE,'') Then
		WinWait("Launching Application", "", 5)
		WinActivate($BOTTITLE,'')
		Sleep(1000)
		WinMove($BOTTITLE, '', 0, 0)
		ExitLoop
	EndIf

	Sleep(5000)

WEnd

While PixelGetColor(843, 431) <> 12883278 ;If MTGO Client finished loading.
	Sleep(1000)
	If ProcessExists("MTGO.exe") Then
		WinActivate($BOTTITLE)
		WinMove($BOTTITLE, '', 0, 0)
		Sleep(1000)
	EndIf
WEnd

$N1 = PixelChecksum(560, 261, 878, 314)

_USER() ;Login detauls.

$i = 0
While 1

	$N2 = PixelChecksum(560, 261, 878, 314)

	If WinExists("Warning", '') Then ;If connection can't be established/Server is down. Login details is wrong. This window will appear.
		WinClose("Warning")
		Sleep(2000)
		$N1 = PixelChecksum(560, 261, 878, 314)
		_USER()
		$i += 1
	EndIf

	If $N1 <> $N2 Then
		If $DEBUG = "YES" Then ToolTip("Loading", 0, 0)
	Else
		If $DEBUG = "YES" Then ToolTip("...", 0, 0)
	EndIf

	If PixelChecksum(68, 48, 116, 62) = 288512796 Or PixelGetColor(203, 9) = 16777215 Then ExitLoop ;If Login was successfull
	Sleep(1000)

WEnd

EndFunc



Func _USER()

MouseClick('left', 825, 443, 1, 1)
Sleep(500)
_SAP()
Sleep(500)
Send("{DEL}")

SendMessage2(720, 441, $ourname)
Sleep(2000)
$PASSWORD = IniRead("Settings.ini", "LOGIN", "PASSWORD", "PASSWORD")
SendMessage2(720, 471, $PASSWORD)
Send("{ENTER}")
ClipPut("")

EndFunc

Func _DELSEL($x, $y)

MouseClick('left', $x, $y, 1, 1)
Sleep(500)
_SAP()
Sleep(500)
Send("{DEL}")

EndFunc


