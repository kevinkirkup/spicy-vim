-- Bufferline
return {
	"akinsho/bufferline.nvim",
	event = "VimEnter",
	requires = { "nvim-tree/nvim-web-devicons" },
	config = require("user.plugins.configs.bufferline"),
}
