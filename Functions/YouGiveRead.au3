
Func _YOUGIVEREAD() ;All Description for this Function is almost the same with function _YouGetRead()

;$TT = FileOpen("TT2.ini", 2)

$YOUGIVEPRICE = 0
$YOUGIVETOTAL = 0
$YOUGETTOTAL_TT2 = 0

Local $avArrayGIVE

$P1 = 524
$P3 = 724
$S1 = 785
$S3 = 810
$C1 = 847
$C3 = 904
$Q1 = 484
$Q3 = 505


$19 = 0
$85 = 529
$512 = 769

$i = 0

While PixelGetColor(827, 534) <> 16777215
	$i += 1
	MouseClick("left", 827, 534, 1, 0)
	Sleep(250)
	If $i = 3 Then ExitLoop
WEnd

Sleep(500)

$CARD1 = PixelGetColor(826, 534)

If $CARD1 = 16777215 Then
	$P2 = 528
	$P4 = 538
	$S2 = $P2
	$S4 = $P4
	$Q2 = $P2
	$Q4	= $P4

	$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
	$CARDNAME = IniRead($CARDINI, "CARDS", $N, "NOT FOUND")
	;If $CARDNAME = "NOT FOUND" Then FileWriteLine($TT, $N & "=")

	_AmountYG()

	;All Event Ticket Values will always be equal to 1.
	$PRICE = "1.00"
;~ 	If $N = 1362553868-920737492-2173661936 And $VISITOR = "JustinAlmeda" Then
;~ 		$PRICE = "1.00"
;~ 	Else
;~ 		$PRICE = "1.00"
;~ 	EndIf

	$YOUGIVETOTAL += $YG
	$YOUGIVEPRICE += Round($PRICE * $YG, 3)
	$YOUGIVEPRICE_FINAL1 = $YG

	If $YG = 1 Then
		$avArrayGIVE = $CARDNAME & " |" & $PRICE & "|"
	Else
		$avArrayGIVE = $CARDNAME & " | " & $YG & " x " & $PRICE & " |"
	EndIf

	$TOTAL = Round($YOUGETTOTAL_TT - $YOUGIVEPRICE, 3)

	If $TOTAL < 1 And $TOTAL > 0 Then ;If value is less than 1.

		$CREDIT2 = $TOTAL
		SendMessage("After we've finished the trade, you will have " & $CREDIT2 & " saved credits.")
		$CONFIRM = 'YES'

	ElseIf $TOTAL > 1 Then ;If value is greater than 1.
	;If $TOTAL > 0 Then

		SendMessage("Please take the exact amount of " & Floor($YOUGETTOTAL_TT) & " Event Tickets. Then click 'Submit' button.")
		$CONFIRM = 'NO'
		;$CONFIRM = 'YES'
		$TOTAL = 0

	ElseIf $TOTAL = 0 Then ;If value is equal to Zero.
		$TOTAL = Round($YOUGETTOTAL_TT - $YOUGIVEPRICE, 3)
		$CREDIT2 = $TOTAL + $CREDIT
		;SendMessage($YOUGETTOTAL_TT)
		SendMessage("After we've finished the trade, you will have " & $CREDIT2 & " saved credits.")
		$CONFIRM = 'YES'
	Else ;If values does'nt meant the exact terms. Confirmation will be Negative.
		$YOUGETTOTAL = Ceiling(Round($YOUGETTOTAL_TT - $CREDIT, 3))
		$TOTAL = Floor($YOUGIVEPRICE - $YOUGETTOTAL)
		If Round($YOUGETTOTAL_TT, 3) < 1 Then
			SendMessage("You have taken " & $YOUGIVEPRICE & " tickets. Please re-open trade. Closing trade in 5 seconds...")
			Sleep(5000)
			_Cancel()
		Else
			SendMessage("You have taken " & $YOUGIVEPRICE & " tickets. Please remove " & $TOTAL & " tickets from the trade and confirm the trade.")
		EndIf
		$CONFIRM = 'NO'
		$TOTAL = 0
	EndIf

Else
	$YOUGIVEPRICE_FINAL1 = 0
EndIf

EndFunc
