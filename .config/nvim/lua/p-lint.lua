require('lint').linters_by_ft = {
    python = { 'pylint', },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    callback = function()
        require('lint').try_lint()
    end,
})
