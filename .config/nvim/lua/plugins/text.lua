return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require("nvim-autopairs").setup {}
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            local cmp = require "cmp"
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        "Wansmer/treesj",
        keys = {
            { "<leader>m", function() require("treesj").toggle() end, desc = "[M]erge/Join" }
        },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            use_default_keymaps = false,
            max_join_length = 480,
        }
    },
    {
        "rmagatti/alternate-toggler",
        keys = { { "<leader>ta", function() require("alternate-toggler").toggleAlternate() end, desc = "[T]oggle [A]lternate" } },
        opts = { alternates = { ["=="] = "!=" } },
    }
}
