return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1  -- Only if make is installed
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
        { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "[F]ind [G]it files" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "[F]ind [D]iagnostics" },
        { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "[F]ind [R]esume" },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "[F]ind [W]ord" },
        { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "[F]ind [B]ranch" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]ind [H]elp" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]ind [K]eymaps" },
        { "<leader>ft", "<cmd>Telescope builtin<cr>", desc = "[F]ind [T]elescope" },
        { "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
    },
    config = function()
        -- See `:help telescope` and `:help telescope.setup()`
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
    end,
}
