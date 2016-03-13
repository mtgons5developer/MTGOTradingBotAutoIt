#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=NS5.ico
#AutoIt3Wrapper_Outfile=VycerBuy.exe
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mi /mo /so
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <include.au3>

Opt("MouseCoordMode", 2)
Opt("PixelCoordMode", 2)

Global $DB = 0

HotKeySet("{F11}", "_X") ;Once the button is pressed the bot will exit.
HotKeySet("{Pause}", "_Pause") ;Once the button is pressed the bot will stay paused. Press again to unpause.

;$DEBUG = "YES"
$CONSOLE = "YES"
$DEBUG = "NO"
;$CONSOLE = "NO"

_STATUS()

If $DEBUG = "NO" Then
	;Check if MTGO Client is running
	If ProcessExists("MTGO.exe") Then
		If $CONSOLE = 'YES' Then _CONSOLEWRITE('MTGO Client detected.') ;Location of _CONSOLEWRITE = MTGO_Function.au3
		Local $windows = WinList()

		For $i = 0 to $windows[0][0]
			If StringInStr($windows[$i][0], "Magic: ") Then
				WinActivate($windows[$i][0],'')
				Sleep(1000)
				WinMove($windows[$i][0], '', 0, 0)
			EndIf
		Next
	Else
		If $CONSOLE = 'YES' Then _CONSOLEWRITE('Checking Database Access rights...')
		Q_Select("cardsini", "cardname", "Event Ticket", "price")
		If $CONSOLE = 'YES' Then _CONSOLEWRITE('Autologin')
		_AutoLogin()
	EndIf

Else
	;$BOTTITLE = 'Trade: JustinAlmeda'
	;$VISITORWINDOW = 'Trade: JustinAlmeda'
	WinActivate($BOTTITLE,'')
	WinMove($BOTTITLE, '', 0, 0)
	Sleep(1000)
EndIf

If PixelChecksum(14, 542, 134, 554) <> 2138318137 Then _TradeTab() ;Trade Tab 'My Post: Message pixel'
If PixelGetColor(251, 178) <> 16776960 Then _MsgBoard() ;Detect the Yellow on botname

;Check DB for msgboard message
Q_Select('message_board', 'botname', $ourname, 'message')
$message = $return_value
If $message = "" Then $message = "My Post: Message Maximum 250 Characters."

;Check DB for msgboard message OPEN values
Q_Select('message_board', 'botname', $ourname, 'open')
If $open = "" Then $open = "|OPEN|"
$open = $return_value

;Check DB for msgboard message BUSY values
Q_Select('message_board', 'botname', $ourname, 'busy')
If $busy = "" Then $busy = "|BUSY|"
$busy = $return_value

_BOARD_CONVERT()

;===============================

While 1 = 1

	$i = 0
	While PixelGetColor(681, 298) = 15452028
		ToolTip("Loading Magic Online Files...",0,0)
		$i += 1
		Sleep(1000)
	WEnd
	ToolTip($INTRADE,0,0)
	_HANDLEWINDOWS(1)
	If $INTRADE = "BUSY" Then _TRADE_USER() ;TRADE_USER.au3
	$BUGKA = ''
	$CC = ''
	;If @SEC = "10" Then _MsgBoard_Update()
	;If $BOARD_STATUS = "BUSY" Then _MsgBoardOPEN()
	Sleep(1000)
	$INTRADE = "OPEN"
WEnd

HotKeySet("{F11}", "_X")
HotKeySet("{Pause}", "_Pause")

;==========================

Func _DownloadPricelist()
ToolTip("Updating Pricelist",0,0)
_CON() ;Connect to DB

$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI'"
$result11 = $conn.Execute($sQuery)

;This will create a new Prices.ini file and download the new prices from db.
$TT = FileOpen("PRICES.ini", 2)
FileWriteLine($TT, "[CARDS]")

With $result11
While Not .EOF
	$cardname = StringReplace($result11.Fields("cardname").Value, "^", "'")
	$setcode = $result11.Fields("setcode").Value
	$price = $result11.Fields("price").Value
	$quantity = $result11.Fields("quantity").Value
	$stocks = $result11.Fields("stocks").Value
	$LIST = StringReplace($cardname & " (" & $setcode & ")=" & $price & "," & $quantity & "," & $stocks & ",", "  ", " ")
	$LIST = $LIST & @CRLF
	FileWriteLine($TT, StringToBinary($LIST))
	.movenext
WEnd
EndWith

$sQuery = ("UPDATE settings SET pricelist='0' WHERE botname='" & $ourname & "' ")
$conn.Execute($sQuery)

FileClose($TT)
_DC() ;Disconnect to DB
ToolTip("")


EndFunc


Func _DownloadPricelist2()
ToolTip("Updating Pricelist",0,0)
_CON()

$sQuery = "SELECT * FROM cardsini WHERE setcode='ORI'"
$result11 = $conn.Execute($sQuery)

$TT = FileOpen("PRICES2.ini", 2)
FileWriteLine($TT, "[CARDS]")

With $result11
While Not .EOF
	$cardname = StringReplace($result11.Fields("cardname").Value, "^", "'")
	$setcode = $result11.Fields("setcode").Value
	$price = $result11.Fields("price").Value
	$quantity = $result11.Fields("quantity").Value
	$stocks = $result11.Fields("stocks").Value
	$LIST = StringReplace($cardname & " (" & $setcode & ")=" & $price & "," & $quantity & "," & $stocks & ",", "  ", " ")
	FileWriteLine($TT, $LIST)
	;MsgBox(0,'',$cardname & " (" & $setcode & ")=" & $price)
	.movenext
WEnd
EndWith

$sQuery = ("UPDATE settings SET pricelist='0' WHERE botname='" & $ourname & "' ")
$conn.Execute($sQuery)

FileClose($TT)
_DC()

ToolTip("Pricelist Updated",0,0)

EndFunc


Func _STATUS()

If $CONSOLE = 'YES' Then _CONSOLEWRITE('Checking Database Access rights...')
$CONN.Open( $DB_CONNECT )

$sQuery = "SELECT * FROM bot_queue"
$result = $conn.Execute($sQuery)

$OO = 0
If $ourname = "" Then MsgBox(0,'Error', "BOT Name not yet Registered")

With $result
While Not .EOF
	If $result.Fields("botname").Value = $ourname Then
		$status = $result.Fields("status").Value
		If $status = "BUSY" Then Q_Update('bot_queue', 'status', 'OPEN', 'botname', $ourname)
		$OO = 1
	EndIf
	.movenext
WEnd
EndWith

$conn.Close

If $OO = 0 Then Q_Insert5('bot_queue','botname','status',$ourname,'OPEN')

EndFunc


