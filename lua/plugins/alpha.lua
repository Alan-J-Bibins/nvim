return {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        vim.b.miniindentscope_disable = true

        dashboard.section.header.val = {
            [[ __  __                                             ]],
            [[/\ \/\ \                          __                ]],
            [[\ \ `\\ \     __    ___   __  __ /\_\    ___ ___    ]],
            [[ \ \ , ` \  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]],
            [[  \ \ \`\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("b", "  > Browse files", ":Oil --float<CR>"),
            dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "  > Config", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}