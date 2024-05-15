--Miscalleaneous keymaps go here
local map = vim.keymap

map.set('i', '<C-h>', '<C-w>') --ctrl backspace support, idk why this is ctrl h in neovim but ya

map.set('n', '<C-d>', '<C-d>zz')
map.set('n', '<C-u>', '<C-u>zz')
map.set('n', '<leader>p' , '\"_dP')
map.set('n', '<leader>y' , '\"+y') --yank to system clipboard
map.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map.set("n", "<leader>Y", '"+Y', { desc = "Yank to clipboard" })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- tabs
map.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- windows
map.set("n", "<leader>ww", "<C-W>p", { desc = "Other Window" })
map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
map.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below" })
map.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right" })
map.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below" })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right" })
