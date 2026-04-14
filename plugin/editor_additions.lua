vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/leath-dub/snipe.nvim',
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
require("oil").setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
    },
})

require("snipe").setup({
    ui = {
        position = "topleft",
        open_win_override = {
            border = "rounded",
        },
        preselect_current = true,
        text_align = "file-first",
    },
    hints = {
        -- dictionary = "sadflewcmpghio",
        dictionary = "asdflewcmpghio",
    },
})
vim.keymap.set("n", ";", function () require("snipe").open_buffer_menu() end, {desc = "Open Snipe buffer menu"})
