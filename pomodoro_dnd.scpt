(* Copyright © philastokes from applehelpwriter.com *)
(* Link: http://applehelpwriter.com/2014/12/10/applescript-toggle-notification-centre-yosemite *)
on enable_dnd()
	tell application "System Events" to tell application process "SystemUIServer"
		try
			(* Replace "Notification Center" with "NotificationCenter"
            here if you're targeting OS X 10.10 *)
			if not (exists menu bar item "Notification Center, Do Not Disturb enabled" of menu bar 1) then
				key down option
				click menu bar item "Notification Center" of menu bar 1
				key up option
			end if
		on error errStr number errorNumber
			key up option
		end try
	end tell
end enable_dnd

on disable_dnd()
	tell application "System Events" to tell application process "SystemUIServer"
		try
			if exists menu bar item "Notification Center, Do Not Disturb enabled" of menu bar 1 then
				key down option
				click menu bar item "Notification Center, Do Not Disturb enabled" of menu bar 1
				key up option
			end if
		on error errStr number errorNumber
			key up option
		end try
	end tell
end disable_dnd

on kill_app(app_name)
	tell application "System Events"
		set ProcessList to name of every process
		if app_name is in ProcessList then
			set ThePID to unix id of process app_name
			do shell script "kill" & " " & ThePID
		end if
	end tell
end kill_app

-- Your apps goes here
kill_app("Telegram")
kill_app("Mail")

enable_dnd()

-- 25 minutes session lenght
delay 25 * 60

disable_dnd()
