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
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			sources = {},
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
				"terraform-ls",
				"stylua",
			},
			automatic_installation = false,
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
	},
}
