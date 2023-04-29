if true then
	return {
		"elixir-tools/elixir-tools.nvim",
		ft = { "elixir", "eex", "heex", "surface" },
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
					on_attach = function(client, bufnr)
						-- whatever keybinds you want, see below for more suggestions
						vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
						vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
					end,
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
