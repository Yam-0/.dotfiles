call plug#begin('~/.vim/plugged')

" File tree and undo
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'mbbill/undotree'

" Code completion and linting
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'dense-analysis/ale'

" Other
	Plug 'tpope/vim-fugitive' " Git wrapper

" Visual
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'itchyny/lightline.vim'

call plug#end()

" Syntax highlighting
syntax on

" Theme
colorscheme palenight

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
set fileencoding=utf-8
set termencoding=utf-8

" Search
set incsearch "Search as characters are entered
set ic
set hlsearch

" Misc
set scrolloff=8
set signcolumn=yes
set title
set nocompatible
set cursorline
set showcmd
set showmatch "Highlight matching ([{}])
set laststatus=2 "Always display statusline
set backspace=2

" Autocomplete
set completeopt=menuone
set wildmenu
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
nnoremap <leader><space> :nohlsearch<CR>

" Build 
nmap <f5> :!./build.bat<CR>

" Lint, autocompletion etc
let g:OmniSharp_Selector_ui = 'ctrlp'
autocmd FileType cs nmap <silent> <buffer> gd <plug>(omnisharp_go_to_definition)

" Gui settings
if has('gui_running')

	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	set guioptions -=L

	set guifont=Fira_Mono_for_Powerline:h18:W500:cANSI:qDRAFT
	autocmd GUIEnter * simalt ~x "Fullscreen
endif
