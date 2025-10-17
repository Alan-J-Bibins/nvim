return {
	"nvim-java/nvim-java",
	event = "VeryLazy",
	config = function()
		require("java").setup({
			java_test = {
				enabled = false,
			},
			spring_boot_tools = {
				enable = true,
			},
			jdk = {
				auto_install = false,
			},
		})
		vim.lsp.enable("jdtls")
	end,
}
