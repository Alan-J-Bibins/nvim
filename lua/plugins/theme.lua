return {
    { "sainnhe/sonokai" },
    { "ellisonleao/gruvbox.nvim" },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            require('nightfox').setup()
            vim.cmd.colorscheme "terafox"
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
                    theme = 'terafox',
                }
            })
        end
    },
}
