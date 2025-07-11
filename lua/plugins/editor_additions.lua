return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
			require("oil").setup({
				default_file_explorer = true,
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
	{
		"tversteeg/registers.nvim",
		cmd = "Registers",
		config = true,
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		name = "registers",
	},
	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				";",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe buffer menu",
			},
		},
		config = function()
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
		end,
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		event = "VeryLazy",
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
		},
		cmd = {
			-- NOTE: The Subs command name can be customized via the option "substitude_command_name"
			"Subs",
			"TextCaseOpenTelescope",
			"TextCaseOpenTelescopeQuickChange",
			"TextCaseOpenTelescopeLSPChange",
			"TextCaseStartReplacingCommand",
		},
		-- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
		-- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
		-- available after the first executing of it or after a keymap of text-case.nvim has been used.
		lazy = false,
	},
	{
		"aaronik/treewalker.nvim",

		-- The following options are the defaults.
		-- Treewalker aims for sane defaults, so these are each individually optional,
		-- and setup() does not need to be called, so the whole opts block is optional as well.
		opts = {
			-- Whether to briefly highlight the node after jumping to it
			highlight = true,

			-- How long should above highlight last (in ms)
			highlight_duration = 250,

			-- The color of the above highlight. Must be a valid vim highlight group.
			-- (see :h highlight-group for options)
			highlight_group = "CursorLine",

			-- Whether the plugin adds movements to the jumplist -- true | false | 'left'
			--  true: All movements more than 1 line are added to the jumplist. This is the default,
			--        and is meant to cover most use cases. It's modeled on how { and } natively add
			--        to the jumplist.
			--  false: Treewalker does not add to the jumplist at all
			--  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
			--          likely one to be confusing, so it has its own mode.
			jumplist = true,
		},
		config = function()
			-- movement
			vim.keymap.set({ "n", "v" }, "<M-S-k>", "<cmd>Treewalker Up<cr>", { silent = true })
			vim.keymap.set({ "n", "v" }, "<M-S-j>", "<cmd>Treewalker Down<cr>", { silent = true })
			vim.keymap.set({ "n", "v" }, "<M-S-h>", "<cmd>Treewalker Left<cr>", { silent = true })
			vim.keymap.set({ "n", "v" }, "<M-S-l>", "<cmd>Treewalker Right<cr>", { silent = true })

			-- swapping
			-- vim.keymap.set('n', '<C-S-k>', '<cmd>Treewalker SwapUp<cr>', { silent = true })
			-- vim.keymap.set('n', '<C-S-j>', '<cmd>Treewalker SwapDown<cr>', { silent = true })
			-- vim.keymap.set('n', '<C-S-h>', '<cmd>Treewalker SwapLeft<cr>', { silent = true })
			-- vim.keymap.set('n', '<C-S-l>', '<cmd>Treewalker SwapRight<cr>', { silent = true })
		end,
	},
}
