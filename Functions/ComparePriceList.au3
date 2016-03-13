;~ #include <File.au3>
;~ #include <var.au3>

;~ _ComparePriceList()

Func _ComparePriceList()

ToolTip('_ComparePriceList',0,0)

If WinExists($VISITORWINDOW) Then _DownloadPricelist2()

$FINAL_CONFIRM = "NO"

Local $ZZ

If Not _FileReadToArray("RECORD2.ini", $ZZ) Then MsgBox(0,'RECORD2.ini',"File Not Found", 1)

For $x = 2 To $ZZ[0]

	$1 = StringInStr($ZZ[$x], "=")
	$cardname = StringLeft($ZZ[$x], $1 - 1)

	$PRICE_TXT = IniRead($PRICEINI, "CARDS", $CARDNAME, "0,0,,")
	$PRICES = StringSplit($PRICE_TXT, ",")
	$PRICE = $PRICES[1]

	$PRICE_TXT2 = IniRead('PRICES2.ini', "CARDS", $CARDNAME, "0,0,,")
	$PRICES2 = StringSplit($PRICE_TXT2, ",")
	$PRICE2 = $PRICES2[1]

	If Round($PRICE, 3) <> Round($PRICE2, 3) Or $PRICE = 0 Or $PRICE2 = 0 Then
		SendMessage("The price on one or more of the cards you are selling have changed. Please reopen trade.")
		_CANCEL()
		$FINAL_CONFIRM = "NO"
	Else
		$FINAL_CONFIRM = "YES"
	EndIf
;~ 	ToolTip($cardname & " " & $PRICE & " = " & $PRICE2,0,0)
;~ 	ClipPut($cardname & " " & $cardname2)
Next

FileClose("PRICES2.ini")
ToolTip('')

EndFunc

;~ Func Q_Select($table, $where, $where_value, $return_select)
;~ 	$CONN.Open( $DB_CONNECT )
;~ 	$sQuery = "SELECT * FROM " & $table & " WHERE " & $where & "='" & $where_value & "'"
;~ 	$result = $conn.Execute($sQuery)
;~ 	$return_value = $result.Fields($return_select).Value
;~ 	$conn.Close
;~ EndFunc


;~ Func _DownloadPricelist2()
;~ ToolTip("Updating Pricelist",0,0)
;~ $CONN.Open( $DB_CONNECT )

;~ $sQuery = "SELECT * FROM cardsini WHERE setcode='ORI'"
;~ $result11 = $conn.Execute($sQuery)

;~ $TT = FileOpen("PRICES2.ini", 2)
;~ FileWriteLine($TT, "[CARDS]")

;~ With $result11
;~ While Not .EOF
;~ 	$cardname = StringReplace($result11.Fields("cardname").Value, "^", "'")
;~ 	$setcode = $result11.Fields("setcode").Value
;~ 	$price = $result11.Fields("price").Value
;~ 	$quantity = $result11.Fields("quantity").Value
;~ 	$LIST = StringReplace($cardname & " (" & $setcode & ")=" & $price & "," & $quantity & ",,", "  ", " ")
;~ 	FileWriteLine($TT, $LIST)
;~ 	;MsgBox(0,'',$cardname & " (" & $setcode & ")=" & $price)
;~ 	.movenext
;~ WEnd
;~ EndWith

;~ $sQuery = ("UPDATE settings SET pricelist='0' WHERE botname='" & $ourname & "' ")
;~ $conn.Execute($sQuery)

;~ FileClose($TT)
;~ $conn.Close

;~ ToolTip("",0,0)

;~ EndFunc
