vim.pack.add({
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
})

require("nightfox").setup({
    options = {
        transparent = true,
    },
})
vim.cmd.colorscheme("nightfox")

require("lualine").setup({})
