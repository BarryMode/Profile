tell application "QuickTime Player"
	--activate
	new screen recording
	start document 1
	--two hours in seconds
	delay 7200
	stop document 1
	save document 1 in file "~/downloads/output.mov"
	quit
end tell