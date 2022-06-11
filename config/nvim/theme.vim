" Syntax highlighting
syntax on

" Theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
set termguicolors

" Hide tilde
hi NonText guifg=bg

" Lightline
let g:lightline = { 'colorcheme': 'material_vim' }