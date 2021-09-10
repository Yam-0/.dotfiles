call plug#begin('~/.vim/plugged')

" Code completion and linting
	" Plug 'ycm-core/YouCompleteMe'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot' " Syntax highlighting language library
	Plug 'bronson/vim-trailing-whitespace'

" File tree and undo
	Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
	Plug 'preservim/nerdtree' " File navigation

" Other
	Plug 'tpope/vim-fugitive' " Git wrapper
	Plug 'szw/vim-maximizer' "maximize

" Visual
	" Plug 'drewtempelmeyer/palenight.vim'
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim' " Status line
	Plug 'ap/vim-buftabline' " Buffer tabs

call plug#end()

" Syntax highlighting
syntax on

" Theme
colorscheme gruvbox
let g:lightline = { 'colorscheme': 'gruvbox' }

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

" Dynamic Python
" set pythonhome=C:\Python27
" set pythondll=C:\Python27\python27.dll
" set pythonthreehome=C:\Python36
" set pythonthreedll=C:\Python36\python36.dll

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
set incsearch " Search as characters are entered
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
set hidden
set guicursor=i:block

" Autocomplete
set completeopt=menuone
set wildmenu
hi Pmenu	ctermfg=white ctermbg=darkgray	 gui=NONE guifg=white guibg=darkgray
hi PmenuSel ctermfg=white ctermbg=lightblue	 gui=bold guifg=white guibg=blue
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"

"Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>

let mapleader = " "
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>r :set number relativenumber<CR>
nnoremap <leader>R :set number norelativenumber<CR>
tnoremap <Esc> <C-\><C-n>

" Buffers
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>d :ls<CR>:bdelete<Space>
nnoremap <leader>s :w<CR>:bdelete<Space><CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bNext<CR>
nnoremap <leader>m :MaximizerToggle<CR>

" Build
nmap <f5> :term<CR>build.bat<CR>

" File exploration
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>F :!start .<CR>
nnoremap <leader>V :e ~/_vimrc<CR>

" Lint, autocompletion etc
let g:OmniSharp_Selector_ui = 'ctrlp'
autocmd FileType cs nmap <silent> <buffer> gd <plug>(omnisharp_go_to_definition)

" Gui settings
if has('gui_running')
	" Disable gui
	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	set guioptions -=L

	autocmd GUIEnter * simalt ~x "Fullscreen
endif
