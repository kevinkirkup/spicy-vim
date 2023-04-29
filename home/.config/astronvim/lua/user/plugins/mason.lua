return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"ansiblels",
				"clangd",
				"dockerls",
				"gopls",
				"jsonls",
				"lua_ls",
				"pylsp",
				"pyright",
				"rust_analyzer",
				"sourcery",
				"sqlls",
				"taplo",
				"tflint",
				"vimls",
				"yamlls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"ansible-lint",
				"flake8",
				"misspell",
				"mypy",
				"protolint",
				"pyflakes",
				"pylint",
				"pyproject-flake8",
				"pyre",
				"staticcheck",
				"tflint",
				"stylua",
				"rustfmt",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
	},
}
