Func _CHECK_WISHLIST()

_CON()
$WISHLIST_UPDATE = $conn.Execute("SELECT * FROM settings WHERE botname='" & $OURNAME & "'")
If $WISHLIST_UPDATE.Fields("wishlist").Value = 1 Then
	SendMessage("Sorry the latest stocks has been updated, please re-open trade, so I can take more based on my latest wishlist. Thank you.")
	_CANCEL()
EndIf
_DC()

EndFunc

Func _WISHLIST_MR()

_CON() ;Connects to DB
;$WISHLIST_UPDATE = $conn.Execute("SELECT * FROM settings WHERE botname='" & $OURNAME & "'")
;If $WISHLIST_UPDATE.Fields("wishlist").Value = 1 Then ;;;
	$sQuery = "SELECT * FROM cardsini WHERE (setcode='ORI' AND rarity='M') OR (setcode='ORI' AND rarity='R')"
	$result = $conn.Execute($sQuery)

	$TT = FileOpen("MythicRare.dek", 2)
	FileWriteLine($TT, '<?xml version="1.0" encoding="utf-8"?>')
	FileWriteLine($TT, '<Deck xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">')
	FileWriteLine($TT, '  <NetDeckID>0</NetDeckID>')
	FileWriteLine($TT, '  <PreconstructedDeckID>0</PreconstructedDeckID>')

	With $result
	While Not .EOF
		$sQuery = "SELECT * FROM cardsini WHERE (setcode='ORI' AND rarity='M') OR (setcode='ORI' AND rarity='R')"
		$cardname = $result.Fields("cardname").Value
		$setcode = $result.Fields("setcode").Value
		$quantity = $result.Fields("quantity").Value
		$stocks = $result.Fields("stocks").Value
		$catid = $result.Fields("catid").Value
		$wish = $quantity - $stocks
		If $wish > 4 Then $wish = 4
		$cardname = StringReplace($cardname, "^", "'")
		If $wish > 0 Then
			$NN = '  <Cards CatID="' & $catid &'" Quantity="' & $wish & '" Sideboard="false" Name="' & $cardname & '" />'
			$NN = StringReplace($NN, ' " />', '" />') & @CRLF
			$SF_UTF8 = StringToBinary($NN, 4)
			FileWriteLine($TT, $SF_UTF8)
		EndIf
		.movenext
	WEnd
	EndWith

	FileWriteLine($TT, '</Deck>')
	FileClose($TT)

	$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI' AND rarity='U'"
	$result = $conn.Execute($sQuery)

	$TT = FileOpen("Uncommon.dek", 2)
	FileWriteLine($TT, '<?xml version="1.0" encoding="utf-8"?>')
	FileWriteLine($TT, '<Deck xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">')
	FileWriteLine($TT, '  <NetDeckID>0</NetDeckID>')
	FileWriteLine($TT, '  <PreconstructedDeckID>0</PreconstructedDeckID>')

	With $result
	While Not .EOF
		$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI' AND rarity='U'"
		$cardname = $result.Fields("cardname").Value
		$setcode = $result.Fields("setcode").Value
		$quantity = $result.Fields("quantity").Value
		$stocks = $result.Fields("stocks").Value
		$catid = $result.Fields("catid").Value
		$wish = $quantity - $stocks
		If $wish > 4 Then $wish = 4
		$cardname = StringReplace($cardname, "^", "'")
		If $wish > 0 Then
			$NN = '  <Cards CatID="' & $catid &'" Quantity="' & $wish & '" Sideboard="false" Name="' & $cardname & '" />'
			$NN = StringReplace($NN, ' " />', '" />') & @CRLF
			$SF_UTF8 = StringToBinary($NN, 4)
			FileWriteLine($TT, $SF_UTF8)
		EndIf
		.movenext
	WEnd
	EndWith

	FileWriteLine($TT, '</Deck>')
	FileClose($TT)

	$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI' AND rarity='C'"
	$result = $conn.Execute($sQuery)

	$TT = FileOpen("Common.dek", 2)
	FileWriteLine($TT, '<?xml version="1.0" encoding="utf-8"?>')
	FileWriteLine($TT, '<Deck xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">')
	FileWriteLine($TT, '  <NetDeckID>0</NetDeckID>')
	FileWriteLine($TT, '  <PreconstructedDeckID>0</PreconstructedDeckID>')

	With $result
	While Not .EOF
		$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI' AND rarity='C'"
		$cardname = $result.Fields("cardname").Value
		$setcode = $result.Fields("setcode").Value
		$quantity = $result.Fields("quantity").Value
		$stocks = $result.Fields("stocks").Value
		$catid = $result.Fields("catid").Value
		$wish = $quantity - $stocks
		If $wish > 4 Then $wish = 4
		$cardname = StringReplace($cardname, "^", "'")
		If $wish > 0 Then
			$NN = '  <Cards CatID="' & $catid &'" Quantity="' & $wish & '" Sideboard="false" Name="' & $cardname & '" />'
			$NN = StringReplace($NN, ' " />', '" />') & @CRLF
			$SF_UTF8 = StringToBinary($NN, 4)
			FileWriteLine($TT, $SF_UTF8)
		EndIf
		.movenext
	WEnd
	EndWith

	FileWriteLine($TT, '</Deck>')
	FileClose($TT)
