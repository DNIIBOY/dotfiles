local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.scrolloff = 4
opt.sidescrolloff = 4

opt.hlsearch = true
opt.incsearch = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = 'yes'
opt.list = true

opt.termguicolors = true

if vim.fn.has('win32') == 1 then
    opt.shell = 'powershell.exe'
end

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 250
        })
    end
})
