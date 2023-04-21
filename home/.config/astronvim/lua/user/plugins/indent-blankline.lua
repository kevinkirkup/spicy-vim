return {
	"lukas-reineke/indent-blankline.nvim",
	opts = {
		-- U+2502 may also be a good choice, it will be on the middle of cursor.
		-- U+250A is also a good choice
		-- char = "▏",
		space_char_blankline = " ",
		show_current_context = true,
		char_highlight_list = { "IndentBlanklineIndent" },
		show_end_of_line = false,
		disable_with_nolist = true,
		buftype_exclude = { "terminal", "nofile" },
		filetype_exclude = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"checkhealth",
			"packer",
			"lspinfo",
			"git",
			"gitconfig",
			"markdown",
			"snippets",
			"text",
		},
		use_treesitter = true,
	},
	config = require("user.plugins.configs.indent-blankline"),
}
