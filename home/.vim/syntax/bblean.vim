""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename:      bblean.vim
" Purpose:       Vim syntax file for bblen resource files
" Language:      bblean *.rc files
" Maintainer;    Kevin S Kirkup kevin.kirkup@sonyericsson.com
" URL:
" Last Update:   Sat 11/19/2005
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"-----------------------------------------------------------
" Remove any old syntax information
"-----------------------------------------------------------
syn clear


"-----------------------------------------------------------
" Set the sync information
"-----------------------------------------------------------
if !exists("bblean_minlines")
  let bblean_minlines = 100
endif
if !exists("bblean_maxlines")
  let bblean_maxlines = 2 * bblean_minlines
endif

"-----------------------------------------------------------
" Comment out this to get less color
"-----------------------------------------------------------
let hi_color=1

"-----------------------------------------------------------
" sde_cfg syntax is case sensitive
"-----------------------------------------------------------
syn case match

syn keyword    bbleanTodo              contained TODO
syn match      bbleanComment           /#.*$/ contains=bbleanTodo
syn match      bbleanString            /".*"/

"-----------------------------------------------------------
" Menu structure
"-----------------------------------------------------------
syn region     bblean_mainMenu         start=/.*\[begin\]\s*\((.*)\)\?/ end=/\[end\].*$/ contains=ALL
syn region     bblean_subMenu          start=/.*\[submenu\]\s*\(.*\)\?/ end=/\[end\].*$/ contains=ALL
syn match      bblean_include          /.*\[include\]\s*{.*}/
syn match      bblean_noOperator       /\[nop\]\s*\((.*)\)\?$/
syn match      bblean_seperator        /\[sep\]/

"-----------------------------------------------------------
" SubMenu structure
"-----------------------------------------------------------
syn region     bblean_path             start=/\[path\]\s*(.*)\s*{/ end=/}/ contains=bbleanString
syn region     bblean_insertPath       start=/\[insertpath\]\s*{/  end=/}/ contains=bbleanString
syn region     bblean_stylesMenu       start=/\[stylesMenu\]\s*(.*)\s*{/ end=/}/ contains=bbleanString
syn region     bblean_stylesDir        start=/\[stylesdir\]\s*{/ end=/}/ contains=bbleanString


"-----------------------------------------------------------
" Special Menus
"-----------------------------------------------------------
syn match      bblean_config           /\[config\]\s*(.*)/
syn match      bblean_workspaces       /\[workspaces\]\s*(.*)/
syn match      bblean_tasks            /\[tasks\]\s*(.*)/

"-----------------------------------------------------------
" Link the highlight colors to the group
"-----------------------------------------------------------
hi link bblean_mainMenu           PreCondit
hi link bblean_subMenu            PreCondit
hi link bblean_include            PreCondit
hi link bblean_seperator          PreCondit
hi link bblean_noOperator         PreCondit
"-----------------------------------------------------------
" Submenus
"-----------------------------------------------------------
hi link bblean_path               Identifier
hi link bblean_insertPath         Identifier
hi link bblean_styleMenu          Identifier
hi link bblean_stylesDir          Identifier




hi link bbleanComment             Comment
hi link bbleanString              String

