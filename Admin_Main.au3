
#include <include.au3>
#include <admin_chat.au3>

;PostgreSQL

$CONSOLE = "YES"
;$CONSOLE = "NO"

;Check for and Close Duplicate Process
If Not _SINGLETONPID('Admin_Bot.exe', 1) = 0 Then ProcessClose("Admin_Bot.exe")

;_EXECUTE("UPDATE Bots SET status = 'offline' WHERE id = 2")

While True
 ToolTip("OPEN",0,0)
	;start magic
;~   	If Not ProcessExists("MTGO.exe") Then _STARTMTGO()
;~  	While Not WinExists($MTGOWINDOW)
;~  		Sleep($MTGOINPUTDELAY)
;~  	WEnd

;~ 	;login
;~  	_GETBOT("admin")
 	WinActivate($MTGOWINDOW,"")
 	Sleep($MTGOINPUTDELAY)

;~ 	If Not ( PixelGetColor(82, 56) == 16777215 ) Then
;~ 		_LOGIN()
;~ 	EndIf

	;open unread messages
 	_MTGO_POPUP()
	_OPENTOAST()
	_UNREAD_MESSAGE()
	;handle chat convo

	Sleep($MTGOINPUTDELAY)
WEnd

;~Smart Bot Features list:

;admin check buddies
;~ detect trade window
;~ detect user requesting trade
;~ accept trade
;~ decline trade
;~ function update queue (adds line to history, changes status)
;~ create wishlist from database
;~ load wishlist as taking from user
;~ detect more than 400 cards on runner (put up to 800 cards back to bank)
;~ detect which cards were taken/given in a successful trade
;~ undo runner actions with cancellation
;~ authenticate user with runner bot
;~connection error default msg to users
;~mousescroll button on PM
;~ cancelled
;~ new
;~ runner_claimed
;~ requested_user_email
;~ requested_user_code
;~ user_verified

;~ *withdrawal fork*
;~ waiting_for_bank_pre_trade
;~ bank_pre_trade_complete
;~ bank_pre_trade_inventory_updated
;~ waiting_for_user_trade
;~ user_trade_complete
;~ user_trade_inventory_updated

;~ 	*deposit fork*
;~ 	waiting_for_bank_post_trade
;~ 	bank_post_trade_complete
;~ 	bank_post_trade_inventory_updated
;~ finished

