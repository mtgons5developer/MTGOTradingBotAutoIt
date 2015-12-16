;INI Files
Global $CARDINI = "INI\CARDS.ini"
Global $SKIP = "INI\SKIP.ini"
Global $INIFILE = "INI\NS5.ini"
Global $CARDINI = "INI\CARDS.ini"

;Script Variables
Global $PAUSED = False

;MTGO Client Variables
Global $MTGOVERSION = ""
Global $MTGOEXE = '@PATH & "\Desktop\Magic The Gathering Online .appref-ms"'
;Global $MTGOEXE = '"C:\Users\Win.7\Desktop\Magic The Gathering Online .appref-ms"'
Global $MTGOWINDOW = "Magic: The Gathering Online"
Global $MTGOINPUTDELAY = 200

;Database Connection Variables
Global $DATASOURCE = "PostgreSQL35W"
Global $SERVER = "192.168.1.20"
Global $PORT = "5432"
Global $DATABASE = "dbname"
Global $UID = "username"
Global $PWD = "password"
Global $DB_CONNECT = "  DATA SOURCE = " & $DATASOURCE & _
					 "; SERVER = " & $SERVER & _
					 "; PORT = " & $PORT & _
					 "; DATABASE = " & $DATABASE & _
					 "; UID = " & $UID & _
					 "; PWD = " & $PWD & ";"
Global $CONN = ObjCreate( "ADODB.Connection" )
Global $RECORDSET = ObjCreate( "ADODB.RecordSet" )

;DD Bot Operation Variables
Global $BOT_ACCOUNT = Null
Global $INTRADE = "OPEN"
Global $TRADE
Global $TRADE_TYPE
Global $runner_bot_id
Global $USER_ID
Global $MTGOACCOUNT_ID
Global $USER
Global $RUNNER
Global $BANK
Global $MSG
Global $LASTMESSAGE
Global $CHATWINDOW
Global $CHATWINDOW2
Global $CHAT_MESSAGE_FROM_USER
Global $CONSOLE
Global $TOAST1
Global $TOAST2

Global $N1, $N2, $N11, $N12
Global $x1 = 950
Global $y1 = 640
Global $x, $y

;Runner Variables
Global $STATUS
Global $NOT_ON_LIST = "Some Cards Not Found"
Global $avArray1[400]
Global $CREDIT
Global $CREDIT2
Global $YOUGETTOTAL_FINAL, $YOUGIVETOTAL_FINAL, $YOUGETTOTAL, $YOUGIVETOTAL
Global $Q1, $Q2, $Q3, $Q4
Global $TRADEWINDOW
Global $SUBMIT
Global $YG ;QTY from _AmountYG()
Global $FOIL = "NO"
Global $ITEMNUM
Global $BUGKA, $CC, $ROLE
Global $P1, $P2, $P3, $P4
Global $S1, $S2, $S3, $S4
Global $C1, $C2, $C3, $C4

;Colors
GLOBAL Const $P_WHITE = 16777215
GLOBAL Const $P_NOT_LOGGED_IN = 9735034


