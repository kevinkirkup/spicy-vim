""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Kevin S Kirkup
" LastChanged:  Jul 31 2018
" Website:      None
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"set verbose=2

" Get the OS version
"
let os=substitute(system('uname'), '\n', '', '')
echo "OS Version: " + os

" Silence imp deprecation warnings for python 3
" https://github.com/Valloric/YouCompleteMe/issues/3062
silent! py3 pass

" Add Powerline statusline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
" Source local configuration settings
""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" no undofile
set noundofile

""""""""""""""""""""""""""""""""""""""""""""""""""
" Set the default color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme kevin2
colorscheme blackboard
syntax enable
set guifont=PragmataPro:h12


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
" Clang Format
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> :pyf /usr/local/share/clang/clang-format.py<CR>
imap <C-K> <c-o>:pyf /usr/local/share/clang/clang-format.py<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Erlang settings
""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Python File Type settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 space indent for python files
" autocmd FileType python set shiftwidth=4
" autocmd FileType python set tabstop=4
" autocmd FileType python set softtabstop=4
" autocmd FileType python set smarttab
" autocmd FileType python set expandtab
" autocmd FileType python set autoindent

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
set noguipty

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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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
" Nerd Commenter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDRemoveAltComs=0
let NERDSpaceDelims=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javscript_plugin_jsdoc = 1
let g:javscript_plugin_ngdoc = 1

" Enable Flow - https://github.com/facebook/flow
let g:javascript_plugin_flow = 1

" Typescript
let g:typescript_indent_disable = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_python_checkers = []
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_pylint_post_args="--max-line-length=160"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-Mode Customization
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
let g:pymode_folding=0
let g:pymode_options_max_line_length = 160

let g:pymode_lint=1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']
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

""""""""""""""""""""""""""""""""""""""""""""""""""
" You Complete Me
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion=['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-S-TAB>', '<Up>']

let g:SuperTabDefaultComplettionType = '<C-Tab>'

""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Tag List
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Dash Configuration settings
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>d <Plug>DashSearch
nmap <silent> <leader>dg <Plug>DashGlobalSearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" Function recursively find the Cscope database file
""""""""""""""""""""""""""""""""""""""""""""""""""
function FindCscopeFile()

    " Find cscope data file recursively up
    let cscope_db=findfile("cscope.out", "./;,.;")
    if filereadable(cscope_db)
        execute "cs add" cscope_db cscope_db[0:-12]
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" ** Cscope **
if has ("cscope")

    " Find cscope data file recursively up
    :call FindCscopeFile()

"    map <c-F12> :!cscope -bRq<CR>

    nmap <silent> <c-F11> <Esc>:call FindCscopeFile()<CR>

endif
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" Eatchar function for the Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""
func Eatchar(pat)
  let c = nr2char(getchar())
  return (c =~ a:pat) ? '' : c
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""
" Some personal keymaps for the merge process
""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists(':ConverListFile')
   command -nargs=0 ConvertListFile :silent call ConvertZipList()
end
map  <c-l> :ConvertListFile<cr>
map! <c-l> :ConvertListFile<cr>


map  <Leader>dd <Esc>:call Delete_End_Spaces()<CR>
map! <Leader>dd <Esc>:call Delete_End_Spaces()<CR>a

map  <Leader>da <Esc>:call Delete_Application_Log_Crap()<CR>
map! <Leader>da <Esc>:call Delete_Application_Log_Crap()<CR>a


""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup the beginning and ending comment box macros
abbr #b /*************************************************
abbr #e *************************************************/
""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle fold state between closed and opened.
"
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
fun! ToggleFold()
if foldlevel('.') == 0
normal! l
else
if foldclosed('.') < 0
. foldclose
else
. foldopen
endif
endif
" Clear status line
echo
endfun


""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to convert a list of file paths to
" a line of comma seperate file names
""""""""""""""""""""""""""""""""""""""""""""""""""
function SearchFiles()
  silent execute ':%s/.*\\\(.*\)/\1/g'
  silent execute ':%s/\n/,/g'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to print the name of file tag
""""""""""""""""""""""""""""""""""""""""""""""""""
function Print_Tag()

  let name=expand("%:t")
  let frst='A_(static char* debugTag = "'
  let lst='";) // string to be used in debugging'

  put =frst . name . lst

endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to delete the empty spaces at the end of lines
""""""""""""""""""""""""""""""""""""""""""""""""""
function Delete_End_Spaces()
  silent execute ':%s/ *$//g'
  execute ':echo "Spaces Deleted"'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to delete the extra Windows Application Log Crap
"""""""""""""""""""""""""""""""""""""""""""""""""""
function Delete_Application_Log_Crap()
   silent execute ':%s/\r/\r/g'
   silent execute ':%s/\n]/]/g'
   silent execute ':%s/\n"/"/g'
   silent execute ':g/^$/d'
   silent execute ':%s/ cannot be found. //g'
   silent execute ':%s/The local computer may not have the necessary registry information or message DLL files to display messages from a remote computer. //g'
   silent execute ':%s/You may be able to use the \/AUXSOURCE= flag to retrieve this description; see Help and Support for details\. //g'
   silent execute ':%s/The following information is part of the event: //g'
   silent execute ':%s/The description for Event ID [0-9]* .*\nIf the event originated.*\nThe following information.*\n//g'
   silent execute ':%s/\n"/"/g'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to reformat the Spinnaker Service Prints
"""""""""""""""""""""""""""""""""""""""""""""""""""
function ReformatSpinnakerServicePrints()
  silent execute ':%s/^<SpinnakerService >\_.\{-}<\/SpinnakerService>\n//g'
  silent execute ':g/^.*SpinnakerService.*\n/d'
endfunction
