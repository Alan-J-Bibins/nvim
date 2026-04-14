vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter'
})

require('nvim-treesitter').install { 
    'rust',
    'javascript',
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
