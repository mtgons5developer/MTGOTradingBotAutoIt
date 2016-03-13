;~ #include <File.au3>
;~ #include <var.au3>

Func _Next()

	;Local $N
	$i = 0
	While PixelChecksum(14, 36, 130, 47) <> 3170630637 ;Will detect if Final Trade window appears.
		If $CONSOLE = 'YES' Then _CONSOLEWRITE("Waiting for Final Trade window...")
		$i += 1
		Sleep(500)
		_HandleWindows(0)
		If $INTRADE = "OPEN" Then Return
		;If $i = 5 Then $N = PixelChecksum(14, 36, 130, 47)
	WEnd

	SendMessage("... is processing final transaction. Please wait...")

	If PixelChecksum(16, 87, 456, 142) <> 2831951230 Then _YouGetConfigFinal() ;Set Filters

	If PixelChecksum(479, 87, 914, 156) <> 1316940226 Then _YouGiveConfigFinal() ;Set Filters

	If PixelChecksum(16, 87, 456, 142) <> 2831951230 Then _2ndYouGET2() ;Double Checks items

	If PixelChecksum(479, 87, 914, 156) <> 1316940226 Then _2ndYouGIVE2() ;Double Checks items

	If Round($YOUGETPRICE_FINAL1, 3) = Round($YOUGETPRICE_FINAL2,3) And $YOUGIVEPRICE_FINAL1 = $YOUGIVEPRICE_FINAL2 Then ;If value are correct.
		;MsgBox(0,'','')
		While 1
			If $CONSOLE = 'YES' Then _CONSOLEWRITE("Checking if other Bots are busy.")
			_HandleWindows(0)
			If $INTRADE = "OPEN" Then Return

			Q_SELECT("bot_queue", "botname", 'MTGONS5','status')
			$bot_queue = $return_value
			Q_SELECT("bot_queue", "botname", 'MTGONS5','botname')
			$botname = $return_value
			If $botname = 'MTGONS5' And $bot_queue = "OPEN" Then
				Q_SELECT("bot_queue", "status", 'BUSY','status')
				$bot_queue = $return_value
				Q_SELECT("bot_queue", "status", 'BUSY','botname')
				$botname = $return_value
				If $DEBUG = "YES" Then ToolTip($botname & ' ' & $bot_queue,0,0)
			Else
				If $CONSOLE = 'YES' Then _CONSOLEWRITE("Checking prices from DB")
				_UpdateQ_BUSY()
				_ComparePriceList()
				ExitLoop
			EndIf
			Sleep(1000)
		WEnd

		If $FINAL_CONFIRM = "YES" Then
			SendMessage("Please Confirm Trade")
			_ConfirmTrade()
		EndIf

	Else
		SendMessage($YOUGETPRICE_FINAL1 & " $YOUGETPRICE_FINAL1")
		SendMessage($YOUGETPRICE_FINAL2 & " $YOUGETPRICE_FINAL2")
		SendMessage($YOUGIVEPRICE_FINAL1 & " $YOUGIVEPRICE_FINAL1")
		SendMessage($YOUGIVEPRICE_FINAL2 & " $YOUGIVEPRICE_FINAL2")
		SendMessage("There was a problem with the transaction please re-open trade.")
		_CancelTrade()
	EndIf

	$i = 0
	While WinExists($VISITORWINDOW)
		If $CONSOLE = 'YES' Then _CONSOLEWRITE("WAITING FOR CONFIRM")
		_HandleWindows(0)
		Sleep(1000)
		$i += 1
		If $INTRADE = "OPEN" Then Return

		If $i = 15 Then SendMessage("/me You have 50 seconds to complete this trade. Please click Confirm Trade.")
		If $i = 25 Then SendMessage("/me You have 40 seconds to complete this trade. Please click Confirm Trade.")
		If $i = 35 Then SendMessage("/me You have 30 seconds to complete this trade. Please click Confirm Trade.")
		If $i = 45 Then SendMessage("/me You have 20 seconds to complete this trade. Please click Confirm Trade.")
		If $i = 55 Then SendMessage("/me You have 10 seconds to complete this trade. Please click Confirm Trade.")

		If $i = 60 Then
			SendMessage("/me There was a problem with the Transaction please try again. "); $SUPPORT)
			Sleep(3000)
			;ProcessClose($MTGOPROCESS)
			;Run($NS5PROCESS)
			;Exit
		EndIf

	WEnd

EndFunc

Func _ConfirmTrade()

$x = 624
$y = 686

;~ $search = _ImageSearchArea("INI\Submit.bmp",0,624, 711, 739, 711,$x,$y,0)

;~ While $search = 1
;~ 	If $DEBUG = "YES" Then ToolTip("Confirm Trade",0,0)
;~ 	MouseClick('left', 678, 698, 1, 2)
;~ 	Sleep(500)
;~ 	MouseMove(0,0,0)
;~ WEnd


EndFunc


Func _CancelTrade()

$x = 619
$y = 663

;~ $search = _ImageSearchArea("INI\CancelTrade.bmp",0,619, 663, 927, 713,$x,$y,0)

;~ While $search = 1
;~ 	If $DEBUG = "YES" Then ToolTip("Cancel Trade",0,0)
;~ 	MouseClick('left', 786, 698, 1, 2)
;~ 	Sleep(500)
;~ 	MouseMove(0,0,0)
;~ 	If Not WinExists($VISITORWINDOW) Then ExitLoop
;~ WEnd



EndFunc

