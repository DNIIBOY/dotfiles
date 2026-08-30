-- Defaults
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = "1.5",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto-left",
    scale = "auto",
})

-- Specific monitors
-- Metrig Ultrawide
hl.monitor({
    output = "desc:Lenovo Group Limited LEN T34w-20 V307V8KZ",
    mode = "3440x1440@60",
    position = "1280x-200",
    scale = "1.25",
})

-- Metrig Vertical
hl.monitor({
    output = "desc:Lenovo Group Limited P27q-20 V909LPW7",
    mode = "2560x1440@60",
    position = "4032x-500",
    scale = "1.25",
    transform = 1,
})

hl.monitor({
    output = "desc:Lenovo Group Limited P27q-20 V909LPW4",
    mode = "2560x1440@60",
    position = "0x-1152",
    scale = "1.25",
})

hl.monitor({
    output = "desc:Lenovo Group Limited P27q-20 V909LRMD",
    mode = "2560x1440@60",
    position = "-1152x-1500",
    scale = "1.25",
    transform = 3,
})

hl.monitor({
    output = "desc:Hisense Electric Co. Ltd. HISENSE 0x00000001",
    mode = "preferred",
    position = "auto-center-up",
    scale = "1.25",
})

-- Sandy
hl.monitor({
    output = "desc:Samsung Electric Company SAMSUNG 0x01000000",
    mode = "preferred",
    position = "auto-left",
    transform = 1,
})

hl.monitor({
    output = "desc:Lenovo Group Limited LEN P24q-20 V308H1NY",
    mode = "preferred",
    position = "auto-center-up",
    scale = "1.25",
})

hl.monitor({
    output = "desc:Ancor Communications Inc VG248 GCLMQS086688",
    mode = "preferred",
    position = "-1920x-800",
    scale = "auto",
})

-- Settings
hl.config({
    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },
})
