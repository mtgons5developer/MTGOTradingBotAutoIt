
Func _TRADE_CHECK()

;YOU GET LEFT TOP EDGE
If Not PixelGetColor(466, 472) = 15452028 Then MsgBox(0,'Error Position', "YOU GET LEFT EDGE")
;YOU GET RIGHT TOP EDGE
If Not PixelGetColor(471, 472) = 15452028 Then MsgBox(0,'Error Position', "YOU GET RIGHT TOP EDGE")

;YOU GIVE RIGHT TOP EDGE
If Not PixelGetColor(9, 472) = 15452028 Then MsgBox(0,'Error Position', "YOU GIVE RIGHT TOP EDGE")

;YOU GIVE LEFT TOP EDGE
If Not PixelGetColor(928, 472) = 15452028 Then MsgBox(0,'Error Position', "YOU GIVE LEFT TOP EDGE")

If $CONSOLE = 'YES' Then _CONSOLEWRITE("Trade_Check Passed")

EndFunc