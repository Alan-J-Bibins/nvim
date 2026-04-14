vim.pack.add({
    'https://github.com/folke/which-key.nvim',
    'https://github.com/folke/flash.nvim',
    'https://github.com/Bilal2453/luvit-meta',
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/folke/snacks.nvim',
    'https://github.com/folke/trouble.nvim',
    'https://github.com/nvim-lua/plenary.nvim', --dep for todo-comments.nvim
    'https://github.com/folke/todo-comments.nvim',
    'https://github.com/folke/ts-comments.nvim',
})

require("which-key").setup()

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
    require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "<leader>S", function()
    require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set("o", "<leader>r", function()
    require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "o", "x" }, "<leader>R", function()
    require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set("c", "<c-s>", function()
    require("flash").toggle()
end, { desc = "Toggle Flash Search" })


require('lazydev').setup({
    library = {
        -- Library items can be absolute paths
        -- "~/projects/my-awesome-lib",
        -- Or relative, which means they will be resolved as a plugin
        -- "LazyVim",
        -- When relative, you can also provide a path to the library in the plugin dir
        "luvit-meta/library", -- see below
    },
})

require('snacks').setup(
    {
        quickfile = { enabled = true },
        input = { enabled = true },
        indent = {
            enable = true,
            indent = {
                enabled = true,
                hl = "SnacksIndent",
            },
            scope = {
                enabled = true, -- enable highlighting the current scope
                priority = 200,
                char = "│",
                underline = false,    -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "SnacksDashboardKey", ---@type string|string[] hl group for scopes
            },
            chunk = {
                enabled = false,
                hl = "SnacksDashboardKey",
            },
        },
        dashboard = {
            enabled = true,
            sections = {
                {
                    text = {
                        { [[ __  __                                             ]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[/\ \/\ \                          __                ]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[\ \ `\\ \     __    ___   __  __ /\_\    ___ ___    ]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[ \ \ , ` \  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[  \ \ \`\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                },
                {
                    text = {
                        { [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]], hl = "SnacksDashboardKey" },
                    },
                    indent = 4,
                    padding = 2,
                },
                {
                    icon = " ",
                    key = "f",
                    desc = "Find File",
                    action = ":lua Snacks.dashboard.pick('files')",
                    padding = 1,
                },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert", padding = 1 },
                {
                    icon = " ",
                    key = "g",
                    desc = "Find Text",
                    action = ":lua Snacks.dashboard.pick('live_grep')",
                    padding = 1,
                },
                {
                    icon = " ",
                    key = "r",
                    desc = "Recent Files",
                    action = ":lua Snacks.dashboard.pick('oldfiles')",
                    padding = 1,
                },
                { icon = " ", key = "c", desc = "Config", action = ":e $MYVIMRC | :cd %:p:h", padding = 1 },
                {
                    icon = "󰒲 ",
                    key = "L",
                    desc = "Lazy",
                    action = ":Lazy",
                    enabled = package.loaded.lazy ~= nil,
                    padding = 1,
                },
                { icon = " ", key = "q", desc = "Quit", action = ":qa", padding = 1 },
                {
                    icon = " ",
                    desc = "Browse Repo",
                    padding = 1,
                    key = "b",
                    action = function()
                        Snacks.gitbrowse()
                    end,
                },
                function()
                    local in_git = Snacks.git.get_root() ~= nil
                    local cmds = {
                        {
                            title = "Open Issues",
                            cmd = "gh issue list -L 3",
                            key = "i",
                            action = function()
                                vim.fn.jobstart("gh issue list --web", { detach = true })
                            end,
                            icon = " ",
                            height = 7,
                        },
                        {
                            icon = " ",
                            title = "Open PRs",
                            cmd = "gh pr list -L 3",
                            key = "P",
                            action = function()
                                vim.fn.jobstart("gh pr list --web", { detach = true })
                            end,
                            height = 7,
                        },
                        {
                            icon = " ",
                            title = "Git Status",
                            cmd = "git --no-pager diff --stat -B -M -C",
                            height = 10,
                        },
                    }
                    return vim.tbl_map(function(cmd)
                        return vim.tbl_extend("force", {
                            pane = 2,
                            section = "terminal",
                            enabled = in_git,
                            padding = 1,
                            ttl = 5 * 60,
                            indent = 3,
                        }, cmd)
                    end, cmds)
                end,
            },
        },
    }
)


require('trouble').setup({
    modes = {
        mydiags = {
            mode = "diagnostics", -- inherit from diagnostics mode
            filter = {
                any = {
                    buf = 0,                                      -- current buffer
                    {
                        severity = vim.diagnostic.severity.ERROR, -- errors only
                        -- limit to files in the current project
                        function(item)
                            return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
                        end,
                    },
                },
            },
        },
    },
})

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
    desc = "Diagnostics (Trouble)"
})

vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
    desc = "Buffer Diagnostics (Trouble)"
})

vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", {
    desc = "Symbols (Trouble)"
})

vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {
    desc = "LSP Definitions / references / ... (Trouble)"
})

vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", {
    desc = "Location List (Trouble)"
})

vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", {
    desc = "Quickfix List (Trouble)"
})

require("todo-comments").setup()
vim.keymap.set('n', '<leader>tc', '<cmd>TodoTelescope<CR>', { desc = "Open telescope for TODO comments" })
