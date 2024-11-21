return {
    {
        "stevearc/conform.nvim",
        event = { "LspAttach", "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    html = { "prettierd" },
                    css = { "prettierd" },
                    javascript = { "prettierd" },
                    bash = { "shfmt" },
                    sh = { "shfmt" },
                    zsh = { "shfmt" },
                },
                -- format_on_save = {
                -- 	timeout_ms = 500,
                -- 	lsp_fallback = true,
                -- },
            })

            vim.keymap.set({ "n", "v" }, "<F3>", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 2500,
                })
            end, { desc = "Conform format" })
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                -- python = {"pylint"},
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

            vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                group = lint_augroup,
                callback = function()
                    lint.try_lint()
                end,
            })

            vim.keymap.set("n", "<leader>tl", function()
                lint.try_lint()
            end, { desc = "Trigger linting for current file" })
        end,
    },
}
