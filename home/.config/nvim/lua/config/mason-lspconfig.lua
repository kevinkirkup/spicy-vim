local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
      "sumneko_lua",
      "rust_analyzer",
      "elixirls",
      "gopls",
      "jsonls",
      "marksman",
      "pylsp",
      "sqls",
      "taplo",
      "yamlls"
  }
})
