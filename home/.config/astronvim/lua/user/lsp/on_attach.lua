-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.lsp.omnifunc")
end
