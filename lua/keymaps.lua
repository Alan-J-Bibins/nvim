--Miscalleaneous keymaps go here
local map = vim.keymap

map.set('n', '<C-d>', '<C-d>zz')
map.set('n', '<C-u>', '<C-u>zz')
map.set('n', '<leader>p' , '\"_dP')
map.set('n', '<leader>y' , '\"+y') --yank to system clipboard
map.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map.set("n", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })
