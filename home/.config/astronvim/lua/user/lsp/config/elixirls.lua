local config = require("user.util.lsp-config")
local utils = require("user.util.misc")

-- set up elixir-language-server
if utils.executable("elixir-ls-language_server.sh") then
	return {
		cmd = { "elixir-ls-language_server.sh" },
		settings = {
			elixirLS = {
				format = { enable = false },
				-- I choose to disable dialyzer for personal reasons, but
				-- I would suggest you also disable it unless you are well
				-- aquainted with dialzyer and know how to use it.
				dialyzerEnabled = true,
				-- I also choose to turn off the auto dep fetching feature.
				-- It often get's into a weird state that requires deleting
				-- the .elixir_ls directory and restarting your editor.
				fetchDeps = false,
			},
		},
	}
else
	return {
		vim.notify("elixir-ls-language_server.sh not found!", vim.log.levels.WARN, { title = "Nvim-config" }),
	}
end
