-- UI for nvim-lsp
return {
  "j-hui/fidget.nvim",
  dependencies = { "nvim-lspconfig" },
  opts = {},
  config = require('user.plugins.configs.fidget-nvim')
}
