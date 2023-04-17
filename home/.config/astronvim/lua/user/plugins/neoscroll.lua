-- Smoothie motions
return {
	"karb94/neoscroll.nvim",
	event = "VimEnter",
	config = function()
		vim.defer_fn(require("user.plugins.configs.neoscroll"), 2000)
	end,
}
