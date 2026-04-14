vim.pack.add({
    'https://github.com/karb94/neoscroll.nvim',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/kevinhwang91/promise-async', --dependency for nvim-ufo
    'https://github.com/kevinhwang91/nvim-ufo',
    'https://github.com/gbprod/yanky.nvim',
    'https://github.com/luukvbaal/statuscol.nvim',
})

require("neoscroll").setup({
    mappings = { -- Keys to be mapped to their corresponding default scrolling animation
        "<C-u>",
        "<C-d>",
        "<C-b>",
        "<C-f>",
        "<C-y>",
        "<C-e>",
        "zt",
        "zz",
        "zb",
    },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    duration_multiplier = 1.0, -- Global duration multiplier
    easing = "linear", -- Default easing function
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
    ignored_events = { -- Events ignored while scrolling
        "WinScrolled",
        "CursorMoved",
    },
})

require('nvim-highlight-colors').setup({
    render = "background",
})

vim.diagnostic.config({ virtual_text = false })
require("tiny-inline-diagnostic").setup({
    options = {
        multilines = {
            enabled = true,
            always_show = true
        },
    },
})

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zK", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        vim.lsp.buf.hover()
    end
end, { desc = "Peek Fold" })
require("ufo").setup({
    provider_selecter = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
    end,
})

require("yanky").setup({
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 150,
    },
})

local builtin = require("statuscol.builtin")
require("statuscol").setup({
    foldfunc = "builtin",
    setopt = true,
    relculright = true,
    segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
    },
})
