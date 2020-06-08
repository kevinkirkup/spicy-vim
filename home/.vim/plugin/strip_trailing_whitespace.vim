""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to delete the empty spaces at the end of lines
""""""""""""""""""""""""""""""""""""""""""""""""""
function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction
