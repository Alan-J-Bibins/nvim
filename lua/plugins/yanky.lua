return {
	"gbprod/yanky.nvim",
	config = function()
		require("yanky").setup({
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 150,
			},
		})
	end,
}
