
Func _UpdateQ_BUSY()
	Q_Update('bot_queue', 'status', 'BUSY', 'botname', $ourname)
	;Q_Update('bot_queue', 'status', 'OPEN', 'botname', 'MTGONS5')
EndFunc

Func _UpdateQ_OPEN()
	Q_Update('bot_queue', 'status', 'OPEN', 'botname', $ourname)
	;Q_Update('bot_queue', 'status', 'BUSY', 'botname', 'MTGONS5')
EndFunc

Func Q_Update($table, $target, $target_value, $where, $where_value)
	$CONN.Open( $DB_CONNECT )
	$sQuery = ("UPDATE " & $table & " SET " & $target & "='" & $target_value & "' WHERE " & $where & "='" & $where_value & "'")
	$conn.Execute($sQuery)
	$conn.Close
EndFunc
Func Q_Delete($table, $where, $where_value)
	$CONN.Open( $DB_CONNECT )
	$sQuery = ("DELETE FROM " & $table & " WHERE " & $where & "='" & $where_value & "'")
	$conn.Execute($sQuery)
	$conn.Close
EndFunc
Func Q_Select($table, $where, $where_value, $return_select)
	$CONN.Open( $DB_CONNECT )
	$sQuery = "SELECT * FROM " & $table & " WHERE " & $where & "='" & $where_value & "'"
	$result = $conn.Execute($sQuery)
	$return_value = $result.Fields($return_select).Value
	$conn.Close
EndFunc
Func Q_Insert($table, $where, $where_value)
	$CONN.Open( $DB_CONNECT )
	$sQuery = ("INSERT INTO " & $table & "(" & $where & ") VALUES('" & $where_value & "')")
	$conn.Execute($sQuery)
	$conn.Close
EndFunc

Func Q_Insert5($table, $where, $where2, $where_value, $where_value2)
	$CONN.Open( $DB_CONNECT )
	$sQuery2 = ("INSERT INTO " & $table & "(" & $where & "," & $where2 & ") VALUES('" & $where_value & "','" & $where_value2 & "')")
	$conn.Execute($sQuery2)
	$conn.Close
EndFunc

Func _CON()
	$CONN.Open( $DB_CONNECT )
EndFunc

Func _DC()
	$conn.Close
EndFunc

