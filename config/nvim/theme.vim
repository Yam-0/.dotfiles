" Syntax highlighting
syntax on

" Theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
" colorscheme wal
set termguicolors
set cursorline

" Hide tilde
let &fcs='eob: '

" Hide Sidebar
hi clear SignColumn

" Hide cursorline
hi clear Cursorline

hi clear TabLineFill

" Hide background
hi Normal guibg=NONE ctermbg=NONE

" Floaterm border color
hi FloatermBorder guibg=NONE guifg=white
