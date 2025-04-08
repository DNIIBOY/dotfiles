return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                on_colors = function(colors)
                    colors.bg_float = colors.bg
                    colors.border = colors.border_highlight
                end,
            })
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
}
