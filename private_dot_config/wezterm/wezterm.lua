local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.font_size = 20
config.font = wezterm.font 'Fira Code'
local act = wezterm.action
local act_rel = act.ActivateTabRelative
config.keys = {
	{ key = 'LeftArrow', mods = 'CTRL', action = act_rel(-1) },
	{ key = 'RightArrow', mods = 'CTRL', action = act_rel(1) },
	{ key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' }
}
return config
