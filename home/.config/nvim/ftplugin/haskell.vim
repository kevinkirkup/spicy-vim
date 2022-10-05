""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell settings
""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <Leader>e :Errors<CR>

highlight link hspecDescribe Type
highlight link hspecIt Identifier
highlight link hspecDescription Comment

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus=1

autocmd BufEnter *.hs set formatprg=pointfree
