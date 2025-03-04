local eventtap = require("hs.eventtap")
local caffeinate = require("hs.caffeinate")
local usb = require("hs.usb")
local inspect = require("hs.inspect")

local usbWatcher = nil

function usbDeviceCallback(data)
	-- print(hs.inspect(data))
	local keys = eventtap.checkKeyboardModifiers()
	if data["productName"] == "YubiKey OTP+FIDO+CCID" then
		-- don't lock screen if cmd key is pressed
		if data["eventType"] == "removed" and keys.cmd ~= true then
			caffeinate.lockScreen()
		end
	end
end

usbWatcher = usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
