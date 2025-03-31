--this file sets up all the plugins related to lsp
--commented keymaps are taken care of by telescope
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ensure_installed = { "prettierd", "shfmt" },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup({
                ensure_installed = { "rust_analyzer", "gopls", "bashls", "jdtls", "eslint", "lua_ls", "pyright", "clangd",
                    "html", "cssls", "ts_ls", "tailwindcss", "markdown_oxide" },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = lsp_capabilities,
                        }) --automatically setup the lsp servers!!!
                    end,
                    --put specific server handlers down here
                    ["clangd"] = function()
                        require("lspconfig").clangd.setup {
                            cmd = {
                                "clangd",
                                "--fallback-style=webkit"
                            }
                        }
                    end
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- vim.lsp.buf.hover({
            --     border = "rounded",
            -- })

            vim.keymap.set("n", "gl", function()
                vim.diagnostic.open_float()
            end)

            local hover = vim.lsp.buf.hover
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.lsp.buf.hover = function()
                return hover({
                    border = "rounded",
                    -- max_width = 100,
                    max_width = math.floor(vim.o.columns * 0.7),
                    max_height = math.floor(vim.o.lines * 0.7),
                })
            end
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", function()
                        vim.lsp.buf.hover()
                    end, opts)
                    -- vim.keymap.set("n", "gd", function()
                    --     vim.lsp.buf.definition()
                    -- end, opts)
                    vim.keymap.set("n", "gD", function()
                        vim.lsp.buf.declaration()
                    end, opts)
                    -- vim.keymap.set("n", "gi", function()
                    --     vim.lsp.buf.implementation()
                    -- end, opts)
                    -- vim.keymap.set("n", "go", function()
                    --     vim.lsp.buf.type_definition()
                    -- end, opts)
                    -- vim.keymap.set("n", "gr", function()
                    --     vim.lsp.buf.references()
                    -- end, opts)
                    vim.keymap.set("n", "gs", function()
                        vim.lsp.buf.signature_help()
                    end, opts)
                    vim.keymap.set("n", "<F2>", function()
                        vim.lsp.buf.rename()
                    end, { desc = "Rename" })
                    vim.keymap.set("n", "<F4>", function()
                        vim.lsp.buf.code_action()
                    end, opts)
                end,
            })
        end,
    },
}
