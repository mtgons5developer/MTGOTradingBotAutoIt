;~ #include <File.au3>
;~ #include <var.au3>

;~ Func _UpdateQ_OPEN()
;~ 	Q_Update('bot_queue', 'status', 'OPEN', 'botname', $ourname)
;~ 	Q_Update('bot_queue', 'status', 'BUSY', 'botname', 'MTGONS5')
;~ EndFunc

;~ Func Q_Insert5($table, $where, $where2, $where_value, $where_value2)
;~ 	$CONN.Open( $DB_CONNECT )
;~ 	$sQuery2 = ("INSERT INTO " & $table & "(" & $where & "," & $where2 & ") VALUES('" & $where_value & "','" & $where_value2 & "')")
;~ 	$conn.Execute($sQuery2)
;~ 	$conn.Close
;~ EndFunc

;~ Func Q_Update($table, $target, $target_value, $where, $where_value)
;~ 	$CONN.Open( $DB_CONNECT )
;~ 	$sQuery = ("UPDATE " & $table & " SET " & $target & "='" & $target_value & "' WHERE " & $where & "='" & $where_value & "'")
;~ 	$conn.Execute($sQuery)
;~ 	$conn.Close
;~ EndFunc

;~ Func Q_Select($table, $where, $where_value, $return_select)
;~ 	$CONN.Open( $DB_CONNECT )
;~ 	$sQuery = "SELECT * FROM " & $table & " WHERE " & $where & "='" & $where_value & "'"
;~ 	$result = $conn.Execute($sQuery)
;~ 	$return_value = $result.Fields($return_select).Value
;~ 	$conn.Close
;~ EndFunc

;~ Local $cardname2, $amount, $stocks, $date, $time, $i

;~ $visitor = 'JustinAlmeda'
;~ $CREDIT = 0
;~ $CREDIT2 = 0
;~ $YOUGETPRICE_FINAL2 = 0
;~ $YOUGIVEPRICE_FINAL2 = 0
;~ _RecordTrade()

Local $cardname2, $amount, $stocks, $date, $time, $i

Func _RecordTrade()

If $DEBUG = "YES" Then ToolTip('_RecordTrade',0,0)

Local $ZZ

If Not _FileReadToArray("RECORD2.ini", $ZZ) Then MsgBox(0,'RECORD2.ini',"File Not Found", 1)

$CONN.Open( $DB_CONNECT )
$sQuery = "SELECT * FROM last_transaction_id"
$result = $conn.Execute($sQuery)
$last_transaction_id = $result.fields("transaction_id").value
$conn.Close

$i = $last_transaction_id

For $x = 2 To $ZZ[0]
	$i += 1
	$4 = StringInStr($ZZ[$x], "(")
	$5 = StringTrimLeft($ZZ[$x], $4)
	$6 = StringReplace($5, ")", "")
	$7 = StringInStr($6, "=")
	$setcode = StringLeft($6, $7 - 1) ;Filters the item and get the Setcode.

	$1 = StringInStr($ZZ[$x], "=")
	$cardname = StringLeft($ZZ[$x], $1 - 1) ;Filters the item and get the Cardname.

	$amount = 0
	$1 = StringInStr($ZZ[$x], "=")
	$amount = StringTrimLeft($ZZ[$x], $1)
	$2 = StringInStr($amount, "x")
	$amount = StringLeft($amount, $2 - 1) ;Filters the item and get the Amount.
	$1 = StringInStr($ZZ[$x], "(")
	$cardname2 = StringReplace(StringLeft($ZZ[$x], $1 - 2), "'", "^") ;Filters the item and get the Cardname2.

	If $amount = 0 Then $amount = 1

	$PRICE_TXT = IniRead($PRICEINI2, "CARDS", $CARDNAME, "0,0,0,")
	$PRICES = StringSplit($PRICE_TXT, ",")
	$PRICE = $PRICES[1]
	$stocks = $PRICES[3]

	;MsgBox(0,$PRICE,$cardname & " " & $amount & " " & $date & " " & $time )
	;Exit

	;MsgBox(0,$stocks,$amount & " " & $cardname2)
	$stocks_update = $stocks + $amount

	;MsgBox(0,$stocks,$stocks_update & " " & $cardname2)
	;Exit

	$date = @YEAR & "/" & @MON & "/" & @MDAY
	$time = @HOUR & ":" & @MIN

	;MsgBox(0,$visitor,$visitor & "','" & $cardname2 & "','" & $amount & _
	;"','" & $price & "','" & $date & "','" & $time & "','" & $CREDIT & "','" & $CREDIT2 & "','" & $ourname & "','" & $YOUGETPRICE_FINAL2 & "','" & $YOUGIVEPRICE_FINAL2 & "'")
	;Exit

	Q_Update('cardsini','stocks',$stocks_update, 'cardname',$cardname2)
	_UPDATE_RECORDS()

Next

$CONN.Open( $DB_CONNECT )
$sQuery = ("UPDATE last_transaction_id SET transaction_id='" & $i & "' WHERE transaction_id='" & $last_transaction_id & "'")
$conn.Execute($sQuery)
$conn.Close

Q_Select('cardsini','catid','1', 'stocks')
$ticket_update = $stocks - $YOUGIVEPRICE_FINAL2
Q_Update('cardsini','stocks',$ticket_update, 'catid','1') ;update tickets stocks

Q_Select('credits','visitor',$visitor,'credits')

If $credit = "" Then ;update credits
	Q_Insert5('credits', 'visitor', 'visitor2', $visitor, $credit2)
Else
	Q_Update('credits','credits',$CREDIT2, 'visitor',$visitor)
EndIf

Q_Update('settings','wishlist','1', 'wishlist','0')
_UpdateQ_OPEN()

$visitor = ''
$CREDIT = 0
$CREDIT2 = 0
$YOUGETPRICE_FINAL2 = 0
$YOUGIVEPRICE_FINAL2 = 0

EndFunc


Func _UPDATE_RECORDS()

$CONN.Open( $DB_CONNECT )
$sQuery2 = ("INSERT INTO transaction(visitor,cardname,amount,price,date,time,new_credits,old_credits,bot_name,bot_take_total,user_take_total,id) VALUES('" & _
$visitor & "','" & $cardname2 & "','" & $amount & "','" & $price & "','" & $date & "','" & $time & "','" & $CREDIT & "','" & $CREDIT2 & "','" & _
$ourname & "','" & $YOUGETPRICE_FINAL2 & "','" & $YOUGIVEPRICE_FINAL2 & "','" & $i & "')")
$conn.Execute($sQuery2)

EndFunc


