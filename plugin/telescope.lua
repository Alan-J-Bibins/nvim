vim.pack.add({
    'https://github.com/nvim-telescope/telescope-ui-select.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/piersolenski/import.nvim',
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<tab>", builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help Tags" })
vim.keymap.set(
    "n",
    "<leader>fc",
    builtin.current_buffer_fuzzy_find,
    { desc = "Fuzzily Find In Current Buffer" }
)
vim.keymap.set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Find Recent Files" })
vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, { desc = "Find Document Symbols" })
vim.keymap.set("n", "<leader>fws", builtin.lsp_workspace_symbols, { desc = "Find Workspace Symbols" })
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP references" })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definitions" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to implementation" })
vim.keymap.set("n", "go", builtin.lsp_type_definitions, { desc = "Go to type definitions" })
vim.keymap.set("n", "<leader>cc", "<CMD>Telescope colorscheme<CR>", { desc = "Change colorscheme" })

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            ".git",
            ".class",
        },
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
        },
        colorscheme = {
            enable_preview = true,
        },
        buffers = {
            show_all_buffers = true,
            sort_mru = true,
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
            },
        },
    },
})
require("telescope").load_extension("ui-select")

require('import').setup({
    picker = "telescope"
})
vim.keymap.set("n", "<leader>i", function() require("import").pick() end, {desc = "Call Upon Import.nvim"})
