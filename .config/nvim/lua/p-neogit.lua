local neogit = require('neogit')

neogit.setup()
vim.keymap.set('n', '<leader>gs', neogit.open, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gm', ':Neogit merge<CR>', { noremap = true, silent = true })
