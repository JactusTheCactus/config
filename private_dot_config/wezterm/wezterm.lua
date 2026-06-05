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
wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local dimensions = pane:get_dimensions()
	overrides.enable_scroll_bar =
		dimensions.scrollback_rows > dimensions.viewport_rows and
		not pane:is_alt_screen_active()
	window:set_config_overrides(overrides)
end)
return config
