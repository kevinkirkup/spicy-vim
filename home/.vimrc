""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Kevin S Kirkup
" LastChanged:  Feb 28 2005
" Website:      None
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
source $VIMRUNTIME/vimrc_example.vim

" Add Powerline statusline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Change the default windows size
""""""""""""""""""""""""""""""""""""""""""""""""""
"set lines=60
"set columns=200

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
" Python File Type settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 space indent for python files
autocmd FileType python set shiftwidth=4
autocmd FileType python set tabstop=4
autocmd FileType python set softtabstop=4
autocmd FileType python set smarttab
autocmd FileType python set expandtab
autocmd FileType python set autoindent

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
" Snipmate Customization
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author =  "Kevin S Kirkup"
let g:snips_email =  "kevin.kirkup@gmail.com"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commenter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDRemoveAltComs=0
let NERDSpaceDelims=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = []

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
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

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
" Command to pretty xml code
""""""""""""""""""""""""""""""""""""""""""""""""""
func DoTidyXml()
  silent execute "%!tidy -miq -xml"
endfunc
command! Tidyxml call DoTidyXml()

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
