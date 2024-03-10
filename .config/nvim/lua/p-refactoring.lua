require('refactoring').setup()

vim.keymap.set("x", "<leader>re", ":Refactor extract<CR>")
vim.keymap.set("x", "<leader>rv", ":Refactor extract_var<CR>")
vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var<CR>")
