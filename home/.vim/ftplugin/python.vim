""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-Mode Customization
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
let g:pymode_folding=0
let g:pymode_options_max_line_length = 160

let g:pymode_lint=1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_on_write=1
let g:pymode_lint_on_fly=0
let g:pymode_lint_ignore=""
let g:pymode_lint_cwindow=1

let g:pymode_lint_options_pylint =
  \ {'max-line-length': g:pymode_options_max_line_length}

" Disable rope since we are using YouCompleteMe
let g:pymode_rope=0
"let g:pymode_rope_lookup_project=0

autocmd FileType python map  <Leader>pt <Esc>  :PymodeLintToggle<CR>
autocmd FileType python map! <Leader>pt <Esc>  :PymodeLintToggle<CR>
autocmd FileType python map  <Leader>pl <Esc>  :PymodeLint<CR>
autocmd FileType python map! <Leader>pl <Esc>  :PymodeLint<CR>
