local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})


local actions = require('telescope.actions')
require('nvim-web-devicons').setup({
    override = {},
    default = true
})


require('telescope').setup {
    defaults = {
        path_display = { 'smart' },
        mappings = {
            i = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<esc>"] = actions.close
            },
            n = {
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<esc>"] = actions.close
            }
        }
    },
    layout_config = {
        horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6
        }
    }
}
