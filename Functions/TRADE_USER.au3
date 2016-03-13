

Func _TRADE_USER()

ToolTip($INTRADE,0,0)

$SUBMIT = 0
$YOUGETREAD = 0
$YOUGIVE = 0
$REMOVEGET = 0
$LOOP = 0
$TAKE = 0

If $CONSOLE = 'YES' Then _CONSOLEWRITE("Trade Start")

$INTRADE = 'BUSY'

Local $start = _Timer_Init()
Sleep(1000)

$VISITORCHAT = ''
$VISITOR = ''
$TRADE = "Trade: "

;Q_Select('message_board', 'botname', $ourname, 'message')
;$message = $return_value

While 1
	If $CONSOLE = 'YES' Then _CONSOLEWRITE("Waiting for trade window")
	_HandleWindows(0) ;HandleWindow.au3
	If $INTRADE = "OPEN" Then Return

	$TITLE = WinGetTitle("","")
	If $DEBUG = "YES" Then ToolTip($TITLE,0,0)

	$1 = StringInStr($TITLE, ":")
	$VISITOR = StringTrimLeft($TITLE, $1 + 1)
	IniWrite("INI\VISITOR.ini", "VISITOR", "User", $VISITOR)

	If WinExists($TRADE & $VISITOR) Then ExitLoop

WEnd

$VISITORWINDOW = $TRADE & $VISITOR
$VISITORCHAT = "Chat: " & $VISITOR

;If WinExists($VISITORWINDOW,'') Then _MsgBoardBUSY()
If WinExists($VISITORWINDOW,'') Then _Search() ;TRADE_USER.au3

Sleep(500)
$VISITOR3 = IniRead("INI\VISITOR.ini", "VISITOR", "USER", "")
WinActivate("Trade: " & $VISITOR3, '')
WinMove("Trade: " & $VISITOR3, '', 0, 0)

If PixelGetColor(37, 519) = 15452028 Then
	MouseMove(55, 519, 1)
	MouseClickDrag('left', 37, 519, 55, 519, 50)
	Sleep(500)
EndIf

_TRADE_CHECK() ;checks the location of each column in preparation for yougetread() and yougiveread(), _TRADE_CHECK.au3

If @DesktopHeight = 768 And @DesktopWidth = 1024 Then ;Checks the Client default Size/Resolution of MTGO.
	MsgBox(0,"ERROR", "Desktop Resolution is lower than 1280 x 768", 30)
ElseIf @DesktopHeight < 768 Then
	MsgBox(0,"ERROR", "Desktop Resolution is lower than 1280 x 768", 30)
Else
	If $DEBUG = "YES" Then ToolTip("TEST",0,0)
	If WinExists($VISITORWINDOW,'') Then
		_Search() ;TRADE_USER.au3
		If $DEBUG = "YES" Then ToolTip("PM",0,0)
		_PM() ;MTGO_FUnctions.au3
		If WinExists($VISITORWINDOW) Then _YOUGETCONFIG() ;FixTradeWindow.au3
		If $DEBUG = "YES" Then ToolTip("PM done",0,0)
		_WISHLIST_MR() ;Will load wishlist for Mythic and Rare, Wishlist.au3
		If $DEBUG = "YES" Then ToolTip("Wishlist M/R",0,0)
		_WISHLIST_U() ;Loads wishlist for Uncommon, Wishlist.au3
		If $DEBUG = "YES" Then ToolTip("Wishlist U",0,0)
		_WISHLIST_C() ;Loads wishlist for Common, Wishlist.au3
		If $DEBUG = "YES" Then ToolTip("Wishlist C",0,0)
		Sleep(2000)
		If WinExists($NOT_ON_LIST) Then WinClose($NOT_ON_LIST)
		If WinExists($LIMITREACHED) Then WinClose($LIMITREACHED)

		If WinExists($TOAST) Then $SUBMIT = 3
		;If WinExists($VISITORWINDOW) Then _YOUGETCONFIG()
		;If WinExists($VISITORWINDOW) Then _DownloadPricelist() ;If Enabled this will download pricelist from DB.
		If WinExists($TOAST) Then $SUBMIT = 3
		If WinExists($VISITORWINDOW) Then _YOUGETREAD() ;YOUGETREAD.au3
		If WinExists($TOAST) Then $SUBMIT = 3
		If WinExists($VISITORWINDOW) Then _YOUGIVECONFIG() ;FixTradeWindow.au3
		If WinExists($TOAST) Then $SUBMIT = 3

		;SendMessage(Round(_Timer_Diff($start), -1) & "ms")

	EndIf
