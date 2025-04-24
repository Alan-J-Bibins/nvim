return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.surround").setup()
        require("mini.ai").setup()
        require("mini.pairs").setup()
        -- require("mini.indentscope").setup({
        --     symbol = "|",
        -- })
        require("mini.comment").setup()
        require("mini.files").setup({
            config = function()
                vim.api.nvim_create_autocmd('User', {
                    pattern = 'MiniFilesWindowOpen',
                    callback = function(args)
                        local win_id = args.data.win_id

                        -- Customize window-local settings
                        vim.wo[win_id].winblend = 50
                        local config = vim.api.nvim_win_get_config(win_id)
                        config.border, config.title_pos = 'double', 'right'
                        vim.api.nvim_win_set_config(win_id, config)
                    end,
                })
            end
        })
        require("mini.move").setup()

        vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = "Open mini files" })
    end
}
