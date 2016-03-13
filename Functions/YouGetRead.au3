;~ #include <Array.au3>
;~ #include <var.au3>
;~ #include <YG.au3>

;~ Global $LASTMESSAGE, $MSG, $Q1, $Q2, $Q3, $Q4, $x1, $y1

;~ Global $x1 = 1001
;~ Global $y1 = 652

;~ $PRICEINI = "Z:\Vycer\PRICES.ini"
;~ $CARDINI = "Z:\Vycer\INI\CARDS.ini"

;~ $VISITORWINDOW = 'Trade: JustinAlmeda'
;~ ;$VISITORWINDOW = 'Trade: CardBot4'
;~ WinActivate($VISITORWINDOW)
;~ Sleep(1000)

;~ Func _Cancel()

;~ 	If PixelChecksum(749, 692, 826, 702) = 977399560 Then MouseClick("left", 787, 697, 2, 2)

;~ EndFunc

;~ Func SendMessage($MSG)

;~ 	If $MSG <> $LASTMESSAGE Then
;~ 		ClipPut($MSG)
;~ 		MouseClick("left", $x1, $y1, 1, 1)
;~ 		Sleep(50)
;~ 		Send("^v")
;~ 		Sleep(250)
;~ 		Send("{ENTER}")
;~ 	EndIf

;~ 	ClipPut("")
;~ 	$MSG = $LASTMESSAGE

;~ EndFunc

;~ Func _SUP()
;~ 	; ALL LINES MUST GO ALL WHITE
;~ 	Send("{CTRLDOWN}")
;~ 	Sleep(50)
;~ 	Send("{HOME}")
;~ 	Sleep(500)
;~ 	Send("{CTRLUP}")

;~ EndFunc

;~ Func _SAP()

;~ Sleep(500)
;~ Send("{CTRLDOWN}")
;~ Sleep(50)
;~ Send("{a}")
;~ Sleep(500)
;~ Send("{CTRLUP}")

;~ EndFunc
;~ MouseClick("left", 482, 372, 1, 1)
;~ Sleep(1000)

;~ _YOUGETREAD()


Func _YOUGETREAD()

$TT = FileOpen("TT.ini", 2)

$YOUGETPRICE_FINALE = 0
$CONFIRM = 'NO'
$YOUGETPRICE_FINAL1 = 0
$YOUGETPRICE = 0
$YOUGETTOTAL = 0

;If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETREAD Start")
Local $CARDNAME, $YOUGETPRICE, $ITEMNUM, $xxx, $BUGKA, $YOUGETPRICE_TOTAL, $YOUGETTOTAL
Local $avArray[400]

$P1 = 62
$P3 = 262

$S1 = 322
$S3 = 347

$C1 = 384
$C3 = 441

$Q1 = 22
$Q3 = 43

$ITEMNUM = 0
$YOUGETPRICE = 0
$YOUGETPRICE_TOTAL = 0
$NOTFOUND = 0

$19 = 0
$85 = 529
$512 = 306

$i = 0

While PixelGetColor(361, 557) <> 16777215 ;Selects the 2nd Card from You Will Receive.
	$i += 1
	MouseClick("left", 361, 557, 1, 0)
	Sleep(500)
	If $i = 3 Then ExitLoop
WEnd

MouseMove(401, 483, 0)
_SUP() ;MTGO_Function.au3
_SAP();MTGO_Function.au3
Sleep(500)

;Local $starttime = _Timer_Init()

$LINE = 0
$x_x = 0

