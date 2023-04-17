local config = require("user.util.lsp-config")
local utils = require("user.util.misc")

if utils.executable("clangd") then
	return {

		on_attach = config.custom_attach,
		filetypes = { "c", "cpp", "cc" },
		flags = {
			debounce_text_changes = 500,
		},
	}
else
	return {
		vim.notify("clangd not found!", vim.log.levels.WARN, { title = "Nvim-config" }),
	}
end
