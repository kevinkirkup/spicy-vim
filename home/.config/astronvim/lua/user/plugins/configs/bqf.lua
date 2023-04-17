return function(_, opts)
  require("bqf").setup {
    auto_resize_height = false,
    preview = {
      auto_preview = false,
    },
  }
end
