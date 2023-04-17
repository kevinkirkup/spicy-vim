return {
	-- it is recommended to put impatient.nvim before any other plugins
	{
		"lewis6991/impatient.nvim",
		config = function()
			require('impatient')
		end,
		lazy = false,
	},

	-- { "junegunn/fzf", run = function() vim.fn['fzf#Install']() end },

	-- Super fast buffer jump
	-- { "phaazon/hop.nvim", event = "VimEnter", config = function() vim.defer_fn(function() require("user.plugins.configs.nvim_hop") end, 2000) end },


	-- Themes
	-- { "wadackel/vim-dogrun", opt = true },
	-- { "rakr/vim-one", opt = true },
	-- { "hzchirs/vim-material", opt = true },
	-- { "embark-theme/vim", opt = true },
	-- { "drewtempelmeyer/palenight.vim", opt = true },
	-- { "cocopon/iceberg.vim", opt = true },
	-- { "fenetikm/falcon", opt = true },
	-- { "jarodl/cobalt.vim", opt = true },
	-- { "travisjeffery/vim-colors", opt = true },
	-- { "arcticicestudio/nord-vim", opt = true },
	-- { "mhartington/oceanic-next", opt = true },

	-- { "vim-airline/vim-airline" }
	-- { "vim-airline/vim-airline-themes" }


	-- Vim tabular plugin for manipulate tabular, required by markdown plugins
	-- use { "godlygeek/tabular", cmd = { "Tabularize" } }

	-- use { "folke/zen-mode.nvim", cmd = "ZenMode", config = function() require('user.plugins.configs.zen-mode') end }


	-- Plug 'rizzatti/dash.vim'
	-- Plug 'ctrlpvim/ctrlp.vim'
	-- Plug 'ervandew/supertab'
	-- Plug 'wincent/command-t', { 'tag': '5.0.4' }

	-- Language Plugins
	-- { "keith/swift.vim", ft = "swift" },
	-- { "simrat39/rust-tools.nvim", ft = "rust", config = function() require('user.plugins.configs.rust-tools') end },
	-- { "hashivim/vim-terraform", ft = "terraform" },
	-- { "manicmaniac/coconut.vim", ft = "coconut" },

	-- { "fatih/vim-go", tag = "v1.26", ft = "go" },
	-- { "rhysd/vim-go-impl", ft = "go" },

	-- { "vim-erlang/vim-erlang-compiler", ft = "erlang" },
	-- { "vim-erlang/vim-erlang-omnicomplete", ft = "erlang" },

	-- { "vim-scripts/Vim-R-plugin", ft = "r" },
	-- { "hspec/hspec", ft = "haskell" },

	-- { "klen/python-mode", tag = "0.13.0", ft = "python" },
	-- { "sebdah/vim-delve", ft = "python" },

	-- { "leafgarland/typescript-vim", ft = "typescript" },
	-- { "pangloss/vim-javascript", commit = "e9a59c8", ft = "javascript" },
	-- { "heavenshell/vim-jsdoc", ft = "javascript" },

	-- { "Glench/Vim-Jinja2-Syntax", ft = "jinja" },
}
