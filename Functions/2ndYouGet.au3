
Func _2ndYouGIVE2() ;All Description will can be found and will be similar to _YouGetRead()

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_2ndYouGIVE2 Start")

$YOUGETTOTAL_FINAL = 0
$YOUGETPRICE_FINAL = 0
$BUGKA = ""
$YG = 0

$P1 = 524
$P3 = 724

$S1 = 785
$S3 = 810

$C1 = 847
$C3 = 904

$Q1 = 484
$Q3 = 505

$19 = 0
$85 = 85
$512 = 512

$CARD1 = PixelGetColor(828, 85)

If $CARD1 = 16777215 Then
	$P2 = 84
	$P4 = 94
	$S2 = $P2
	$S4 = $P4
	$Q2 = $P2
	$Q4	= $P4

	$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
	$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
	_AmountYG()
	If $CONSOLE = 'YES' Then _CONSOLEWRITE("_2ndYouGIVE2 End")
	If $VISITOR = "JustinAlmeda" Then SendMessage("You took " & $YG & " Event Tickets.")
Else
	$YOUGIVEPRICE_FINAL2 = 0
EndIf

$YOUGIVEPRICE_FINAL2 = $YG

EndFunc

;==============================================================

Func _2ndYouGET2() ;All Description will can be found and will be similar to _YouGetRead()

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_2ndYouGET2 Start")

Local $FINALYOUGET

$P1 = 62
$P3 = 262
$S1 = 323
$S3 = 348
$C1 = 385
$C3 = 442
$Q1 = 22
$Q3 = 43
$19 = 0
$85 = 85
$512 = 512

$YOUGETPRICE_FINAL = 0
$YOUGETTOTAL_FINAL = 0
$ITEMNUM = 0

MouseClick("left", 366, 104, 1, 5)

$i = 0
While PixelGetColor(366, 89) <> 16777215
	$i += 1
	MouseClick("left", 366, 89, 1, 5)
	Sleep(500)
	If $i = 3 Then ExitLoop
WEnd

;_SUP()
_SAP()
If $CONSOLE = 'YES' Then _CONSOLEWRITE("Select All")

If PixelGetColor(446, 678) = 16777215 Then
	MouseMove(457, 86, 0)
Else
	MouseMove(451, 42, 2)
	Sleep(500)
EndIf

$MM = 0

$x_x = 0

