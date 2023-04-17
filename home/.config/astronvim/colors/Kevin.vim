" Vim color file
" Maintainer:   Kevin S Kirkup <kevin-k9@nc.rr.com>
" Last Change:  2005 Feb 27

" This color scheme uses a black background.

" First remove all existing highlighting.
set background=dark
highlight clear

" Set the default startup items
let g:colors_name = "kevin"

set guifont=Courier_New:h10:cANSI

highlight Normal ctermbg=Black ctermfg=white guifg=#B5B5B5 guibg=Black"

" Groups used in the 'highlightghlight' and 'guicursor' options default value.
highlight ErrorMsg      term=standout                              ctermbg=DarkRed      ctermfg=White                         guibg=Black  guifg=White
highlight ModeMsg       term=bold            cterm=bold                                                   gui=bold            guibg=Black  guifg=White
highlight LineNr        term=underline       ctermfg=Yellow                                                                   guibg=#4F4F4F   guifg=#CFCFCF
highlight Search        term=reverse                               ctermbg=Yellow       ctermfg=Black                         guibg=#C0FF3E   guifg=Black
highlight Cursor                                                                                                              guibg=#CFCFCF   guifg=Black
highlight NonText       term=bold            ctermfg=LightBlue                                           gui=bold             guibg=Black   guifg=#CFCFCF
highlight SpecialKey    term=bold            ctermfg=LightBlue                          ctermfg=LightRed                      guibg=Black   guifg=#CAE1FF

highlight Pmenu                                                                                                               guibg=#191970   guifg=#54FF9F
highlight lCursor                                                                                                             guibg=#191970   guifg=#54FF9F
highlight IncSearch     term=reverse         cterm=reverse                                                gui=reverse         guibg=#191970   guifg=White
highlight StatusLine    term=reverse,bold    cterm=reverse,bold                                           gui=reverse,bold    guibg=#191970   guifg=White
highlight StatusLineNC  term=reverse         cterm=reverse                                                gui=reverse         guibg=#191970   guifg=White
highlight VertSplit     term=reverse         cterm=reverse                                                gui=reverse         guibg=#191970   guifg=White
highlight Visual        term=reverse         cterm=reverse                                                gui=reverse         guibg=#191970   guifg=White
highlight VisualNOS     term=underline,bold  cterm=underline,bold                                         gui=underline,bold  guibg=#191970   guifg=White
highlight Directory     term=bold            ctermfg=LightCyan                                                                guibg=#191970   guifg=White
highlight MoreMsg       term=bold            ctermfg=LightGreen                                          gui=bold             guibg=#191970   guifg=White
highlight Question      term=standout        ctermfg=LightGreen                                          gui=bold             guibg=#528B8B   guifg=White
highlight Title         term=bold            ctermfg=LightMagenta                                        gui=bold             guibg=#528B8B   guifg=White
highlight WarningMsg    term=standout        ctermfg=LightRed                                                                 guibg=#528B8B   guifg=White
highlight WildMenu      term=standout                              ctermbg=Yellow       ctermfg=Black                         guibg=#528B8B   guifg=White
highlight Folded        term=standout                              ctermbg=LightGray    ctermfg=DarkBlue                      guibg=#528B8B   guifg=White
highlight FoldColumn    term=standout                              ctermbg=LightGray    ctermfg=DarkBlue                      guibg=#528B8B   guifg=White

" Differencing colors
highlight DiffAdd       term=bold                                  ctermbg=DarkBlue                                           guibg=#528B8B   guifg=White
highlight DiffChange    term=bold                                  ctermbg=DarkMagenta                                        guibg=#528B8B   guifg=White
highlight DiffDelete    term=bold                                  ctermbg=DarkCyan     ctermfg=Blue     gui=bold             guibg=#528B8B   guifg=White
highlight DiffText      term=reverse         cterm=bold ctermbg=Red                                       gui=bold            guibg=#191970   guifg=White

" Language independant colors
highlight Comment                                                                       ctermfg=DarkGray                      guibg=Black   guifg=#00FF7F

highlight Constant      term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#FFC125
highlight String        term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#FF1493
highlight Character     term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#FF1493
highlight Number        term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#FFC125
highlight Boolean       term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#BFEFFF
highlight Float         term=underline                                                  ctermfg=Magenta                       guibg=Black   guifg=#FFC125

highlight Identifier    term=underline                                                  ctermfg=Magenta    gui=bold           guibg=Black   guifg=White
highlight Function      term=underline                                                  ctermfg=Magenta    gui=bold           guibg=Black   guifg=White

highlight Statement     term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#C6E2FF
highlight Conditional   term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#C6E2FF
highlight Repeat        term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#C6E2FF
highlight Label         term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#B9D3EE
highlight Operator      term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#BFEFFF
highlight Keyword       term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#BFEFFF
highlight Exception     term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#BFEFFF

highlight PreProc       term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#54FF9F
highlight Include       term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#54FF9F
highlight Define        term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#54FF9F
highlight Macro         term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#54FF9F
highlight PreCondit     term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#C0FF3E

highlight Type          term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#9F79EE
highlight StorageClass  term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#9F79EE
highlight Structure     term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#BF3EFF
highlight Typedef       term=bold            cterm=bold                                   ctermfg=Yellow   gui=bold             guibg=Black   guifg=#BF3EFF

highlight Special       term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight SpecialChar   term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight Tag           term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight Delimiter     term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight SpecialComment term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight Debug         term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White

highlight Underlined    term=bold                                                       ctermfg=LightRed                      guibg=Black   guifg=White
highlight Ignore                                                                        ctermfg=DarkGray                      guibg=Black   guifg=#104E8B
highlight Error         term=bold                                                       ctermfg=LightRed                      guibg=#FF0000 guifg=White
highlight Todo          term=bold                                                       ctermfg=LightRed                      guibg=#C0FF3E guifg=Black
" vim: sw=2
