vim.keymap.set("n", "<leader>s", ":vsplit<Return><C-w>w")
vim.keymap.set("n", "<leader>x", "<cmd>:q<cr>", { silent = true })

vim.keymap.set("n", "<Left>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<Up>", ":resize -1<CR>")
vim.keymap.set("n", "<Down>", ":resize +1<CR>")

vim.keymap.set("n", "<C-s>", ":%s//g<Left><Left>")
vim.keymap.set("n", "<Esc>", ":noh <CR>", { silent = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

vim.keymap.set("n", "<leader>n", "<cmd>:cn<cr>", { silent = true })
vim.keymap.set("n", "<leader>p", "<cmd>:cp<cr>", { silent = true })