While WinExists($VISITORWINDOW)

	If $CONSOLE = 'YES' Then _CONSOLEWRITE("While Start")

	$N1 = PixelChecksum(400, 86, 448, 678)

	$CARD1 = PixelGetColor(363, 85)
	$CARD2 = PixelGetColor(363, 107)
	$CARD3 = PixelGetColor(363, 123)
	$CARD4 = PixelGetColor(363, 142)
	$CARD5 = PixelGetColor(363, 161)
	$CARD6 = PixelGetColor(363, 180)
	$CARD7 = PixelGetColor(363, 199)
	$CARD8 = PixelGetColor(363, 218)
	$CARD9 = PixelGetColor(363, 237)
	$CARD10 = PixelGetColor(363, 256)
	$CARD11 = PixelGetColor(363, 275)
	$CARD12 = PixelGetColor(363, 294)
	$CARD13 = PixelGetColor(363, 313)
	$CARD14 = PixelGetColor(363, 332)
	$CARD15 = PixelGetColor(363, 351)
	$CARD16 = PixelGetColor(363, 370)
	$CARD17 = PixelGetColor(363, 389)
	$CARD18 = PixelGetColor(363, 408)
	$CARD19 = PixelGetColor(363, 427)
	$CARD20 = PixelGetColor(363, 446)
	$CARD21 = PixelGetColor(363, 463)
	$CARD22 = PixelGetColor(363, 488)
	$CARD23 = PixelGetColor(363, 509)
	$CARD24 = PixelGetColor(363, 528)
	$CARD25 = PixelGetColor(363, 547)
	$CARD26 = PixelGetColor(363, 567)
	$CARD27 = PixelGetColor(363, 585)
	$CARD28 = PixelGetColor(363, 604)
	$CARD29 = PixelGetColor(363, 625)
	$CARD30 = PixelGetColor(363, 644)
	$CARD31 = PixelGetColor(363, 661)

	If $CARD1 = 16777215 Then

		$P2 = 84
		$P4 = 94
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")

		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4) ;hlhl

		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If $CARD2 = 16777215 Then
		$P2 = 103
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)

		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD3 = 16777215 Then
		$P2 = 122
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD4 = 16777215 Then
		$P2 = 141
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD5 = 16777215 Then
		$P2 = 160
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD6 = 16777215 Then
		$P2 = 180
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD7 = 16777215 Then
		$P2 = 199
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4
		$85 = 200
		$19 = 0

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If $CARD8 = 16777215 Then
		$P2 = 218
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD9 = 16777215 Then
		$P2 = 237
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD10 = 16777215 Then
		$P2 = 256
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD11 = 16777215 Then
		$P2 = 275
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD12 = 16777215 Then
		$P2 = 294
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD13 = 16777215 Then
		$P2 = 313
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD14 = 16777215 Then
		$P2 = 332
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD15 = 16777215 Then
		$P2 = 351
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD16 = 16777215 Then
		$P2 = 370
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD17 = 16777215 Then
		$P2 = 390
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD18 = 16777215 Then
		$P2 = 409
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4
		$85 = 410
		$19 = 0

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD19 = 16777215 Then
		$P2 = 428
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD20 = 16777215 Then
		$P2 = 447
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD21 = 16777215 Then
		$P2 = 466
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If $CARD22 = 16777215 Then
		$P2 = 485
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD23 = 16777215 Then
		$P2 = 504
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD24 = 16777215 Then
		$P2 = 523
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD25 = 16777215 Then
		$P2 = 542
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD26 = 16777215 Then
		$P2 = 561
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD27 = 16777215 Then
		$P2 = 580
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD28 = 16777215 Then
		$P2 = 599
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf
	If $CARD29 = 16777215 Then
		$P2 = 619
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4
		$85 = 620
		$19 = 0

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD30 = 16777215 Then
		$P2 = 638
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE = StringReplace(IniRead($PRICEINI, "CARDS", $CARDNAME, "0"), ",,,", "")
			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf
		EndIf
		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"

	EndIf

	If $CARD31 = 16777215 Then
		$P2 = 657
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		If PixelGetColor($512, 548) = 4207668 Then $FOIL = "YES"
		$x_x += 1
		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
		$CC = $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		If Not StringInStr($BUGKA, $CC) Then
			_AmountYG()
			If $YG = 401 Then $YG = 0
			$ITEMNUM += 1
			$xxx = $ITEMNUM

			$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0")
			$PRICES = StringSplit($PRICE_TXT, ",")
			$PRICE = $PRICES[1]

			$YOUGETTOTAL_FINAL += $YG
			$YOUGETPRICE_FINAL += Round($PRICE * $YG, 3)
			If $YG = 1 Then
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $PRICE
				EndIf
			Else
				If $FOIL = "YES" Then
					$avArray1[$x_x] = $CARDNAME & "(q)=" & $YG & "x" & $PRICE
				Else
					$avArray1[$x_x] = $CARDNAME & "=" & $YG & "x" & $PRICE
				EndIf
			EndIf

		EndIf

		$BUGKA = $BUGKA & " " & $CARDNAME & " " & PixelChecksum($C1, $P2, $C3, $P4)
		$FOIL = "NO"
		$CARD = 31
	EndIf

	If PixelGetColor(367, 678) = 15263976 And $CARD = 31 Then ExitLoop

	If $CARD31 = 16777215 Then

		If  $MM = 0 And PixelGetColor(446, 678) = 16777215 Then
			MouseMove(457, 86, 0)
			$MM = 1
		EndIf

		MouseWheel("DOWN", 4)
		Sleep(50)

		$N2 = PixelChecksum(400, 86, 448, 678)
		$io = 0
		While $N1 = $N2
			$N2 = PixelChecksum(400, 86, 448, 678)
			$io += 1
			If $io = 5 Then ExitLoop
			Sleep(50)
		WEnd

		If $N1 = $N2 And PixelGetColor(453, 663) <> 0 Then ExitLoop
		If $N1 = $N2 And PixelGetColor(453, 663) = 15264233 Then ExitLoop

	ElseIf $CARD2 <> 16777215 And $ITEMNUM = 1 Then
		ExitLoop
	ElseIf $CARD3 <> 16777215 And $ITEMNUM = 2 Then
		ExitLoop
	ElseIf $CARD4 <> 16777215 And $ITEMNUM = 3 Then
		ExitLoop
	ElseIf $CARD5 <> 16777215 And $ITEMNUM = 4 Then
		ExitLoop
	ElseIf $CARD6 <> 16777215 And $ITEMNUM = 5 Then
		ExitLoop
	ElseIf $CARD7 <> 16777215 And $ITEMNUM = 6 Then
		ExitLoop
	ElseIf $CARD8 <> 16777215 And $ITEMNUM = 7 Then
		ExitLoop
	ElseIf $CARD9 <> 16777215 And $ITEMNUM = 8 Then
		ExitLoop
	ElseIf $CARD10 <> 16777215 And $ITEMNUM = 9 Then
		ExitLoop
	ElseIf $CARD11 <> 16777215 And $ITEMNUM = 10 Then
		ExitLoop
	ElseIf $CARD12 <> 16777215 And $ITEMNUM = 11 Then
		ExitLoop
	ElseIf $CARD13 <> 16777215 And $ITEMNUM = 12 Then
		ExitLoop
	ElseIf $CARD14 <> 16777215 And $ITEMNUM = 13 Then
		ExitLoop
	ElseIf $CARD15 <> 16777215 And $ITEMNUM = 14 Then
		ExitLoop
	ElseIf $CARD16 <> 16777215 And $ITEMNUM = 15 Then
		ExitLoop
	ElseIf $CARD17 <> 16777215 And $ITEMNUM = 16 Then
		ExitLoop
	ElseIf $CARD18 <> 16777215 And $ITEMNUM = 17 Then
		ExitLoop
	ElseIf $CARD19 <> 16777215 And $ITEMNUM = 18 Then
		ExitLoop
	ElseIf $CARD20 <> 16777215 And $ITEMNUM = 19 Then
		ExitLoop
	ElseIf $CARD21 <> 16777215 And $ITEMNUM = 20 Then
		ExitLoop
	ElseIf $CARD22 <> 16777215 And $ITEMNUM = 21 Then
		ExitLoop
	ElseIf $CARD23 <> 16777215 And $ITEMNUM = 22 Then
		ExitLoop
	ElseIf $CARD24 <> 16777215 And $ITEMNUM = 23 Then
		ExitLoop
	ElseIf $CARD25 <> 16777215 And $ITEMNUM = 24 Then
		ExitLoop
	ElseIf $CARD26 <> 16777215 And $ITEMNUM = 25 Then
		ExitLoop
	ElseIf $CARD27 <> 16777215 And $ITEMNUM = 26 Then
		ExitLoop
	ElseIf $CARD28 <> 16777215 And $ITEMNUM = 27 Then
		ExitLoop
	ElseIf $CARD29 <> 16777215 And $ITEMNUM = 28 Then
		ExitLoop
	ElseIf $CARD30 <> 16777215 And $ITEMNUM = 29 Then
		ExitLoop
	ElseIf $CARD31 <> 16777215 And $ITEMNUM = 30 Then
		ExitLoop
	EndIf

