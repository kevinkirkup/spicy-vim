" Wikipedia syntax file for Vim
" Published on Wikipedia in 2003-04 and declared authorless.
" 
" Based on the HTML syntax file. Probably too closely based, in fact. There
" may well be name collisions everywhere, but ignorance is bliss, so they say.
"
" To do: plug-in support for downloading and uploading to the server.

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'html'
endif

if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

syn case ignore
