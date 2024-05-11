return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = { enabled = false },
    },
    config = function ()
        require("ibl").setup()
    end
}
