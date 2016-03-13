#include <Array.au3>
#include <var.au3>
#include <YG.au3>

Global $LASTMESSAGE, $MSG, $Q1, $Q2, $Q3, $Q4, $x1, $y1

Global $x1 = 1001
Global $y1 = 652

;$VISITORWINDOW = 'Trade: JustinAlmeda'
$VISITORWINDOW = 'Trade: CardBot4'
WinActivate($VISITORWINDOW)
Sleep(1000)
$TT = FileOpen("TT.ini", 2)

Func _Cancel()

	If PixelChecksum(749, 692, 826, 702) = 977399560 Then MouseClick("left", 787, 697, 2, 2)

EndFunc

Func SendMessage($MSG)

	If $MSG <> $LASTMESSAGE Then
		ClipPut($MSG)
		MouseClick("left", $x1, $y1, 1, 1)
		Sleep(50)
		Send("^v")
		Sleep(250)
		Send("{ENTER}")
	EndIf

	ClipPut("")
	$MSG = $LASTMESSAGE

EndFunc

Func _SUP()
	; ALL LINES MUST GO ALL WHITE
	Send("{CTRLDOWN}")
	Sleep(50)
	Send("{HOME}")
	Sleep(500)
	Send("{CTRLUP}")

EndFunc

Func _SAP()

Sleep(500)
Send("{CTRLDOWN}")
Sleep(50)
Send("{a}")
Sleep(500)
Send("{CTRLUP}")

EndFunc
MouseClick("left", 482, 372, 1, 1)
Sleep(1000)

_YOUGETREAD()

Func _YOUGETREAD()

$YOUGETPRICE_FINALE = 0
$CONFIRM = 'NO'
$YOUGETPRICE_FINAL1 = 0
$YOUGETPRICE = 0
$YOUGETTOTAL = 0

;If $CONSOLE = 'YES' Then _CONSOLEWRITE("_YOUGETREAD Start")
Local $CARDNAME, $YOUGETPRICE, $ITEMNUM, $xxx, $BUGKA, $YOUGETPRICE_TOTAL, $YOUGETTOTAL
Local $avArray[400], $CARDS_MEM[400]

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

$19 = 0
$85 = 529
$512 = 306

$i = 0

While PixelGetColor(361, 557) <> 16777215
	$i += 1
	MouseClick("left", 361, 557, 1, 0)
	Sleep(500)
	If $i = 3 Then ExitLoop
WEnd

MouseMove(401, 483, 0)
_SUP()
_SAP()
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
		$P2 = 528
		$P4 = 538
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4
		$LINE = 1

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD2 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 547
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD3 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 567
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD4 = 16777215 And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 586
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD5 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 605
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD6 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 624
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	If Not WinExists($VISITORWINDOW) Then ExitLoop

	If $CARD7 = 16777215  And $LINE = 1 And WinExists($VISITORWINDOW) Then
		$P2 = 643
		$P4 = $P2 + 10
		$S2 = $P2
		$S4 = $P4
		$Q2 = $P2
		$Q4	= $P4

		$N = PixelChecksum($P1, $P2, $P3, $P4) & "-" & PixelChecksum($S1, $P2, $S3, $P4) & "-" & PixelChecksum($C1, $P2, $C3, $P4)
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

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
		$CC = $N
		If Not StringInStr($BUGKA, $CC) Then FileWriteLine($TT, $N & "=")
		$BUGKA = $BUGKA & " " & $CC

	EndIf

	;====================================================================================
	If WinExists($TOAST) Then $SUBMIT = 3
	If PixelGetColor(365, 680) = 15198184 Then ExitLoop

	If $CARD8 = 16777215 Then
		Local $a = MouseGetPos()
		If $a[0] <> 455 Or $a[0] <> 536 Then
			MouseMove(455, 536, 2)
			Sleep(250)
		EndIf

		MouseWheel("DOWN", 1) ;Mouse must be Config to 7
		$N2 = PixelChecksum(15, 531, 440, 673)

		$io = 0
		While $N1 = $N2
			$N2 = PixelChecksum(15, 531, 440, 673)
			$io += 1
			If $io = 5 Then ExitLoop
			Sleep(50)
		WEnd
	EndIf

WEnd

_SUP()

Exit

EndFunc

