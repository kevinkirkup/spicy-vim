"""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim support file to detect file types
"
" Maintainer: Kevin Kirkup <kevin-k9@nc.rr.com>
" Last Change:  2005 Nov 10
"""""""""""""""""""""""""""""""""""""""""""""""""""
" AutoHotKey Scripts
au BufNewFile,BufRead *.ahk      setf ahk

" AutoIt Script Highlighter
au BufNewFile, BufRead *.au3     setf autoit

" SDE Configuration File Highligher
au BufNewFile, BufRead *.cfg     setf cfg

" Mediawiki syntax highlighter
au BufRead,BufNewFile *.wiki setfiletype mediawiki

" .h files can be C, Ch or C++, set c_syntax_for_h if you want C,
" C Configuration files
au BufNewFile,BufRead *.con
  \ if exists("c_syntax_for_h") | setf c |
  \ elseif exists("ch_syntax_for_h") | setf ch |
  \ else | setf cpp | endif

" SDE Defines files syntax highlighter
au BufRead,BufNewFile *.defines setfiletype c

" vim -b : edit binary using xxd-format!
  augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
  augroup END
