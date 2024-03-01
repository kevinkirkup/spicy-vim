-- Syntax highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	-- TODO: Remove when treesitter creates a new release v0.9.1
	-- https://github.com/nvim-treesitter/nvim-treesitter/tags
	branch = "master",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = "User AstroFile",
	cmd = {
		"TSBufDisable",
		"TSBufEnable",
		"TSBufToggle",
		"TSDisable",
		"TSEnable",
		"TSToggle",
		"TSInstall",
		"TSInstallInfo",
		"TSInstallSync",
		"TSModuleInfo",
		"TSUninstall",
		"TSUpdate",
		"TSUpdateSync",
	},
	build = ":TSUpdate",
	opts = {
		-- Matchup configuration
		matchup = { enable = true, disable = {} },
		-- A list of parser names, or "all"
		ensure_installed = {
			"cpp",
			"eex",
			"elixir",
			"git_config",
			"gitignore",
			"go",
			"hcl",
			"heex",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"sql",
			"terraform",
			"vim",
			"yaml",
		},
		-- List of parsers to ignore installing (for "all")
		ignore_install = {}, -- List of parsers to ignore installing
		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,
		-- Automatically install missing parsers when entering buffer
		auto_install = true,
		highlight = {
			-- `false` will disable the whole extension
			enable = true,
			-- list of language that will be disabled
			-- disable = { "c", "rust" },
			disable = { "help" },
			additional_vim_regex_highlighting = true,
		},
	},
}
