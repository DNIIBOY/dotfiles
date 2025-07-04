return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                on_colors = function(colors)
                    colors.bg_float = colors.bg
                end,
            })
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "uga-rosa/ccc.nvim",
        event = "BufReadPost",
        opts = {
            highlighter = {
                auto_enable = true,
                lsp = true,
            },
            user_command = {
                enable = true,
                name = "CccPick",
                desc = "Pick a color",
            },
            window = {
                border = "rounded",
                title = "Color Picker",
                title_pos = "center",
            },
        }
    }
}
