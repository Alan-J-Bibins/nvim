return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    enabled = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {}
        vim.keymap.set('n', '<leader>E', '<cmd>NvimTreeToggle<CR>', {desc = 'Toggle Nvim Tree'})

    end,
}
