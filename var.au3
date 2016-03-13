$oMyError = ObjEvent("AutoIt.Error","MyErrFunc")

Global $result, $bot_queue, $sQuery, $sQuery2
local $conn = ObjCreate( "ADODB.Connection" )
local $RECORDSET = ObjCreate( "ADODB.RecordSet" )
local $sMsg = ""

Global $DATASOURCE = "MySQL57"
Global $SERVER = "localhost"
Global $PORT = "3306"
Global $DATABASE = "databasename"
Global $UID = "root"
Global $PWD = "password"

Global $DB_CONNECT = "  DATA SOURCE = " & $DATASOURCE & _
					 "; SERVER = " & $SERVER & _
					 "; PORT = " & $PORT & _
					 "; DATABASE = " & $DATABASE & _
					 "; UID = " & $UID & _
					 "; PWD = " & $PWD & ";"

Global $avArray1[400], $CARDS_MEM[99999], $NNN
Global $REMOVE, $REMOVEGET
Global $YOUGETTOTAL_TT
Global $YOUGETPRICE_FINAL1, $YOUGETPRICE_FINAL2, $YOUGIVEPRICE_FINAL1, $YOUGIVEPRICE_FINAL2
Global $MSG, $x, $y
Global $LASTMESSAGE
Global $VISITOR, $VISITOR2, $VISITORWINDOW
Global $OURNAME = IniRead("Settings.ini", "LOGIN", "USERNAME", "USERNAME")
Global $wish_tickets
Global $SUPPORT = "mtgons5.ea@gmail.com"
Global $DD = "NO"
Global $LINE
Global $PRICETXT
Global $TOAST = "ToastView"
Global $DD_NAME
Global $begin
Global $dif
Global $WINDOWS = "Windows"
Global $PRICE
Global $CARDNAME
Global $CARDNAMELIST
Global $REQ
Global $YOUGIVE2, $YOUGIVE3, $TAKENOW
Global $GETCARD
Global $19
Global $VISITORCHAT
Global $x_x, $xxx
Global $ADDED
Global $DONE
Global $AUTOSELL
Global $EXIT = "NO"
Global $RARITY
Global $SETRARITY
Global $WW = 1
Global $11
Global $12, $22, $23, $YG
Global $item, $PIXELREPEAT
Global $SUB
Global $FRESH
Global $STATUS
Global $MTGOACCOUNT_ID
Global $BOTTITLE = "Magic: The Gathering Online"
Global $PREVIEW = "Preview"
Global $TRADEREQUEST = "Trade Request"
Global $SYSTEM = "System Alert"
Global $WAITING = "Waiting for Response"
Global $LIMITREACHED = "Trade Limit Reached"
Global $LIMIT = "Trade Limit Reached"
Global $NOT_ON_LIST = "Some Cards Not Found"
Global $TRADE_CANCELED = "Trade Canceled"
Global $LOST = "Connection Lost"
Global $TRADE_COMPLETED = "Trade Completed"
Global $MAIN_NAV = "MainNavigation"
Global $ADDED_TO_COLLECTION = "Added to your Collection:"
Global $CHALLENGE

Global $YOUGETPRICE
Global $P1, $P2, $P3, $P4, $S1, $S2, $S3, $S4, $Q1, $Q2, $Q3, $Q4, $C1, $C3
Global $ITEMNUMYG_BUY
Global $YOUGIVETOTAL
Global $CLEAR
Global $SET
Global $NEWWISHLIST
Global $TOTAKE
Global $INTRADE
Global $FOIL = "NO"
Global $ITEMNUMYG2
Global $SEARCH
Global $MODE
Global $ITEMNUMYG
Global $BARTERTOTAL
Global $TICKET
Global $TOTALTIX
Global $LIMITED
Global $CONFIRM = 'NO'
Global $YOUGIVE1
Global $YOUGIVE2, $YOUGIVE3, $YOUGIVE4, $YOUGIVE5, $YOUGIVE11, $YOUGIVE66, $YOUGIVE55
Global $YOUGIVECARDS
Global $ITEMTOTAL
Global $ITEMNUM
Global $DEBUG
Global $YW
Global $THANKYOU
Global $SEARCH
Global $MTGO_ID
Global $USER_ID
Global $CARD1, $CARD2, $CARD3, $CARD4, $CARD5, $CARD6, $CARD7, $CARD8, $CARD9, $CARD10, $CARD11
Global $CARD12, $CARD13, $CARD14, $CARD15, $CARD16, $CARD17, $CARD18, $CARD19, $CARD20, $CARD21
Global $CARD22, $CARD23, $CARD24, $CARD25, $CARD26, $CARD27
Global $GETRIGHT
Global $YOUGETTIX
Global $PASSED
Global $x1
Global $y1
Global $BUGKA
Global $YOUGIVETOTAL_FINAL
Global $TRADEFILE
Global $TRADESTOCKS
Global $1YOUGETPRICE
Global $1YOUGIVEPRICE
Global $2YOUGETPRICE
Global $2YOUGIVEPRICE
Global $TAKEN
Global $GETPIX
Global $AMOUNT
Global $CARD
Global $1YOUGETITEM
Global $1YOUGIVEITEM
Global $2YOUGETITEM, $2YOUGIVEITEM, $NEW, $GETTY, $GETTY2, $CLEAR_1, $CLEAR_2
Global $1YOUGIVENUM, $2YOUGETNUM, $2YOUGIVENUM, $YGG, $TEST, $YG_EXIT
GlobaL $REPORTSELL, $REPORTBUY, $STOCKSGET, $STOCKSGIVE, $SELLMODE, $PRICEINI, $SYNC, $sql, $WALA
Global $512, $85, $19, $L1, $YOUSCANCARDS, $YOU_SCAN_TOTAL, $SCAN_OTHERS, $EXITLOOP, $DUPLICATE, $ZZ1, $TTZ, $TZTZ
Global $magic_account_id, $user_id, $trade_type, $trade_status, $runner_bot_id, $MYBOT_ID, $ONLINE, $NAME
Global $LINER, $PAUSED = 0, $MTGOINPUTDELAY = 250

Global $CARDINI = "INI\CARDS.ini"
Global $PRICEINI = "PRICES.ini"
Global $PRICEINI2 = "PRICES2.ini"
Global $INIFILE = "SETTINGS.ini"
Global $x1 = 1001
Global $y1 = 652

Global $CREDIT, $CREDIT2
Global $CONSOLE

Global $table, $target, $target2, $target3, $target4, $target_value, $target_value2, $target_value3, $target_value4, $where, $where_value, $where2, $where_value2
Global $return_select, $return_value
Global $FINAL_CONFIRM, $BOARD_STATUS, $message, $open, $busy

