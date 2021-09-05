call plug#begin('~/.vim/plugged')

" File navigation
Plug 'ctrlpvim/ctrlp.vim'

" Undo tree
Plug 'mbbill/undotree'

" Show vim's complete menu while typing
Plug 'vim-scripts/AutoComplPop'

call plug#end()

" Syntax highlighting
syntax on

" Position in code
set number
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Tabs, indenting and Wrapping
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set nowrap

" No damn bells
set belloff=all

" Undo and disable backups
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" File encoding
set noswapfile
set encoding=utf-8

" Search
set incsearch

" Misc
set scrolloff=8
set signcolumn=yes

" Autocomplete
set completeopt=menuone
hi Pmenu	ctermfg=white ctermbg=darkgray	 gui=NONE guifg=white guibg=darkgray
hi PmenuSel ctermfg=white ctermbg=lightblue	 gui=bold guifg=white guibg=blue
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"

"Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>

" Remaps
let mapleader = " "
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

