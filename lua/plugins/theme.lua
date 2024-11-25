return {
    { "sainnhe/sonokai" },
    {
        "ellisonleao/gruvbox.nvim",
        opts = {
            transparent_mode = true,
        }
    },
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
        config = function()
            require("everforest").setup({
                transparent_background_level = 2,
            })
        end,
    },
    {
        "RedsXDD/neopywal.nvim",
        name = "neopywal",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
            })
        end
    },
}
