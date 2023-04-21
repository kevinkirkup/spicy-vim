-- The missing auto-completion for cmdline!
return {
	{ "romgrk/fzy-lua-native" },
	{
		"gelguy/wilder.nvim",
		dependencies = {
			"romgrk/fzy-lua-native",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			modes = { ":", "/", "?" },
			next_key = "<Tab>",
			previous_key = "<S-Tab>",
			accept_key = "",
			reject_key = "<C-k>",
			enable_cmdline_enter = 1, -- for auto show
		},
		config = require("user.plugins.configs.wilder"),
	},
}
