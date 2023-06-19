local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.initial_cols = 150
config.initial_rows = 50
config.scrollback_lines = 9999

-- default is JetBrains Mono
config.font = wezterm.font_with_fallback {
  'MesloLGS NF',
  'JetBrains Mono',
}
config.color_scheme = 'Monokai Pro (Gogh)'
config.font_size = 14
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 13.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 12

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

config.keys = {
  {
    key = 'h',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'CTRL|ALT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'h',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(1),
  },
  {
    key = 't',
    mods = 'CTRL|ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
}

return config