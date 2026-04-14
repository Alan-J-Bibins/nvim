vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup()
require('mason-tool-installer').setup({
    ensure_installed = {
        "rust_analyzer",
        "gopls",
        "bashls",
        "eslint",
        "lua_ls",
        "basedpyright",
        "clangd",
        "html",
        "cssls",
        "ts_ls",
        "tailwindcss",
        "markdown_oxide",
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, blink_capabilities)

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config("clangd", {
    cmd = {
        "clangd",
        "--fallback-style=webkit",
        "--compile-commands-dir=.",
        "--background-index",
        "-j=12",
        "--query-driver=/usr/bin/gcc,/usr/bin/g++,/usr/bin/clang*,/home/*/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-*"
    },
    capabilities = blink_capabilities,
})

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
        vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
        end, opts)
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
