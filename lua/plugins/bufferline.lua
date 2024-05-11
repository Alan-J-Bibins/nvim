return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                always_show_bufferline = false
            },
        })
        vim.keymap.set('n', '<leader>pb', ':BufferLinePick<CR>', { desc = "Pick a buffer using beginning letter" })
        vim.keymap.set('n', "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
        vim.keymap.set('n', "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
        vim.keymap.set('n', '<leader>bx', '<cmd>bdelete<cr>', { desc = "Delete current buffer" })
        vim.keymap.set('n', '<leader>box', "<Cmd>BufferLineCloseOthers<CR>",
            { desc = "Delete buffers other than current buffer" })
    end
}
