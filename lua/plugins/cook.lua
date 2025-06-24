return {
    "07CalC/cook.nvim",
    config = function()
        require("cook").setup({
            runners = {
                py = "'python3 %s'",
                c = "'gcc %s -o %s && .%s'",
                cpp = "'g++ %s -o %s && .%s'",
                rs = "'cargo run'",
                js = "'node %s'",
                ts = "'node %s'",
                go = "'go run %s'",
            }
        })
        vim.keymap.set('n', '<leader>cS', '<CMD>Cook<CR>', { desc = "Start COOKing" })
    end,
    cmd = "Cook",
}
