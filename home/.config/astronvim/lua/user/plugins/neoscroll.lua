-- Smoothie motions
return {
	"karb94/neoscroll.nvim",
	opts = {
		easing_function = "quadratic",
	},
	config = require("user.plugins.configs.neoscroll"),
}
