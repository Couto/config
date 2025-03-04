--
-- Caffeine: prevents the Mac from falling asleep.
--
-- I pulled the icons from here:
-- http://jimmygreen.deviantart.com/art/Retina-Caffeine-menubar-icons-350451587
--

local menubar = require("hs.menubar")
local alert = require("hs.alert")
local caffeinate = require("hs.caffeinate")
local notify = require("hs.notify")

local caffeineMenubar = menubar.new()

local function updateCaffeineDisplay(state)
	if state then
		caffeineMenubar:setIcon("images/caffeine-active.png")
		notify.show("Hammerspoon", "Caffeine enabled", "Display will not lock")
	else
		caffeineMenubar:setIcon("images/caffeine-inactive.png")
		notify.show("Hammerspoon", "Caffeine disabled", "Display will lock")
	end
end

caffeineMenubar:setClickCallback(function()
	updateCaffeineDisplay(caffeinate.toggle("displayIdle"))
end)

updateCaffeineDisplay(caffeinate.get("displayIdle"))
