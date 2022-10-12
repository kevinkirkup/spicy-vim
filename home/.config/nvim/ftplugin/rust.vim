""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust settings
""""""""""""""""""""""""""""""""""""""""""""""""""

" Format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
