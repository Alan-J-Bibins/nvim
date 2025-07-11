--this file sets up all the plugins related to lsp
--commented keymaps are taken care of by telescope
return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local servers = {
				"rust_analyzer",
				"gopls",
				"bashls",
				"eslint",
				"lua_ls",
				"basedpyright",
				"clangd",
				"jdtls",
				"html",
				"cssls",
				"ts_ls",
				"tailwindcss",
				"markdown_oxide",
			}
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_enable = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- vim.lsp.buf.hover({
			--     border = "rounded",
			-- })

			-- Setting up all lsps to use blink's capabilities
			local lspconfig_util = require("lspconfig").util
			lspconfig_util.default_config.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_util.default_config.capabilities,
				require("blink.cmp").get_lsp_capabilities()
			)

			vim.keymap.set("n", "gl", function()
				vim.diagnostic.open_float()
			end)

			local hover = vim.lsp.buf.hover
			---@diagnostic disable-next-line: duplicate-set-field
			vim.lsp.buf.hover = function()
				return hover({
					border = "rounded",
					-- max_width = 100,
					max_width = math.floor(vim.o.columns * 0.7),
					max_height = math.floor(vim.o.lines * 0.7),
				})
			end
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "K", function()
						vim.lsp.buf.hover()
					end, opts)
					-- vim.keymap.set("n", "gd", function()
					--     vim.lsp.buf.definition()
					-- end, opts)
					vim.keymap.set("n", "gD", function()
						vim.lsp.buf.declaration()
					end, opts)
					-- vim.keymap.set("n", "gi", function()
					--     vim.lsp.buf.implementation()
					-- end, opts)
					-- vim.keymap.set("n", "go", function()
					--     vim.lsp.buf.type_definition()
					-- end, opts)
					-- vim.keymap.set("n", "gr", function()
					--     vim.lsp.buf.references()
					-- end, opts)
					vim.keymap.set("n", "gs", function()
						vim.lsp.buf.signature_help()
					end, opts)
					vim.keymap.set("n", "<F2>", function()
						vim.lsp.buf.rename()
					end, { desc = "Rename" })
					vim.keymap.set("n", "<F4>", function()
						vim.lsp.buf.code_action()
					end, opts)
				end,
			})
		end,
	},
}
