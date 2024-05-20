vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

vim.lsp.set_log_level('debug')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = event.buf }
            vim.keymap.set(mode, lhs, rhs, opts)
        end
        -- Trigger code completion
        bufmap('i', '<C-Space>', '<C-x><C-o>')

        -- Display documentation of the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- Jump to the definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- Jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- Lists all the implementations for the symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- Jumps to the definition of the type symbol
        bufmap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- Lists all the references
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- Displays a function's signature information
        bufmap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- Renames all references to the symbol under the cursor
        bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- Format current file
        bufmap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>')

        -- Selects a code action available at the current cursor position
        bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')

        --Java specific
        bufmap('n', '<leader>ev', '<cmd>lua require(\'jdtls\').extract_variable()<cr>')
        bufmap('v', '<leader>ev', '<Esc><cmd>lua require(\'jdtls\').extract_variable(true)<cr>')
        bufmap('v', '<leader>em', '<Esc><cmd>lua require(\'jdtls\').extract_method(true)<cr>')
        bufmap('n', '<leader>ei', '<cmd>lua require(\'jdtls\').extract_interface()<cr>')
        bufmap('n', '<leader>ec', '<cmd>lua require(\'jdtls\').extract_constant()<cr>')
        bufmap('v', '<leader>ec', '<Esc><cmd>lua require(\'jdtls\').extract_constant(true)<cr>')
        bufmap('n', '<leader>oi', '<cmd>lua require(\'jdtls\').organize_imports()<cr>')
    end,
})


-- nvim-cmp
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, { { name = 'buffer' } }),
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

})
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, { { name = 'buffer' } })
})
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})
cmp.setup.filetype('sql', {
    sources = {
        { name = 'vim-dadbod-completion' },
        { name = 'buffer' },
    },
})
