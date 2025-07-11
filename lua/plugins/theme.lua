return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			local options = {
				transparent = true,
			}
			require("nightfox").setup({
				options = options,
			})
			vim.cmd.colorscheme("nightfox")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},
}
