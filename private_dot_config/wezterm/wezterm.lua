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
local function merge(default, overwrite)
	local result = {}
	for k, v in pairs(default or {}) do
		result[k] = v
	end
	for k, v in pairs(overwrite or {}) do
		if all({
			type(v) == 'table',
			type(result[k]) == 'table'
		})
			then result[k] = merge(result[k], v)
			else result[k] = v
		end
	end
	return result
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
config.background = merge(config.background, {
	source = { File = '/usr/share/backgrounds/ubuntu-default-greyscale-wallpaper.png' },
	opacity = 0.5
})
config.clean_exit_codes = { 0, 130 }
return config
