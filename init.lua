vim.g.mapleader = " "

--setting up pwsh as the default terminal


--OPTIONS HERE:
local opt = vim.opt -- aliasing

-- line number
opt.number = true
opt.relativenumber = true

-- tabs & intendation
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

--setting up lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)
