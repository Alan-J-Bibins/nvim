return {
    {
        "nvim-telescope/telescope-ui-select.nvim"
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set('n', '<tab>', builtin.buffers, { desc = "Find Buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Help Tags" })
            vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find,
                { desc = "Fuzzily Find In Current Buffer" })
            vim.keymap.set('n', '<leader>fr', "<CMD>Telescope oldfiles<CR>", { desc = "Find Recent Files" })


            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                },
                pickers = {
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
        end,

    },

}
