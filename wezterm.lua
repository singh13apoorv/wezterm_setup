-- Pull in the wezterm API
local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- Font
config.font = wezterm.font("MesloLGS NF")
config.font_size = 22

config.automatically_reload_config = true

config.window_decorations = "RESIZE"

-- Tab bar
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Meslo NF", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 18.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#1e1e2f",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#1e1e2f",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		-- Active tab
		active_tab = {
			bg_color = "#151520",
			fg_color = "#fee1a8",
		},
		-- Inactive tab
		inactive_tab = {
			bg_color = "#1e1e30",
			fg_color = "#fee1a8",
		},
		inactive_tab_edge = "#0e0e3f",
	},
}

config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
