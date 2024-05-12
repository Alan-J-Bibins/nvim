return {
	{
		"stevearc/conform.nvim",
		event = { "LspAttach", "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					html = { "prettier" },
					css = { "prettier" },
					javascript = { "prettier" },
				},
				-- format_on_save = {
				-- 	timeout_ms = 500,
				-- 	lsp_fallback = true,
				-- },
			})

			vim.keymap.set({ "n", "v" }, "<F3>", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 2500,
				})
			end, { desc = "Conform format" })
		end,
	},
}
