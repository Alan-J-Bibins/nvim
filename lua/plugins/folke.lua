return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		--@type Flash.Config
		opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "<leader>r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "<leader>R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Library items can be absolute paths
				-- "~/projects/my-awesome-lib",
				-- Or relative, which means they will be resolved as a plugin
				-- "LazyVim",
				-- When relative, you can also provide a path to the library in the plugin dir
				"luvit-meta/library", -- see below
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{
		"folke/snacks.nvim",
		priority = 1000,
		---@type snacks.Config
		opts = {
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
					underline = false, -- underline the start of the scope
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
					{ section = "startup" },
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				mydiags = {
					mode = "diagnostics", -- inherit from diagnostics mode
					filter = {
						any = {
							buf = 0, -- current buffer
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
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
