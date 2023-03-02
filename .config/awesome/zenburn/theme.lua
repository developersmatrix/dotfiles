-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local themes_path = require("gears.filesystem").get_themes_dir()
local rnotification = require("ruled.notification")
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = "/home/neo/.config/awesome/zenburn/zenburn-background.png"
-- }}}

-- {{{ Styles
theme.font      = "jet brains mono nerd font 10"

-- {{{ Colors
theme.fg_normal  = "#DCDCCC"
theme.fg_focus   = "#00ff87"
theme.fg_urgent  = "#CC9393"
theme.bg_normal  = "#3F3F3F"
theme.bg_focus   = "#1E2320"
theme.bg_urgent  = "#3F3F3F"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(5)
theme.border_width  = dpi(2)
theme.border_color_normal = "#3F3F3F"
theme.border_color_active = "#00ff87"
theme.border_color_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_fg_focus = "#000000"
theme.taglist_bg_focus =  "#00ff87"
theme.taglist_fg_occupied =  "#00ff87"
-- beautiful.taglist_fg_focus	The tag list main foreground (text) color.
-- beautiful.taglist_bg_focus	The tag list main background color.
-- beautiful.taglist_fg_urgent	The tag list urgent elements foreground (text) color.
-- beautiful.taglist_bg_urgent	The tag list urgent elements background color.
-- beautiful.taglist_bg_occupied	The tag list occupied elements background color.
-- beautiful.taglist_fg_occupied	The tag list occupied elements foreground (text) color.
-- beautiful.taglist_bg_empty	The tag list empty elements background color.
-- beautiful.taglist_fg_empty	The tag list empty elements foreground (text) color.
-- beautiful.taglist_bg_volatile	The tag list volatile elements background color.
-- beautiful.taglist_fg_volatile	The tag list volatile elements foreground (text) color.
-- beautiful.taglist_squares_sel	The selected elements background image.
-- beautiful.taglist_squares_unsel	The unselected elements background image.
-- beautiful.taglist_squares_sel_empty	The selected empty elements background image.
-- beautiful.taglist_squares_unsel_empty	The unselected empty elements background image.
-- beautiful.taglist_squares_resize	If the background images can be resized.
-- beautiful.taglist_disable_icon	Do not display the tag icons, even if they are set.
-- beautiful.taglist_font	The taglist font.
-- beautiful.taglist_spacing	The space between the taglist elements.
-- beautiful.taglist_shape	The main shape used for the elements.
-- beautiful.taglist_shape_border_width	The shape elements border width.
-- beautiful.taglist_shape_border_color	The elements shape border color.
-- beautiful.taglist_shape_empty	The shape used for the empty elements.
-- beautiful.taglist_shape_border_width_empty	The shape used for the empty elements border width.
-- beautiful.taglist_shape_border_color_empty	The empty elements shape border color.
-- beautiful.taglist_shape_focus	The shape used for the selected elements.
-- beautiful.taglist_shape_border_width_focus	The shape used for the selected elements border width.
-- beautiful.taglist_shape_border_color_focus	The selected elements shape border color.
-- beautiful.taglist_shape_urgent	The shape used for the urgent elements.
-- beautiful.taglist_shape_border_width_urgent	The shape used for the urgent elements border width.
-- beautiful.taglist_shape_border_color_urgent	The urgents elements shape border color.
-- beautiful.taglist_shape_volatile	The shape used for the volatile elements.
-- beautiful.taglist_shape_border_width_volatile	The shape used for the volatile elements border width.
-- beautiful.taglist_shape_border_color_volatile	The volatile elements shape border color.
-- -- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(25)
theme.menu_width  = dpi(150)
-- }}}

-- {{{ Icons
-- {{{ Taglist
-- theme.taglist_squares_sel   = themes_path .. "zenburn/taglist/squarefz.png"
-- theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "zenburn/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "zenburn/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "zenburn/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "zenburn/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "zenburn/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "zenburn/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "zenburn/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "zenburn/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "zenburn/layouts/dwindle.png"
theme.layout_max        = themes_path .. "zenburn/layouts/max.png"
theme.layout_fullscreen = themes_path .. "zenburn/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "zenburn/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "zenburn/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "zenburn/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "zenburn/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "zenburn/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "zenburn/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
-- theme.titlebar_bar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
