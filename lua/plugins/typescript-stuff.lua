return {
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "astro",
            "html",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
}
