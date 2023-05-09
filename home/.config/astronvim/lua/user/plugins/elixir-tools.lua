if true then
	return {
		"elixir-tools/elixir-tools.nvim",
		ft = { "elixir", "eex", "heex", "surface" },
		keys = {
			{
				"<space>r",
				vim.lsp.codelens.run,
				desc = "Run Codelens under cursor.",
				buffer = true,
				noremap = true,
			},
			{
				"<space>fp",
				":ElixirFromPipe<cr>",
				desc = "Remove Pipe",
				buffer = true,
				noremap = true,
			},
			{
				"<space>tp",
				":ElixirToPipe<cr>",
				desc = "Convert to Pipe",
				buffer = true,
				noremap = true,
			},
			{
				"<space>em",
				":ElixirExpandMacro<cr>",
				desc = "Expand Macro",
				mode = "v",
				buffer = true,
				noremap = true,
			},

			-- bindings for standard LSP functions.
			-- vim.keymap.set("n", "<space>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
			-- vim.keymap.set("n", "<space>gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
			-- vim.keymap.set("n", "<space>dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
			-- vim.keymap.set("n", "<space>K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
			-- vim.keymap.set("n", "<space>gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
			-- vim.keymap.set("n", "<space>1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
			-- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
			-- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
			-- there are also core vim.lsp functions that put the same data in the loclist
			-- vim.keymap.set("n", "<space>gr", ":References<cr>", map_opts)
			-- vim.keymap.set("n", "<space>g0", ":DocumentSymbols<cr>", map_opts)
			-- vim.keymap.set("n", "<space>gW", ":WorkspaceSymbols<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)
		},
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")

			elixir.setup({
				credo = { enable = false },
				elixirls = {
					enabled = true,
					settings = elixirls.settings({
						dialyzerEnabled = true,
						fetchDeps = false,
						enableTestLenses = true,
						suggestSpecs = true,
					}),
				},
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	}
else
	return {}
end
