local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local battery_widget = wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = false
    },
    {
        id = "percentage",
        widget = wibox.widget.textbox,
        font = "sans 12"
    },
    layout = wibox.layout.fixed.horizontal
}

local update_widget = function()
    awful.spawn.easy_async("upower -i $(upower -e | grep 'BAT')", 
    function(stdout)
        local percentage = string.match(stdout, "percentage:%s+(%d+)%%")
        local status = string.match(stdout, "state:%s+(%w+)")

        if status == "discharging" then
            if tonumber(percentage) <= 20 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-discharging-20.png")
            elseif tonumber(percentage) <= 40 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-discharging-40.png")
            elseif tonumber(percentage) <= 60 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-discharging-60.png")
            elseif tonumber(percentage) <= 80 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-discharging-80.png")
            else
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-discharging-100.png")
            end
        else
            if tonumber(percentage) <= 20 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-charging-20.png")
            elseif tonumber(percentage) <= 40 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-charging-40.png")
            elseif tonumber(percentage) <= 60 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-charging-60.png")
            elseif tonumber(percentage) <= 80 then
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-charging-80.png")
            else
                battery_widget.icon:set_image(awful.util.get_themes_dir() .. "default/icons/battery-charging-100.png")
            end
        end

update_widget()

local battery_timer = gears.timer {
    timeout = 10,
    autostart = true,
    callback = update_widget
}

battery_widget
