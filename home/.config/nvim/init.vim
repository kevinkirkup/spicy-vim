set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.config/nvim/plugged')

" ==================================================
" LSP
" ==================================================
Plug 'neovim/nvim-lspconfig'
Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" ==================================================
" Completion
" ==================================================
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" ==================================================
" Snippets
" ==================================================
Plug 'kevinkirkup/vim-snippets'
Plug 'SirVer/ultisnips', { 'tag': '3.2' }
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'scrooloose/nerdcommenter', { 'tag': '2.6.0' }
Plug 'scrooloose/nerdtree', { 'tag': '6.10.16' }
Plug 'tpope/vim-surround'
Plug 'rizzatti/dash.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive', { 'tag': 'v3.7' }
Plug 'ervandew/supertab'
Plug 'Rip-Rip/clang_complete'
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t', { 'tag': '5.0.4' }
Plug 'Chiel92/vim-autoformat'
Plug 'terryma/vim-multiple-cursors', { 'tag': 'v2.2' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux', { 'commit': '37f4119' }
Plug 'tpope/vim-endwise', { 'tag': 'v1.3' }
Plug 'junegunn/fzf'
Plug 'vim-scripts/VST'
Plug 'romainl/vim-qf'

" ==================================================
" Completion
" ==================================================
" Plug 'scrooloose/syntastic'
" Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --go-completer --rust-completer --clangd-completer' }

" ==================================================
" Language Plugins
" ==================================================
Plug 'keith/swift.vim', { 'for': 'swift' }
" Plug 'rust-lang/rust', { 'for': 'rust' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'manicmaniac/coconut.vim', { 'for': 'coconut' }

Plug 'fatih/vim-go', { 'tag': 'v1.26', 'for': 'go' }
Plug 'rhysd/vim-go-impl', { 'for': 'go' }

Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }

Plug 'vim-scripts/Vim-R-plugin', { 'for': 'r' }
Plug 'hspec/hspec', { 'for': 'haskell' }

Plug 'klen/python-mode', { 'tag': '0.13.0', 'for': 'python' }
Plug 'sebdah/vim-delve', { 'for': 'python' }

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'pangloss/vim-javascript', { 'commit': 'e9a59c8', 'for': 'javascript' }
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }

Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" ==================================================
" Themes
" ==================================================
" Plug 'wadackel/vim-dogrun'
" Plug 'rakr/vim-one'
Plug 'hzchirs/vim-material'
" Plug 'embark-theme/vim'
" Plug 'drewtempelmeyer/palenight'
" Plug 'cocopon/iceberg'
" Plug 'fenetikm/falcon'
Plug 'jarodl/cobalt.vim'
Plug 'travisjeffery/vim-colors'
Plug 'arcticicestudio/nord-vim'

call plug#end()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=light
colorscheme blackboard

if has("gui_vimr")
	source ~/.config/nvim/ginit.vim
endif

lua << EOF
-- Mappings.
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['elixirls'].setup{
    cmd = { "elixir-ls-language_server.sh" },
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- configuration for nvim-cmp
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- setting up snippet engine
      -- snippet engine, please refer to the `nvim-cmp` guide
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'buffer' }
  })
})

-- configuration for treesiter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"elixir", "heex", "eex", "rust", "python"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },


  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    disable = { },
  },
}

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = "E", Warn = "W", Hint = " ", Info = "I" } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
end
EOF
