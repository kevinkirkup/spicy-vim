""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust File Type settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rust_recommended_style=1
let g:rust_bang_comment_leader=1
let g:rust_fold = 0

" Make sure to install rustfmt
" $ cargo install rustfmt
let g:rustfmt_autosave=0

" Keymaps

"autocmd FileType rust unmap <D-r>
"autocmd FileType rust unmap <D-f>

autocmd FileType rust nmap <Leader>r :RustRun<CR>
autocmd FileType rust nmap <Leader>f :RustFmt<CR>
