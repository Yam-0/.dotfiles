" Position in code
set number norelativenumber

" Tabs, indenting and Wrapping
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set nowrap

" Mouse
set mouse=a

" No damn bells
set belloff=all

" Undo and disable backups
set undodir=~/.vim/undodir
set undofile
set nobackup
set nowritebackup

" Redawing
set lazyredraw

" File encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Search
set incsearch	" Search as characters are entered
set ic			" Ignore case
set hlsearch	" Highlight search results

" Misc
set scrolloff=6
set signcolumn=number
set title
set noshowcmd
set showmatch 			" Highlight matching ([{}])
set backspace=2 		" Free backspace
set hidden 				" Keep buffer loaded when abandoned
set autoread 			" Autoload file changes
set noshowmode
set updatetime=200
set timeoutlen=500

" Autocomplete
set completeopt=menuone,menu
set wildmenu

" Info filter
set shortmess+=O
set shortmess+=c