WEnd


If PixelGetColor(453, 535) <> 16777215 And WinExists($VISITORWINDOW) Then
	Sleep(50)
	MouseWheel("UP", 99) ;Must be Config to 7
EndIf

;#cs
$xxx = $xxx + 2

$iIndex = _ArraySearch($avArray1, "", 0, $xxx)
_ArrayDelete($avArray1, $iIndex)
$iIndex = _ArraySearch($avArray1, "", 0, $xxx)
_ArrayDelete($avArray1, $iIndex)

;_ArrayDisplay($avArray1, "Array Display")
;#ce
;_ArrayDisplay($avArray1[85], "Array Display")

;#cs
$x = 0
$i = 0

$TT = "RECORD.ini"
Fileopen("RECORD.ini", 2)

While 1
	$x += 1

	If $x = 1 Then

		$avArray3 = _ArrayToString($avArray1, @CRLF, $i, $i + 11)
		$i += 12
		FileWriteLine($TT, $avArray3)
		;ClipPut($avArray3)
		;SendMessage(ClipGet())
		$x = 0
	EndIf

	If $i >= $xxx Then ExitLoop

WEnd

FileClose($TT)

Local $ZZ

If Not _FileReadToArray('RECORD.ini', $ZZ) Then
	MsgBox(0,'RECORD.ini',"File Not Found", 1)
EndIf

Fileopen("RECORD2.ini", 2)

$TT2 = "RECORD2.ini"
FileWriteLine($TT2, "[" & $VISITOR & "]")

For $z = 1 To $ZZ[0]

	If $ZZ[$z] = "" Then

	Else
		FileWriteLine($TT2, $ZZ[$z])
	EndIf

Next

If $VISITOR = "JustinAlmeda" Then
	SendMessage($YOUGETTOTAL_FINAL & " total number of cards.")
	SendMessage($YOUGETPRICE_FINAL & " total worth of cards.")
	SendMessage($YOUGETPRICE_FINAL & " + " & $CREDIT & "= " & Round($YOUGETPRICE_FINAL + $credit, 3))
	SendMessage($CREDIT & " old credits.")
	SendMessage($CREDIT2 & " new credits.")
EndIf
$YOUGETPRICE_FINAL2 = $YOUGETPRICE_FINAL

If $CONSOLE = 'YES' Then _CONSOLEWRITE("_2ndYouGET2 ")

EndFunc

