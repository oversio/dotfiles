local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Geist Mono")
-- config.font = wezterm.font("JetBrains Mono")
config.font_size = 19

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

return config
