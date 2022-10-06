scriptencoding utf-8

" Plugin specification and Lua packages
lua require('plugins')

" Use short names for common plugin manager commands to simplify typing.
" To use these shortcuts: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded to
" the full command automatically.
call utils#Cabbrev('pi', 'PackerInstall')
call utils#Cabbrev('pud', 'PackerUpdate')
call utils#Cabbrev('pc', 'PackerClean')
call utils#Cabbrev('ps', 'PackerSync')

""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

" Delegate search to ripgrep
" https://github.com/junegunn/fzf.vim
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
  let g:airline_theme='material'
else
  let g:airline_theme='laederon'
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#ale#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme kevin2
syntax enable
set guifont=PragmataPro\ Mono\ Liga:h12

" if has('gui_running')
"   let g:material_style='oceanic'
"   set background=dark
"   colorscheme vim-material
" else
"   set termguicolors
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"
"   set background=light
"   colorscheme tir_black
"   " set background=dark
"   " colorscheme embark
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable spell check
""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us
set spell

""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omnicomplete
""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the map leader character
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = '\'

"if !exists("g:mapleader")
"  echo "  <leader> = '\'"
"else
"  echo "  <leader> = " . g:mapleader
"endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>f :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the default windows size
""""""""""""""""""""""""""""""""""""""""""""""""""
"set lines=50
"set columns=300

""""""""""""""""""""""""""""""""""""""""""""""""""
" Shows 2 lines between the cursor and the new line
" when scrolling using the z. and z- commands
""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default indentation attributes
""""""""""""""""""""""""""""""""""""""""""""""""""
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""""
" Terraform
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Clang Format
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-K> <c-o>:pyf /usr/local/share/clang/clang-format.py<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Erlang settings
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Pymode settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'


""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML Settings
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" XML Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" tidy -miq -xml"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some backup settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
"set patchmode=.org


""""""""""""""""""""""""""""""""""""""""""""""""""
" Some programming settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set shellpipe=\|\ tee
set grepprg=grep\ -n


""""""""""""""""""""""""""""""""""""""""""""""""""
" Show the line numbers when a file is opened
""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set list listchars=tab:»·,trail:·,extends:>,precedes:<
set nowrap
set incsearch
set ruler
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusline
""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set some random options
""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch " Hilight when a search command is entered.
set fileformat=unix " Set the default file format to dos
set tildeop         " This treat ~ as a operator for
                    " multiple CAPS

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some abrreviations
""""""""""""""""""""""""""""""""""""""""""""""""""
" abbreviate #d #define
" abbreviate #i #include

""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Up the directory Tree when looking for tags
""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=tags;/

" CTRL-P Tag searching
map  <Leader>.  <Esc>  :CtrlPTag<CR>
map! <Leader>.  <Esc>  :CtrlPTag<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Make external commands work through a pipe instead of a pseudo-tty
"   This one came from the following website:
"   http://www.naglenet.org/vim/syntax/_gvimrc
""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
  set noguipty
endif

" Hide the mouse when typing, only for GUI
" set mousehide

""""""""""""""""""""""""""""""""""""""""""""""""""
" Make shift-insert work like in Xterm
""""""""""""""""""""""""""""""""""""""""""""""""""
map  <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the Shift Space to Esc
""""""""""""""""""""""""""""""""""""""""""""""""""
"map! <S-Space> <Esc>

set wrapscan              " search around end of file

""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Width and line wrapping
""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=100
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#555555
  autocmd BufEnter * match OverLength /\%100v.*/
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" clang_complete
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'

if os == 'Darwin'
  let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
elseif os == 'Linux'
  let g:clang_library_path = '/usr/local/lib/'
endif

let g:clang_complete_auto = 1
let g:clang_user_options = '-std=c++14'

""""""""""""""""""""""""""""""""""""""""""""""""""
" Snipmate
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author =  "Kevin S Kirkup"
let g:snips_email =  "kevin.kirkup@gmail.com"
let g:snips_github =  "kevinkirkup"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd vimenter * NERDTree

let g:NERDTree_title = "[NERD Tree]"
let NERDTreeShowHidden=1
let NERDTreeWinSize=50

map <c-w><c-t> :NERDTreeToggle<CR>
map! <c-w><c-t> :NERDTreeToggle<CR>

" Handler for NERDTree
function! NERDTree_Start()
  let b:displayMode = "winmanger"
  exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
  return 1
endfunction

function! NERDTree_WrapUp()
  let s:lastCursorRow = line('.')
  let s:lastCursorColumn = virtcol('.')
  let s:lastDirectoryDisplayed = b:completePath
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

let g:ale_set_quickfix = 1
let g:ale_completion_enabled = 1

let g:ale_floating_preview = 1
let g:ale_close_preview_on_insert = 1

let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'rust': ['rustfmt'] }

inoremap <silent><expr><TAB>
    \ pumvisible() ? “\<C-n>” : “\<TAB>”

