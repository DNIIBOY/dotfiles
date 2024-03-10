vim.cmd [[colorscheme tokyonight-night]]

vim.cmd([[highlight DiagnosticVirtualTextError guibg=#2428w3b]])
vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=#2428w3b]])
vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=#2428w3b]])
vim.cmd([[highlight DiagnosticVirtualTextHint guibg=#2428w3b]])

vim.fn.sign_define({
    {
        name = 'DiagnosticSignError',
        text = '',
        texthl = 'DiagnosticSignError',
        linehl = 'ErrorLine',
    },
    {
        name = 'DiagnosticSignWarn',
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'WarningLine',
    },
    {
        name = 'DiagnosticSignInfo',
        text = '',
        texthl = 'DiagnosticSignInfo',
        linehl = 'InfoLine',
    },
    {
        name = 'DiagnosticSignHint',
        text = '',
        texthl = 'DiagnosticSignHint',
        linehl = 'HintLine',
    },
})
