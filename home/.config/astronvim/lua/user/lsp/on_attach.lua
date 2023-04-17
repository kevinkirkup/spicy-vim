local api = vim.api
local keymap = vim.keymap
local lsp = lsp

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap.set('n', 'gd', lsp.buf.definition, bufopts)

    keymap.set('n', 'K', lsp.buf.hover, bufopts)
    keymap.set('n', 'gi', lsp.buf.implementation, bufopts)
    keymap.set('n', 'gr', lsp.buf.references, bufopts)
    keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
    keymap.set('n', '<space>K', lsp.buf.signature_help, bufopts)
    keymap.set('n', 'gt', lsp.buf.type_definition, bufopts)
    keymap.set('n', '<F2>', lsp.buf.rename, bufopts)
    keymap.set('n', '<space>rn', lsp.buf.rename, bufopts)
    keymap.set('n', '<space>ca', lsp.buf.code_action, bufopts)
    keymap.set('n', '<space>f', lsp.buf.formatting, bufopts)
    keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end
