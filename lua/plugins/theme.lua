return {
    { "sainnhe/sonokai" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            local options = {
                transparent = true
            }
            require('nightfox').setup({
                options = options
            })
            vim.cmd.colorscheme "nightfox"
        end,
    },
    {
        "neanias/everforest-nvim",
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'nightfox',
                }
            })
        end
    },
}
