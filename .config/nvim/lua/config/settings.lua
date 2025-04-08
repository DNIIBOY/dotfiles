vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.encoding = "utf-8"

vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.autoread = true
vim.bo.autoread = true

vim.opt.signcolumn = "yes"
vim.opt.list = true

vim.opt.termguicolors = true

if vim.fn.has("win32") == 1 then
    vim.opt.shell = "powershell.exe"
end

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 250
        })
    end
})
