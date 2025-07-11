return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},

		config = function()
			local ls = require("luasnip")
			vim.keymap.set({ "i", "s" }, "<A-n>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			vim.keymap.set({ "i", "s" }, "<A-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<A-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })
		end,
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",
		opts = {
			keymap = { preset = "enter" },
			appearance = {
				nerd_font_variant = "normal",
			},
			snippets = { preset = "luasnip" },
			completion = {
				documentation = {
					window = {
						border = "rounded",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					},
					auto_show = true,
					auto_show_delay_ms = 400,
				},
				menu = {
					scrollbar = true,
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
						gap = 2,
						components = {
							kind_icon = {
								text = function(ctx)
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
			},
			signature = { window = { border = "rounded" } },
			sources = {
				default = { "lazydev", "lsp", "snippets", "path", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
						timeout_ms = 20,
					},
					lsp = {
						timeout_ms = 20,
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		config = function(_, opts)
			require("blink.cmp").setup(opts)
		end,
		opts_extend = { "sources.default" },
	},
}
