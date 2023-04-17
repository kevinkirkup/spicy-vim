local config = require("user.util.lsp-config")
local utils = require("user.util.misc")

if utils.executable("pylsp") then
  return {
        on_attach = config.custom_attach,
        settings = {
            pylsp = {
                plugins = {
                    pylint = { enabled = true, executable = "pylint" },
                    pyflakes = { enabled = true },
                    pycodestyle = { enabled = false },
                    mccabe = { enabled = true },
                    jedi_completion = { fuzzy = true },
                    pylsp_mypy = { enabled = true },
                    pylsp_rope = { enabled = true },
                },
            },
        },
        flags = {
            debounce_text_changes = 200,
        },
    }
else
  return {
    vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
  }
end
