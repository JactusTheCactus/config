local helpers = require 'helpers'
local wezterm = require 'wezterm'
wezterm.on("update-status", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local dimensions = pane:get_dimensions()
	overrides.enable_scroll_bar = helpers.all({
		dimensions.scrollback_rows > dimensions.viewport_rows,
		not pane:is_alt_screen_active()
	})
	window:set_config_overrides(overrides)
end)
local act = wezterm.action
local act_rel = act.ActivateTabRelative
local fira = wezterm.font 'Fira Code'
return helpers.merge(wezterm.config_builder(), {
	background = {
		{
			source = { File = '/usr/share/backgrounds/ubuntu-wallpaper-d.png' },
			opacity = 0.95,
			vertical_align = 'Middle',
			horizontal_align = 'Center',
		},
	},
	clean_exit_codes = { 130 },
	colors = {
		scrollbar_thumb = '#666',
		visual_bell = '#444',
	},
	custom_block_glyphs = false,
	default_cursor_style = 'BlinkingBar',
	enable_wayland = false,
	font = fira,
	font_size = 20,
	keys = {
		{ mods = 'CTRL', key = 'LeftArrow', action = act_rel(-1) },
		{ mods = 'CTRL', key = 'RightArrow', action = act_rel(1) },
		{ mods = 'CTRL', key = 't', action = act.SpawnTab 'CurrentPaneDomain' },
	},
	log_unknown_escape_sequences = true,
	min_scroll_bar_height = '2cell',
	quote_dropped_files = 'Posix',
	selection_word_boundary = ' \t\n{}[]()"\'`.,;:/?~!@#$%^&*-=+|<>',
	show_tab_index_in_tab_bar = false,
	swallow_mouse_click_on_pane_focus = true,
	swallow_mouse_click_on_window_focus = true,
	ui_key_cap_rendering = 'WindowsSymbols',
	visual_bell = {
		fade_in_duration_ms = 150,
		fade_in_function = 'EaseIn',
		fade_out_duration_ms = 150,
		fade_out_function = 'EaseOut',
	},
	window_content_alignment = {
		horizontal = 'Center',
		vertical = 'Center',
	},
	window_frame = {
		font = fira,
		font_size = 16,
	},
})