While WinExists($VISITORWINDOW)
;If $CONSOLE = 'YES' Then _CONSOLEWRITE($CARDNAME	)
	$N1 = PixelChecksum(15, 531, 440, 673)
	Sleep(50)
	$CARD1 = PixelGetColor(363, 534)
	$CARD2 = PixelGetColor(363, 553)
	$CARD3 = PixelGetColor(363, 572)
	$CARD4 = PixelGetColor(363, 591)
	$CARD5 = PixelGetColor(363, 610)
	$CARD6 = PixelGetColor(363, 629)
	$CARD7 = PixelGetColor(363, 648)
	$CARD8 = PixelGetColor(363, 667)

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD1 = 16777215  And $LINE = 0 And WinExists($VISITORWINDOW) Then

		;Coordinates
		$P2 = 528
		$P4 = 538
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4
		$LINE = 1

		;PixelChecksum($P1, $P2, $P3, $P4) = Returns the Pixel value of the Cardname
		;PixelChecksum($S1, $P2, $S3, $P4) = Returns the Pixel value of the Set
		;PixelChecksum($C1, $P2, $C3, $P4) = Returns the Pixel value of the Collector #

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND") ;Location of Pixel value of each item.
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1 ;Gives signal if an item is not being detected or does not have Pixel value.
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=") ;Writes the value of the item not being detected, found in TT.ini file.

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4) ;Records the value so there'll be no duplicates.

		If Not StringInStr($BUGKA, $CC) Then ;New items will be filtered here.

			_AmountYG() ;Reads the Qty. Pixel Value from 1-400.

			$ITEMNUM += 1 ;Gives the value for each unique item.

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0") ;Location of the prices.

			$PRICES = StringSplit($PRICE_TXT, ",") ;Selects the 'complete' prices for each item.

			$PRICE = $PRICES[1] ;Selects the 'exact' price/value for the item.

			$YOUGETTOTAL += $YG ;Calculates the total Qty. of each item.

			$YOUGETPRICE += Round($PRICE * $YG, 3) ;Calculates the Total Prices of all items rounded up to 3 decimal places.

			If $YG = 1 Then ;If item is equal to 1 only.
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then ;If item is greater than 1 only.
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4) ;Records the 1st copy of an item, so there'll be no duplicates.

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop ;If Trade Window or Trade has been canceled bot will exit this Function.

	If $CARD2 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 547
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD3 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 567
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 568) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")
			$x_x += 1
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then

			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD4 = 16777215 And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 586
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 587) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD5 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 605
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 606) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD6 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 624
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 625) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD7 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 643
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 644) = 4207668 Then $FOIL = "YES"

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf

			$xxx = $ITEMNUM

		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	;====================================================================================
	If $CARD8 = 16777215 And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 662
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)

		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		If $CARDNAME = "NOT FOUND" Then $NOTFOUND = 1
		If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			$x_x += 1
			_AmountYG()
			$ITEMNUM += 1
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,0,0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL += $YG
			$YOUGETPRICE += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $PRICE & "|"
				EndIf
			ElseIf $YG > 1 Then
				If $FOIL = "YES" Then
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & "(q) |" & $YG & "x" & $PRICE & "|"
				Else
					$avArray[$x_x] = $ITEMNUM & ": " & $CARDNAME & " |" & $YG & "x" & $PRICE & "|"
				EndIf
			EndIf
			$xxx = $ITEMNUM

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

	EndIf

	;====================================================================================

	If WinExists($TOAST) Then $SUBMIT = 3 ;If User tried to submit early.

	If PixelGetColor(365, 680) = 15198184 Then ExitLoop ;If this pixel has been detected it means all cards has been read.

	If $CARD8 = 16777215 Then ;If total of cards are equal to 8 or less, mouse pointer will be moved to a location where it won't affect the trade.
		Local $a = MouseGetPos()
		If $a[0] <> 455 Or $a[0] <> 536 Then
			MouseMove(455, 536, 2)
			Sleep(250)
		EndIf

		MouseWheel("DOWN", 1) ;Mouse must be Config to 7
		$N2 = PixelChecksum(15, 531, 440, 673)

		$io = 0
		While $N1 = $N2 ;Detects if MouseWheel was successful.
			$N2 = PixelChecksum(15, 531, 440, 673)
			$io += 1
			If $io = 5 Then ExitLoop
			Sleep(50)
		WEnd
	EndIf

WEnd

_SUP() ;Returns to the top of the list.

;$TIME = _Timer_Diff($starttime)

;============================================================================

$xxx = $xxx + 2

$iIndex = _ArraySearch($avArray, "", 0, $xxx)
_ArrayDelete($avArray, $iIndex)
$iIndex = _ArraySearch($avArray, "", 0, $xxx)
_ArrayDelete($avArray, $iIndex)

