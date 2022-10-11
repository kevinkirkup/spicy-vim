local treesitter = require("nvim-treesitter.configs")

-- configuration for treesiter
treesitter.setup {
  -- Matchup configuration
  matchup = {
    enable = true,
    disable = { }
  },

  -- A list of parser names, or "all"
  ensure_installed = {"cpp", "elixir", "vim", "lua", "heex", "eex", "rust", "python"},

  -- List of parsers to ignore installing (for "all")
  ignore_install = {}, -- List of parsers to ignore installing

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    disable = { 'help' },
  },
}

-- this is for diagnostics signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "E", Warn = "W", Hint = " ", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
