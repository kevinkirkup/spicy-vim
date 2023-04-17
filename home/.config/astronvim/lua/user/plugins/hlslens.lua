-- Show match number and index for searching
return {
  "kevinhwang91/nvim-hlslens",
  branch = "main",
  keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
  opts = {
		calm_down = true,
		nearest_only = true,
  },
  config = require('user.plugins.configs.hlslens'),
  lazy = false,
}
