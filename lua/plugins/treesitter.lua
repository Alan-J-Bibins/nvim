return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "go", "vim", "vimdoc", "c", "lua", "java", "python", "rust", "typescript", "javascript", "css", "tsx", "html", "prisma" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
