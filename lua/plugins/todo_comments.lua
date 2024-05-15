return{
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("todo-comments").setup()
        vim.keymap.set('n', '<leader>tc', '<cmd>TodoTelescope<CR>', {desc = "Open telescope for TODO comments"})
    end,
}
