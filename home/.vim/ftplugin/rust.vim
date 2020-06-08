""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust File Type settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustc_path="/usr/local/bin/rustc"
let g:rust_recommended_style=1
let g:rust_bang_comment_leader=1

" Make sure to install rustfmt
" $ cargo install rustfmt
let g:rustfmt_autosave=1

" Autoformat setting
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

" Keymaps

"autocmd FileType rust unmap <D-r>
"autocmd FileType rust unmap <D-f>

autocmd FileType rust nmap <Leader>r :RustRun<CR>
autocmd FileType rust nmap <Leader>f :RustFmt<CR>
