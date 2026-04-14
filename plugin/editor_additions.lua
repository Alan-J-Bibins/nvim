vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/leath-dub/snipe.nvim',
    'https://github.com/stevearc/quicker.nvim',
    'https://github.com/aaronik/treewalker.nvim',
    'https://github.com/rareitems/printer.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    'https://github.com/nvim-lua/plenary.nvim', --dep for undotree
    'https://github.com/jiaoshijie/undotree',
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
vim.keymap.set("n", ";", function() require("snipe").open_buffer_menu() end, { desc = "Open Snipe buffer menu" })

require('quicker').setup()
require('treewalker').setup({
    highlight = true,
    highlight_duration = 250,
    highlight_group = "CursorLine",
    jumplist = true,
})
vim.keymap.set({ "n", "v" }, "<M-S-k>", "<cmd>Treewalker Up<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<M-S-j>", "<cmd>Treewalker Down<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<M-S-h>", "<cmd>Treewalker Left<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<M-S-l>", "<cmd>Treewalker Right<cr>", { silent = true })

require("printer").setup({
    keymap = "gp",
    formatters = {
        lua = function(text_inside, text_var)
            return string.format("print([[%s = ]] .. %s)", text_inside, text_var)
        end,

        python = function(text_inside, text_var)
            return string.format('print("%s =", %s)', text_inside, text_var)
        end,

        javascript = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
        end,

        typescript = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
        end,

        typescriptreact = function(text_inside, text_var)
            return string.format('console.log("%s = ", %s)', text_inside, text_var)
        end,

        go = function(text_inside, text_var)
            return string.format('fmt.Println("%s = ", %s)', text_inside, text_var)
        end,

        vim = function(text_inside, text_var)
            return string.format('echo "%s = ".%s', text_inside, text_var)
        end,

        rust = function(text_inside, text_var)
            return string.format([[println!("%s = {:#?}", %s);]], text_inside, text_var)
        end,

        zsh = function(text_inside, text_var)
            return string.format('echo "%s = $%s"', text_inside, text_var)
        end,

        bash = function(text_inside, text_var)
            return string.format('echo "%s = $%s"', text_inside, text_var)
        end,

        sh = function(text_inside, text_var)
            return string.format('echo "%s = $%s"', text_inside, text_var)
        end,

        java = function(text_inside, text_var)
            return string.format('System.out.println("%s = " + %s);', text_inside, text_var)
        end,

        cs = function(text_inside, text_var)
            return string.format('System.Console.WriteLine("%s = " + %s);', text_inside, text_var)
        end,

        cpp = function(text_inside, text_var)
            return string.format('std::cout << "%s = " << %s << std::endl;', text_inside, text_var)
        end,

        ruby = function(inside, variable)
            return string.format('pp "%s = ", %s', inside, variable)
        end,
    },
})

require('treesitter-context').setup({
    multiline_threshold = 20,
    max_lines = 5,
})

vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", {desc = "Open Undotree"})
