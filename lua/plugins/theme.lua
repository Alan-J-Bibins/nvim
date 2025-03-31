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
        "rebelot/kanagawa.nvim",
        config = function()
            require('kanagawa').setup({
                transparent = true,
            })
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
        opts = {
            use_wallust = true,
            transparent_background = true,
        },
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
