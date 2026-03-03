-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Window size
config.initial_cols = 120
config.initial_rows = 28

-- Font
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 14

-- Color scheme
config.color_scheme = "Dracula"

-- Cursor: blinking bar like modern terminals
config.default_cursor_style = "BlinkingBar"

-- Padding: breathing room around the terminal content
config.window_padding = {
	left = 12,
	right = 12,
	top = 10,
	bottom = 10,
}

-- macOS: frosted glass background
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

-- Hide the tab bar when only one tab is open
config.hide_tab_bar_if_only_one_tab = true

-- Use the fancy macOS-integrated tab bar when tabs are shown
config.use_fancy_tab_bar = true

-- Scrollback: keep lots of history
config.scrollback_lines = 10000

-- Copy text as soon as you select it (no need to cmd+c)
config.selection_word_boundary = " \t\n{}[]()\"'`,;:@│"

-- Silence the terminal bell
config.audible_bell = "SystemBeep"

-- Don't resize the window when changing font size
config.adjust_window_size_when_changing_font_size = false

-- Detect URLs and make them clickable
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Pane keybindings (Vim-style with Cmd)
config.keys = {
	-- Split panes
	{ key = "/", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CMD", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Navigate panes
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Resize panes
	{ key = "h", mods = "CMD|OPT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "CMD|OPT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "CMD|OPT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "CMD|OPT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	-- Close pane
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

return config