EndIf

While WinExists($VISITORWINDOW)

	_HANDLEWINDOWS(0)
	If $INTRADE = "OPEN" Then Return

	If $CONFIRM = 'NO' Then $SUBMIT = 0

	If WinExists($TOAST) AND $SUBMIT = 0 And WinExists($VISITORWINDOW) And $YOUGIVE = 0 Then ;If User submitted 'after' wishlist is loaded.

		If $CONSOLE = 'YES' Then _CONSOLEWRITE("Submit 1")
		WinClose($TOAST)
		_YOUGIVEREAD()
		If $CONFIRM = "YES" Then
			$YOUGIVE = 1
			$SUBMIT = 1
		Else
			$YOUGIVE = 0
			$SUBMIT = 0
		EndIf

	ElseIf $SUBMIT = 3 And WinExists($VISITORWINDOW) And $YOUGIVE = 0 Then ;If User submitted 'before' wishlist is being loaded.

		If $CONSOLE = 'YES' Then _CONSOLEWRITE("Submit 1")
		WinClose($TOAST)
		_YOUGIVEREAD()
		If $CONFIRM = "YES" Then
			$YOUGIVE = 1
			$SUBMIT = 1
		Else
			$YOUGIVE = 0
			$SUBMIT = 0
		EndIf

	ElseIf $SUBMIT = 1 And $YOUGIVE = 1 And $CONFIRM = 'YES' And $YOUGETPRICE_FINAL1 > 0 Then ;If $YOUGETPRICE_FINAL1 is greater than Zero.

;~ 		While WinExists($VISITORWINDOW)
;~ 			If $DEBUG = "YES" Then ToolTip("Submit",0,0)
;~ 			MouseClick('left', 653, 695, 1, 5)
;~ 			MouseMove(681,599,0)
;~ 			Sleep(250)
;~ 			$search = _ImageSearchArea("INI\Submit.bmp",0,614, 685, 733, 709,$x,$y,0) ;Will search and wait for the exact image.
;~ 			If $search = 0 Then ExitLoop
;~ 		WEnd
		_Next()

	Else
		Sleep(250)
	EndIf

WEnd

EndFunc

Func _RemoveWindow()
	;This will remove all pop-up window after wishlist has been loaded each time.

	Local $windows = WinList()

	For $i = 0 to $windows[0][0]
		If StringInStr($windows[$i][0], $NOT_ON_LIST) Then WinClose($windows[$i][0]) ;Will try and look for the pop-up window $NOT_ON_LIST = "Some Cards Not Found"
		If StringInStr($windows[$i][0], $LIMITREACHED) Then WinClose($windows[$i][0])
	Next

EndFunc


Func _Search()

;This will check the search button

$x = 12
$y = 123

;~ While 1
;~ 	If $DEBUG = "YES" Then ToolTip("Search",0,0)
;~ 	_MTGO_WRITE('MTGONS5', 22, 133)
;~ 	ClipPut('') ;Empty the contents of clipboard.
;~ 	Sleep(1000)
;~ 	$search = _ImageSearchArea("INI\Search.bmp",0,14,129,155,139,$x,$y,0) ;Will search and wait for the exact image.
;~ 	If $search = 0 Then ExitLoop
;~ WEnd



EndFunc