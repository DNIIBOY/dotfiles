local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp_mappings,
})

cmp.setup.filetype('sql,mysql,plsql', {
    sources = { { name = 'vim-dadbod-completion' } }
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format() end, opts)
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<cr>', opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

    -- format on save
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
    --   buffer = bufnr,
    --   callback = function()
    --     vim.lsp.buf.format()
    --   end
    -- })
end)

lsp.setup()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'pylsp'
    },
    handlers = {
        lsp.default_setup,
    },
    automatic_installation = true,
})

vim.diagnostic.config({
    virtual_text = true
})
