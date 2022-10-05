""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:   Kevin S Kirkup
" LastChanged:  2022-06-15
" Website:      None
""""""""""""""""""""""""""""""""""""""""""""""""""

" no undofile
set noundofile

set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"set verbose=2
let g:python3_host_prog = '/usr/local/bin/python3'

" Get the OS version
"
let os=substitute(system('uname'), '\n', '', '')

""""""""""""""""""""""""""""""""""""""""""""""""""
" Source local configuration settings
""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
