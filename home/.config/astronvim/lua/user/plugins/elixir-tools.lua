if true then
	return {
		"elixir-tools/elixir-tools.nvim",
		ft = { "elixir", "eex", "heex", "surface" },
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"<leader>r",
				vim.lsp.codelens.run,
				desc = "Run Codelens under cursor.",
				buffer = true,
				noremap = true,
			},
			{
				"<leader>fp",
				":ElixirFromPipe<cr>",
				desc = "Remove Pipe",
				buffer = true,
				noremap = true,
			},
			{
				"<leader>tp",
				":ElixirToPipe<cr>",
				desc = "Convert to Pipe",
				buffer = true,
				noremap = true,
			},
			{
				"<leader>em",
				":ElixirExpandMacro<cr>",
				desc = "Expand Macro",
				mode = "v",
				buffer = true,
				noremap = true,
			},

			-- bindings for standard LSP functions.
			-- vim.keymap.set("n", "<leader>df", "<cmd>lua vim.lsp.buf.format()<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.diagnostic.open_float()<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>dt", "<cmd>lua vim.lsp.buf.definition()<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>K", "<cmd>lua vim.lsp.buf.hover()<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.implementation()<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>1gD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", map_opts)
			-- keybinds for fzf-lsp.nvim: https://github.com/gfanto/fzf-lsp.nvim
			-- you could also use telescope.nvim: https://github.com/nvim-telescope/telescope.nvim
			-- there are also core vim.lsp functions that put the same data in the loclist
			-- vim.keymap.set("n", "<leader>gr", ":References<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>g0", ":DocumentSymbols<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>gW", ":WorkleaderSymbols<cr>", map_opts)
			-- vim.keymap.set("n", "<leader>d", ":Diagnostics<cr>", map_opts)
		},
		config = function()
			local elixir = require("elixir")
			local elixirls = require("elixir.elixirls")

			elixir.setup({
				nextls = { enable = true },
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
