local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function footer()
    local datetime = os.date(" %d-%m-%Y   %H:%M")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. nvim_version_info
end

local logo = {
    "⠀⢖⢴⡢⣖⢴⡢⣖⢴⡢⡖⡴⣔⢤⡠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⡰⡦⡲⣔⠦⣦⢄⠀⠀⠀⠀⠀⠀⠀⢠⢖⢴⡢⡖⣴⢤⣀⠀⠀⢀⢖⢖⢖⢖⢖⢶⡤⡀⠀⢐⢖⢖⢖⢖⠶⣦⢤⡀",
    "⠠⣏⢞⢮⡪⡺⣪⢎⣞⢜⡝⣮⢪⢧⡫⣝⢳⡢⣄⠀⠀⠀⠀⠀⢈⢞⡵⡹⣎⢮⢳⢕⢯⣳⡀⠀⠀⠀⠀⠀⢸⢕⢧⡫⡺⣜⢷⣝⠀⠀⢠⡫⡳⣝⢕⢯⡺⣝⢧⠀⢸⡣⣫⢳⢝⣕⢟⣮⡃",
    "⠐⡧⣫⢎⡗⡽⡮⡾⣜⢧⡻⢼⢕⢧⡳⡹⣪⢳⣍⡻⣦⠀⠀⠀⠠⣳⡹⣪⢎⣗⢝⡵⣣⢳⡽⡄⠀⠀⠀⠀⢸⢕⢧⢻⢜⢮⡳⣝⠀⠀⠠⡻⣜⢎⢷⡱⡻⣮⡇⠀⢸⢕⢧⡫⣮⢪⣟⣼⡃⠀",
    "⢈⡗⡵⣹⢪⢞⡽⣺⠀⠀⠀⠀⠀⠀⠙⣜⣕⢳⢎⡞⣼⣳⡀⠀⠰⣕⢝⢮⡪⣎⢗⡕⣗⢵⡹⣞⡄⠀⠀⠀⢸⢕⢧⡫⡳⣝⡽⣺⠀⠀⠀⠈⠉⠛⠑⠋⠛⠊⠓⠀⠀⠈⠑⠛⠊⠓⠑⠓⠃⠀",
    "⢐⣝⢎⢷⡱⣫⢞⢷⠀⠀⠀⠀⠀⠀⠀⠨⣎⢗⡝⡮⡲⣝⣧⠀⠸⡜⡧⡳⣕⢽⣎⢞⢮⡪⣞⢜⢟⣆⠀⠀⢸⡣⣳⡹⡪⣞⣝⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⢐⢵⡫⡺⣜⢵⡫⡷⠀⠀⠀⠀⠀⠀⠀⠀⣗⢝⣜⢝⢮⡺⡾⡄⢘⢮⡫⣞⢜⢮⡳⣯⢪⢞⡜⡧⣫⢞⣧⠀⢸⡕⡵⣹⢪⢞⡵⣯⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀",
    "⠐⡧⡻⡜⡮⣪⢟⡽⠀⠀⠀⠀⠀⠀⠀⢀⢯⡪⣎⢷⡱⣻⡺⡆⢘⢮⢺⢜⢧⡫⣻⢮⡃⢳⡹⡪⣞⢜⡳⣗⣜⢎⡗⡵⣫⢺⡵⣯⠀⠀⠰⣕⢵⢕⢵⢕⡽⡳⡦⠀⢸⡪⡮⡪⡮⣪⢯⡳⡆⠀",
    "⠨⣫⢞⢼⢕⣝⣯⡺⠀⠀⠀⠀⠀⠀⠀⢰⡣⡯⣪⢞⡜⣷⢝⠆⢨⢳⢝⡕⡧⣫⢗⣟⠆⠀⢹⡪⣎⢗⡝⡮⣮⢣⢏⡞⡼⣱⡻⣮⠀⠀⠨⣎⢗⡝⣎⢗⡽⣝⢧⠀⢸⢎⢞⢵⢝⡜⣷⢝⡇⠀",
    "⠨⣎⢷⡱⡳⢮⡮⣻⠀⠀⠀⠀⠀⠀⡠⣳⡹⣪⢎⡞⣼⡳⣻⠀⢨⡳⣕⢝⢮⡚⣷⢝⡇⠀⠀⠱⡝⡮⡺⣪⢎⢗⡝⡼⣕⢽⡺⣵⠀⠀⢘⢮⡣⣫⢎⡗⡽⣮⠧⠀⢸⡣⡯⣪⢇⢟⣮⡻⡆⠀",
    "⠨⡺⣪⢎⢷⡱⡻⢮⢀⡀⣀⣀⢤⡲⡝⡮⣪⢳⢕⡽⣮⡻⠅⠀⠰⣕⢝⢮⡣⡻⣮⡻⡆⠀⠀⠀⠙⣜⢵⢣⢏⢞⢮⡺⣜⢵⡻⣮⠀⠀⢨⡣⣏⢞⢮⡪⣻⣺⡓⠀⢸⢎⡞⡼⡱⡳⣵⣫⠇⠀",
    "⢈⢷⡱⡝⢮⢮⡹⣣⢫⢞⡜⡮⣣⡫⣺⡱⣣⢏⡾⣵⡫⠋⠀⠀⢘⢎⢷⡱⡝⡮⣞⣽⡂⠀⠀⠀⠀⠘⡵⡹⡕⡯⣪⢞⡜⣵⢻⡮⠀⠀⠀⠙⠪⢳⡕⣝⢮⡳⡝⠀⠈⠑⠫⣎⢯⢺⡵⣝⡇⠀",
    "⢐⢧⡫⡺⣕⢧⡫⣎⢗⡵⡹⣎⢮⡺⣜⢮⡳⣯⠺⠊⠀⠀⠀⠀⠨⡳⣕⢝⢮⡺⣕⢷⡅⠀⠀⠀⠀⠀⠈⢏⡞⣵⡱⣣⢏⣞⢷⡽⠀⠀⢀⢀⡠⣞⢜⣮⡳⣝⡇⠀⡀⣀⢤⡪⡳⣕⣟⢮⠃⠀",
    "⠀⠉⠙⠫⠚⠓⠝⠪⠛⠪⠛⠪⠓⠙⠊⠓⠉⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠕⠛⠎⠳⠁⠀⠀⠀⠀⠀⠀⠀⠈⠑⠫⠓⠫⠚⠓⠝⠀⠀⢝⡵⣕⡽⡺⣮⡻⠎⠀⠀⢯⡪⣧⡻⣞⢵⡝⠋⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠘⠙⠉⠈⠀⠀⠀⠀⠀⠈⠓⠙⠈⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⢠⢄⢤⢤⢤⢤⢤⢤⢤⢤⢤⢤⢤⢤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⡤⡤⡤⣤⣤⣀⠤⢤⢤⢤⢤⣀⠀⠀⠀⠀⠠⡤⡤⡤⡤⡤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⢀⡤⡤⡤⡤⡤⡤⡤⣄⠀",
    "⢕⢯⡪⡳⣕⢗⡕⣗⢕⢗⡕⣗⢕⢗⣜⢎⡻⡲⣄⡀⠀⠀⠀⠀⢀⢴⡫⡺⣪⢞⢾⢮⠞⠕⠁⠀⠈⠳⣕⢭⠳⣦⣄⠀⠀⠘⢮⡺⡪⡞⡴⣍⢿⣄⠀⠀⠀⠀⠀⢀⢮⡺⣪⢺⡪⣳⡳⡽⣮⠃",
    "⢝⣎⢗⡽⡸⣧⡻⣜⢧⡻⢼⢮⢳⢕⡵⣹⡪⡳⣍⢿⣆⠀⠀⢠⢮⡣⡻⣜⢷⣝⠗⠉⠀⠀⠀⠀⠀⠀⠈⢳⢝⢦⡫⣷⡀⠀⠀⢯⡪⣫⢞⡜⡵⣫⣆⠀⠀⠀⢀⢮⡣⡫⡮⡣⣯⢞⡽⡺⠁⠀",
    "⢵⢕⢽⢜⡕⣯⡺⡇⠀⠀⠀⠀⠀⢘⢮⡪⣞⢕⢧⡻⡮⡇⢀⢷⡱⣝⢮⣯⡳⠍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢫⡺⡪⣮⡻⣄⠀⠀⢫⢎⡞⡼⣱⢣⣟⢦⠀⢀⢮⡣⡻⣜⢎⢷⣝⢯⡚⠁⠀⠀",
    "⡳⣹⢪⢧⡫⣞⣽⡃⠀⠀⠀⠀⢀⡸⣕⢵⢣⢯⣪⢟⣞⠇⡼⡱⣕⢝⡷⣵⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣗⢝⢦⡻⣞⡄⠀⠀⠱⣝⢎⡗⡵⡹⡯⣦⢪⢧⡫⣞⢜⡳⣯⣺⠓⠀⠀⠀⠀",
    "⢮⢳⢕⢧⢳⢭⡪⡳⡲⡲⡲⡲⡝⣮⢪⡳⣕⢧⡻⣕⠟⢀⣟⢜⣎⣟⢞⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⡫⡞⣼⢳⡧⠀⠀⠀⠘⡵⣹⡪⣳⡹⣪⢳⢕⢧⡫⣞⢽⢮⠋⠀⠀⠀⠀⠀",
    "⢳⢝⡵⡹⡕⡧⡻⣜⢝⢮⡫⡺⡪⡮⣣⢏⡞⣽⡙⠊⠀⠰⡕⢷⠬⣯⣫⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡪⡳⣹⡳⣻⠀⠀⠀⠀⠘⢎⢞⡜⡮⣣⡫⡳⣕⢟⣮⡻⠁⠀⠀⠀⠀⠀⠀",
    "⢝⢮⡪⣫⢎⣟⢞⡞⠗⠷⠝⠾⠵⡹⣪⢺⡪⣮⣙⢷⣄⠀⡯⣳⢹⢮⡳⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣳⢹⢎⢾⣝⣽⠀⠀⠀⠀⠀⠈⢣⢏⣞⢜⡎⣷⢝⡯⡞⠁⠀⠀⠀⠀⠀⠀⠀",
    "⢝⡎⡷⡱⡣⣯⣫⡇⠀⠀⠀⠀⠀⠀⢕⢗⢵⡪⣎⢷⣝⢧⠹⡜⡧⣫⢟⡵⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢕⡝⣵⣫⢞⡮⠀⠀⠀⠀⠀⠀⣹⢪⢎⢧⡫⣺⣝⢾⠁⠀⠀⠀⠀⠀⠀⠀⠀",
    "⣝⢜⣝⢎⠷⣵⢳⡇⠀⠀⠀⠀⠀⢀⣏⢷⡱⡳⡕⢷⣝⢿⠀⢻⢜⢮⡹⣻⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡳⣹⢪⣞⡵⣻⠂⠀⠀⠀⠀⠀⠀⢼⡱⣫⢺⡪⣺⢮⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⢼⢕⡵⡹⣕⢝⡵⡣⡦⡲⣔⢖⢮⢳⢕⢧⡫⣎⢯⡳⣝⢯⠀⠀⠫⣎⢷⡩⢿⣄⠀⠀⠀⠀⠀⠀⠀⠀⣔⢧⡫⣎⢷⣝⢾⠅⠀⠀⠀⠀⠀⠀⠀⢺⢜⡕⡧⣫⢺⡳⣝⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⢳⡕⣝⢮⡪⡧⣫⢺⡜⡵⡣⡯⣪⡳⣹⢪⣞⡼⣳⣝⠮⠁⠀⠀⠀⠈⠪⡳⣕⢝⢦⡄⠀⠀⠀⣀⢔⢯⡪⣞⢼⣝⢷⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⣹⢪⢞⡕⡧⣫⡻⣞⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠑⠙⢮⠺⡞⡮⡳⢵⠯⣞⢵⡫⡞⢾⠵⡫⠮⠻⠊⠊⠀⠀⠀⠀⠀⠀⠀⠈⠈⠓⠷⢝⠷⢤⠘⠑⠟⠾⡪⢯⠳⠝⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⠷⡝⢾⢜⢯⢞⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = "Keyword"

dashboard.section.buttons.val = {
    dashboard.button("<Leader>ff", "  Find File"),
    dashboard.button("<Leader>fg", "  Find Git File"),
    dashboard.button("<Leader>fw", "  Find Word"),
    dashboard.button("q", "  Quit", ":qa<cr>")
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

