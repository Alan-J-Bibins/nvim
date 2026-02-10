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
				"html",
				"cssls",
				"ts_ls",
				"tailwindcss",
				"markdown_oxide",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_enable = {
					enabled = true,
					exclude = {
						"clangd",
					},
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Setting up all lsps to use blink's capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, blink_capabilities)

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("clangd", {
				cmd = { "clangd", "--fallback-style=webkit" },
				capabilities = blink_capabilities,
			})
			vim.lsp.enable("clangd")

			vim.lsp.config("glsl_analyzer", {
				cmd = { "glsl_analyzer" }, -- Default stdio mode [web:25]
				capabilities = blink_capabilities,
				filetypes = { "glsl" }, -- Supports .glsl, .vert, .frag, etc.
				root_markers = { ".git" },
			})
			vim.lsp.enable("glsl_analyzer")

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
