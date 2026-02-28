-- return {
-- 	"nvim-java/nvim-java",
-- 	event = "VeryLazy",
--     disabled = true,
-- 	config = function()
-- 		require("java").setup({
-- 			java_test = {
-- 				enabled = false,
-- 			},
-- 			spring_boot_tools = {
-- 				enable = true,
-- 			},
-- 			jdk = {
-- 				auto_install = true,
-- 			},
-- 		})
-- 		vim.lsp.enable("jdtls")
-- 	end,
-- }
return {
    "mfussenegger/nvim-jdtls"
}