;If $NOTFOUND = 1 Then _ArrayDisplay($avArray, "Array Display")

$x = 0
$i = 0

While 1
	$x += 1
	If $x = 12 Then
		$avArray3 = _ArrayToString($avArray, " [sV] ", $i, $i + 11)
		$i += 12
		ClipPut($avArray3)
		If $YG > 0 Then
			SendMessage(ClipGet()) ;Sends the Information of all items to PM window. 12 items each time.
			ClipPut("")
		EndIf
		$x = 0
	EndIf
	If $i >= $xxx Then ExitLoop
WEnd

$y = 0
While 1
	$y += 1
	_ArrayDelete($avArray, $y)
	If $y = $i Then ExitLoop
WEnd

ClipPut('')

$YOUGETTOTAL_TT = 0

$YOUGETPRICE_TOTAL = Round($YOUGETPRICE + $CREDIT, 3)

SendMessage("[sV] QTY: " & $YOUGETTOTAL & " [sV]")

If $YOUGETPRICE_TOTAL = 0  And $YOUGETPRICE > 0 Then ;If bot took nothing or values are equal to Zero.

	SendMessage("I don't see anything else I need for now... bot will now exit in 5 seconds.")

ElseIf $YOUGETPRICE_TOTAL < 1 And $YOUGETPRICE > 0 Then ;If bot took that has values greater than Zero but values are less than 1.

	SendMessage("YOU GET: " & $YOUGETPRICE_TOTAL & " (" & $YOUGETPRICE & " + " & $CREDIT & " saved credit)")
	SendMessage("Confirm now and you will have " & $YOUGETPRICE_TOTAL & " saved credits for next trade.")
	If $YOUGETTOTAL = 400 Then SendMessage("I would like to buy additional cards from you. After you've finished this trade, please start another trade, and I will continue to buy.")
	$CONFIRM = "YES"
	$YOUGETTOTAL_TT = $YOUGETPRICE_TOTAL
	$CREDIT2 = $YOUGETPRICE_TOTAL
	$YOUGIVE = 1

ElseIf $YOUGETPRICE_TOTAL > 400 And $YOUGETPRICE_TOTAL > 1 Then ;If bot took values greater than 400.

	$CREDIT2 = $YOUGETPRICE_TOTAL - 400
	$CREDIT2 = Round(($CREDIT2 + $CREDIT), 3)
	$YOUGETPRICE_TOTAL2 = Floor($YOUGETPRICE_TOTAL)
	SendMessage("YOU GET: " & $YOUGETPRICE_TOTAL & " (" & $YOUGETPRICE & " + " & $CREDIT & " saved credit)")
	SendMessage("Take 400 ticket and click 'Submit' if you'd like to sell these cards.")

ElseIf $YOUGETPRICE_TOTAL <= 400 And $YOUGETPRICE_TOTAL >= 1 Then ;If bot took values greater than 1.

	$YOUGETPRICE_TOTAL = Round($YOUGETPRICE + $CREDIT, 3)
	$YOUGETPRICE_TOTAL2 = Floor($YOUGETPRICE_TOTAL)

	If $YOUGETPRICE_TOTAL > $YOUGETPRICE_TOTAL2 Then
		$CREDIT2 = Round($YOUGETPRICE_TOTAL - $YOUGETPRICE_TOTAL2, 3)
	Else
		$CREDIT2 = Round($YOUGETPRICE_TOTAL2 - $YOUGETPRICE_TOTAL, 3)
	EndIf

	SendMessage("YOU GET: " & $YOUGETPRICE_TOTAL & " (" & $YOUGETPRICE & " + " & $CREDIT & " saved credit)")
	SendMessage('Take ' & $YOUGETPRICE_TOTAL2  & " ticket and click 'Submit' if you'd like to sell these cards.")

	$YOUGETTOTAL_TT = $YOUGETPRICE_TOTAL

EndIf

$avArray = ''

$YOUGETPRICE_FINAL1 = $YOUGETPRICE

If $YOUGETPRICE_TOTAL = 0 Then ;Cancel's trade if no items where found or values is equal to Zero.
	Sleep(5000)
	_Cancel()
EndIf


;If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETREAD Done")

EndFunc

