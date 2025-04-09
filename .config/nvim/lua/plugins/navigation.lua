return {
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {},
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("harpoon")
        end,
        keys = {
            { "<leader>a", function() require("harpoon"):list():add() end, desc = "Add file to Harpoon" },
            { "<C-g>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle Harpoon menu" },
            { "<leader>j", function() require("harpoon"):list():select(1) end, desc = "Harpoon buffer 1" },
            { "<leader>k", function() require("harpoon"):list():select(2) end, desc = "Harpoon buffer 2" },
            { "<leader>l", function() require("harpoon"):list():select(3) end, desc = "Harpoon buffer 3" },
            { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Previous Harpoon buffer" },
            { "<C-n>", function() require("harpoon"):list():next() end, desc = "Next Harpoon buffer" },
        },
    }
}
