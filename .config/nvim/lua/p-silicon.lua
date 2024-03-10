vim.g.silicon = {
    theme = 'OneHalfDark',
    font = 'Hack',
    background = '#AAAAFF',
    output = './',
    ['to-clipboard'] = true,
    ["round-corner"] = true,
    ["window-controls"] = true,
    ["shadow-color"] = '#555555',
    ["line-pad"] = 2,
    ["pad-horiz"] = 40,
    ["pad-vert"] = 40,
    ["shadow-blur-radius"] = 35,
    ["shadow-offset-x"] = 10,
    ["shadow-offset-y"] = 10,
    ["line-number"] = true,
}

local keymap = vim.keymap
keymap.set('v', '<leader>s', "<cmd>'<,'>Silicon<cr>")
