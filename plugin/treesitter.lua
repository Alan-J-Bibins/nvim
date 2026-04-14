vim.pack.add({
    'https://github.com/OXY2DEV/markview.nvim', --should be run before treesitter
    'https://github.com/nvim-treesitter/nvim-treesitter'
})

require('nvim-treesitter').install {
    'rust',
    'javascript',
    'typescript',
    'c',
    'cpp',
    'tsx',
    'jsx',
    'html',
    'astro',
    'css',
    'python',
    'java',
    'go',
}

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "typescriptreact", "typescript", "tsx" },
--     callback = function(args)
--         vim.treesitter.start(args.buf)
--     end,
-- })
--

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("EnableTreesitterHighlighting", { clear = true }),
  desc = "Try to enable tree-sitter syntax highlighting",
  pattern = "*", -- run on *all* filetypes
  callback = function()
    pcall(function() vim.treesitter.start() end)
  end,
})
