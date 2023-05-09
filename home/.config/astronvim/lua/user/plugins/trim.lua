return {
	"cappyzawa/trim.nvim",
	keys = {
		{ "<leader>dd", ":Trim<CR>", desc = "Trim Whitespace", silent = true },
	},
	opts = {
		ft_blocklist = {},
		patterns = {},
		trim_on_write = true,
		trim_trailing = true,
		trim_last_line = true,
		trim_first_line = true,
	},
}
