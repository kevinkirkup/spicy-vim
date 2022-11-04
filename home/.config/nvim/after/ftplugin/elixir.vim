" Setup elixir
" https://www.jmaguire.tech/posts/treesitter_folding/
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

autocmd BufReadPost,FileReadPost * normal zR
