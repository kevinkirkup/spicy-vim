return {
	opt = {
		undofile = false,
		compatible = false,
		termguicolors = true,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
	},
	g = {
		-- logging_level = "info",
		python3_host_prog = "/usr/local/bin/python3",
		neoformat_only_msg_on_error = 1,
		neo_tree_remove_legacy_commands = true,
	},
}
