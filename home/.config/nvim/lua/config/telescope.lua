local telescope = require("telescope")

telescope.load_extension('fzf')
telescope.load_extension('aerial')

telescope.setup({
	extensions = {
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				["_"] = false, -- This key will be the default
				json = true, -- You can set the option for specific filetypes
				yaml = true,
			},
		},
	},
})
