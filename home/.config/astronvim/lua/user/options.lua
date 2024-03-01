return {
	opt = {
		undofile = false,
		compatible = false,
		termguicolors = true,
		foldmethod = "expr",
		foldexpr = "nvim_treesitter#foldexpr()",
		conceallevel = 2,
	},
	g = {
		-- logging_level = "info",
		loaded_perl_provider = 0,
		python3_host_prog = "/opt/homebrew/anaconda3/bin/python3",
		neoformat_only_msg_on_error = 1,
		neo_tree_remove_legacy_commands = true,
	},
}
