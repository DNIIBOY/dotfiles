local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.enable_tab_bar = false

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { "powershell.exe", "-NoLogo" }
end

config.keys = {
    {
        key = "F11",
        action = wezterm.action.ToggleFullScreen,
    }
}

return config
