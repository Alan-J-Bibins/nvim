return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" , "clangd"},
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = lsp_capabilities
                        }) --automatically setup the lsp servers!!!
                    end,
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end)
            vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end)
            vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end)
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
                    vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
                    vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
                    vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
                    vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
                end
            })
        end,
    },
}