;EndIf

_DC()
_CONSOLEWRITE("_WISHLIST_MR Start")
$i = 0

While Not WinExists("Search Tools", "")
	$i += 1
	MouseClick('left', 58, 102, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
$i = 0
While Not WinExists("Select Deck(s)", "")
	$i += 1
	MouseClick('left', 445, 467, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
ControlClick("Select Deck(s)", "", "Edit1")
Sleep(250)

Local $windows = WinList()
For $i = 0 to $windows[0][0]
	If StringInStr($windows[$i][0], "Chat: ") Then WinClose($windows[$i][0])
Next

If WinExists($VISITORWINDOW,'') Then
	ClipPut(@WorkingDir & "\MythicRare.dek")
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")
	Sleep(2000)
EndIf

If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)

EndFunc

Func _WISHLIST_U()

_CONSOLEWRITE("_WISHLIST_U Start")
$i = 0

While Not WinExists("Search Tools", "")
	$i += 1
	MouseClick('left', 58, 102, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
$i = 0
While Not WinExists("Select Deck(s)", "")
	$i += 1
	MouseClick('left', 445, 467, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
ControlClick("Select Deck(s)", "", "Edit1")
Sleep(250)

Local $windows = WinList()
For $i = 0 to $windows[0][0]
	If StringInStr($windows[$i][0], "Chat: ") Then WinClose($windows[$i][0])
Next

If WinExists($VISITORWINDOW,'') Then
	ClipPut(@WorkingDir & "\Uncommon.dek")
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")
	Sleep(2000)
EndIf

If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)

EndFunc

;==========================================

Func _WISHLIST_C()

_CONSOLEWRITE("_WISHLIST_C Start")
$i = 0

While Not WinExists("Search Tools", "")
	$i += 1
	MouseClick('left', 58, 102, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
$i = 0
While Not WinExists("Select Deck(s)", "")
	$i += 1
	MouseClick('left', 445, 467, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
ControlClick("Select Deck(s)", "", "Edit1")
Sleep(250)

Local $windows = WinList()
For $i = 0 to $windows[0][0]
	If StringInStr($windows[$i][0], "Chat: ") Then WinClose($windows[$i][0])
Next

If WinExists($VISITORWINDOW,'') Then
	ClipPut(@WorkingDir & "\Common.dek")
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")
	Sleep(2000)
EndIf

If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)

_CONSOLEWRITE("Wishlist End")
EndFunc

Func _TAKE_TICKETS()


$TT = FileOpen("Event_Ticket.dek", 2)
FileWriteLine($TT, '<?xml version="1.0" encoding="utf-8"?>')
FileWriteLine($TT, '<Deck xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">')
FileWriteLine($TT, '  <NetDeckID>0</NetDeckID>')
FileWriteLine($TT, '  <PreconstructedDeckID>0</PreconstructedDeckID>')

$NN = '  <Cards CatID="' & 1 &'" Quantity="' & $wish_tickets & '" Sideboard="false" Name="' & "Event Ticket" & '" />'
$NN = StringReplace($NN, ' " />', '" />') & @CRLF
$SF_UTF8 = StringToBinary($NN, 4)
FileWriteLine($TT, $SF_UTF8)

FileWriteLine($TT, '</Deck>')
FileClose($TT)

_CONSOLEWRITE("Event_Ticket.dek Start")
$i = 0
While Not WinExists("Search Tools", "")
	$i += 1
	MouseClick('left', 58, 102, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
$i = 0
While Not WinExists("Select Deck(s)", "")
	$i += 1
	MouseClick('left', 445, 467, 2, 2)
	Sleep(1000)
	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return
WEnd

Sleep(250)
ControlClick("Select Deck(s)", "", "Edit1")
Sleep(250)

Local $windows = WinList()
For $i = 0 to $windows[0][0]
	If StringInStr($windows[$i][0], "Chat: ") Then WinClose($windows[$i][0])
Next

If WinExists($VISITORWINDOW,'') Then
	ClipPut(@WorkingDir & "\Event_Ticket.dek")
	Sleep(500)
	Send("^v")
	Sleep(500)
	Send("{ENTER}")
	Sleep(2000)
EndIf

If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)

EndFunc