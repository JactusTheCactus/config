-- Helpers
local function all(conditions)
	for _, v in ipairs(conditions) do
		if not v then return false end
	end
	return true
end
local function any(conditions)
	for _, v in ipairs(conditions) do
		if v then return true end
	end
	return false
end
-- Config
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
	overrides.enable_scroll_bar = all({
		dimensions.scrollback_rows > dimensions.viewport_rows,
		not pane:is_alt_screen_active()
	})
	window:set_config_overrides(overrides)
end)
config.background.opacity = 0.5
return config
