-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- wezterm.on('gui-startup', function(window)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   local gui_window = window:gui_window();
--   gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
-- end)

wezterm.on('update-right-status', function(window, pane)
  local leader = ''
  if window:leader_is_active() then
    leader = wezterm.format {
      { Attribute = { Intensity = 'Bold' } },
      { Foreground = { Color = '#9ece6a' } },
      { Text = 'LEADER MODE' },
    }
  end
  window:set_right_status(leader)
end)

-- This table will hold the configuration.
local config = {}


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- For example, changing the color scheme:
config.color_scheme = 'Varix'

config.native_macos_fullscreen_mode = false

config.enable_kitty_keyboard = false
config.enable_csi_u_key_encoding = true

config.debug_key_events = true

config.term = "xterm-256color"

-- This is where you actually apply your config choices

config.color_scheme_dirs = { '~/.config/wezterm/colors' }

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.initial_cols = 150
config.initial_rows = 50

config.scrollback_lines = 5000

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Inter', weight = 'Regular' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 14.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#24283b',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#211b33',

  button_fg = '#e5ddff',
  button_bg = '#2c263f',
  button_hover_fg = '#e5ddff',
  button_hover_bg = '#3b3052',

  border_top_height = '0.75cell',
  border_top_color = "#1C2030"
}

config.font = wezterm.font('TwilioSansM Nerd Font', { weight = "Regular", stretch = "Normal" })
config.freetype_load_target = 'HorizontalLcd'
config.freetype_render_target = 'HorizontalLcd'
config.font_size = 13

config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#1a1b26',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#24283b',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1a1b26',
      fg_color = '#808080',

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#bb9af7',
      fg_color = '#1a1b26',
      italic = false,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#9aa5ce',
      fg_color = '#1a1b26',
      intensity = 'Bold',
      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#bb9af7',
      fg_color = '#1a1b26',
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

config.window_background_opacity = 0.85

-- window_decorations = "RESIZE"
config.window_decorations = "RESIZE"

config.disable_default_key_bindings = true

config.leader = { key = 'x', mods = 'ALT', timeout_milliseconds = 3000 }

config.keys = {
  { key = ' ', mods = 'LEADER', action = act.ActivateCommandPalette },
  { key = 'r', mods = 'LEADER', action = act.ReloadConfiguration },
  { key = 'n', mods = 'LEADER', action = act.SpawnWindow },
  { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab { confirm = false } },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = false } },
  { key = 'p', mods = 'LEADER', action = act.PasteFrom 'Clipboard' },
}
-- Swap Cmd <-> Ctrln on macOS
if wezterm.target_triple:match("darwin$") then
  for i = 0, 127 do
    local key = string.char(i)

    for _, mods in ipairs({ "|CTRL", "|SHIFT", "|CMD" }) do
      if mods == "" and (key == "c" or key == "v") then
        goto continue
      end
      for from, to in pairs({ CMD = "CTRL", CTRL = "CMD" }) do
        table.insert(config.keys, {
          key = key,
          mods = from .. mods,
          action = wezterm.action.SendKey({
            key = key,
            mods = to .. mods,
          }),
        })
      end
      ::continue::
    end
  end
end

-- and finally, return the configuration to wezterm
return config
