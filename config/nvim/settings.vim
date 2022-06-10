" Position in code
set nonumber

" Tabs, indenting and Wrapping
set tabstop=4
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
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Search
set incsearch	" Search as characters are entered
set ic			" Ignore case
set hlsearch	" Highlight search results

" Misc
set scrolloff=6
set signcolumn=yes
set title
set cursorline
set noshowcmd
set showmatch 			" Highlight matching ([{}])
set laststatus=0 		" Always display statusline
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
