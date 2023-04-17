local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "elixirls",
      "gopls",
      "jsonls",
      "marksman",
      "pylsp",
      "sqlls",
      "taplo",
      "yamlls"
  }
})
