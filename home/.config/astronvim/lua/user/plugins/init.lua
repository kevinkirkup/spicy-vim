return {
	-- it is recommended to put impatient.nvim before any other plugins
	{
		"lewis6991/impatient.nvim",
		lazy = false,
		priority = 1,
	},

	-- Super fast buffer jump
	-- { "phaazon/hop.nvim", event = "VimEnter", config = function() vim.defer_fn(function() require("user.plugins.configs.nvim_hop") end, 2000) end },

	-- { "vim-airline/vim-airline" }
	-- { "vim-airline/vim-airline-themes" }

	-- Vim tabular plugin for manipulate tabular, required by markdown plugins
	-- use { "godlygeek/tabular", cmd = { "Tabularize" } }

	-- Plug 'rizzatti/dash.vim'
	-- Plug 'ctrlpvim/ctrlp.vim'
	-- Plug 'ervandew/supertab'
	-- Plug 'wincent/command-t', { 'tag': '5.0.4' }

	-- Language Plugins
	-- { "keith/swift.vim", ft = "swift" },
	-- { "manicmaniac/coconut.vim", ft = "coconut" },

	-- { "fatih/vim-go", tag = "v1.26", ft = "go" },
	-- { "rhysd/vim-go-impl", ft = "go" },

	-- { "Glench/Vim-Jinja2-Syntax", ft = "jinja" },
}
