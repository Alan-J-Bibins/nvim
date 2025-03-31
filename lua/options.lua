local opt = vim.opt -- aliasing

-- line number
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true

opt.scrolloff = 8
vim.o.winborder = 'none'

vim.g.mkdp_browser = 'firefox'
