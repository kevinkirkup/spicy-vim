local config = require("user.util.lsp-config")
local utils = require("user.util.misc")

-- set up bash-language-server
if utils.executable("bash-language-server") then
    return { on_attach = config.custom_attach }
end
