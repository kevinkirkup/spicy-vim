local config = require("user.util.lsp-config")
local utils = require("user.util.misc")

-- set up vim-language-server
if utils.executable("vim-language-server") then
    return {
        on_attach = config.custom_attach,
        flags = { debounce_text_changes = 500 }
    }
else
    return {
        vim.notify("vim-language-server not found!", vim.log.levels.WARN,
            { title = "Nvim-config" })
    }
end
