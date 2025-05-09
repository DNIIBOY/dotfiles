return {
    {
        "stevearc/oil.nvim",
        events = "VeryLazy",
        keys = {
            {
                "<leader>e",
                function()
                    -- Check if there's an existing oil buffer in a floating window
                    for _, win in pairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        local buf_name = vim.api.nvim_buf_get_name(buf)
                        if buf_name:match("^oil://") and vim.api.nvim_win_get_config(win).relative ~= "" then
                            -- Oil buffer in floating window found, close it and return
                            vim.api.nvim_win_close(win, true)
                            return
                        end
                    end

                    local current_file = vim.fn.expand("%:p")
                    local current_dir
                    if current_file and current_file ~= "" then
                        current_dir = vim.fn.fnamemodify(current_file, ":h")
                        vim.cmd("Oil --float " .. vim.fn.fnameescape(current_dir))
                    else
                        vim.cmd("Oil --float .")
                    end
                end, { desc = "Toggle Oil file explorer" }
            }
        },
        opts = {
            win_options = {
                signcolumn = "yes:2",
            },
            keymaps = {
                ["g."] = false,
                ["<Esc>"] = { "actions.close", mode = "n" },
            },
            view_options = {
                show_hidden = true
            },
            silence_scp_warning = true
        },
    },
    {

        "refractalize/oil-git-status.nvim",
        events = "VeryLazy",
        opts = {},
    }
}
