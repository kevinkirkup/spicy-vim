vim.opt.list = true
vim.cmd [[highlight IndentBlanklineIndent guifg=#353535 gui=nocombine]]

local exclude_ft = {
  "help",
  "alpha",
  "dashboard",
  "neo-tree",
  "checkhealth",
  "packer",
  "lspinfo",
  "git",
  "gitconfig",
  "markdown",
  "snippets",
  "text"
}

return function(_, opts)
  require("indent_blankline").setup {
    -- U+2502 may also be a good choice, it will be on the middle of cursor.
    -- U+250A is also a good choice
    -- char = "▏",
    space_char_blankline = " ",
    show_current_context = true,
    char_highlight_list = {
      "IndentBlanklineIndent",
    },

    show_end_of_line = false,
    disable_with_nolist = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = exclude_ft,
    use_treesitter = true,
  }

  local api = vim.api

  local gid = api.nvim_create_augroup("indent_blankline", { clear = true })
  api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = gid,
    command = "IndentBlanklineDisable",
  })

  api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = gid,
    callback = function()
      if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
        vim.cmd([[IndentBlanklineEnable]])
      end
    end,
  })
end
