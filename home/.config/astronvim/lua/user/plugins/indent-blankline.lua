return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		whitespace = {
			remove_blankline_trail = true,
		},
		scope = {
			show_start = true,
			show_end = true,
			include = {
				node_type = {
					["*"] = { "*" },
				},
			},
		},
		indent = {
			smart_indent_cap = true,
		},
		exclude = {
			filetypes = {
				"checkhealth",
				"packer",
				"lspinfo",
				"git",
				"gitconfig",
				"markdown",
				"snippets",
				"text",
			},
		},
	},
}
