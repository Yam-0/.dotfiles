call plug#begin('~/.vim/plugged')

" Code completion and linting
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
	Plug 'dense-analysis/ale'						" Lint
	Plug 'sheerun/vim-polyglot'						" Syntax highlighting language library
	Plug 'bronson/vim-trailing-whitespace'			" Trim trailing whitespaces

" File tree and fuzzy finder
	Plug 'ctrlpvim/ctrlp.vim'						" Fuzzy file finder
	Plug 'preservim/nerdtree'						" File navigation

" Other
	Plug 'szw/vim-maximizer'						" Maximize
	Plug 'tpope/vim-surround' 						" Change around word
	Plug 'tpope/vim-commentary' 					" Comment utility
	Plug 'tpope/vim-fugitive' 						" Git wrapper
	Plug 'junegunn/goyo.vim' 						" Zen mode

" Visual
	Plug 'morhetz/gruvbox'							" Colorscheme
	Plug 'shaunsingh/nord.nvim' 					" Colorscheme
	Plug 'kaicataldo/material.vim' 					" Colorscheme
	Plug 'itchyny/lightline.vim'					" Status line
	Plug 'ap/vim-buftabline'						" Buffer tabs
	Plug 'ap/vim-css-color' 						" Preview colors

call plug#end()

" Syntax highlighting
syntax on

" Theme
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material
set termguicolors

" Position in code
set number

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
set scrolloff=8
set signcolumn=yes
set title
set nocompatible
set cursorline
set showcmd
set showmatch 			" Highlight matching ([{}])
set laststatus=2 		" Always display statusline
set backspace=2 		" Free backspace
set hidden 				" Keep buffer loaded when abandoned
set guicursor=i:block 	" Force block cursor in insert mode
set autoread 			" Autoload file changes
set noshowmode
set updatetime=300

" Autocomplete
set completeopt=menuone
set wildmenu

" ------------------------------- Lint, autocompletion etc -------------------------------

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Confirm suggestion with enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Rename symbol
nmap <leader>cr <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Quick fix
nmap <leader>cf  :CocFix<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" ------------------------------- Lint, autocompletion etc -------------------------------

" leader key for mappings
let mapleader = " "

" ctrl-c to escape everywhere
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>
tmap <c-c> <C-\><C-n>

" Misc
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap Y y$

" Auto pairs
inoremap (<tab> ()<Left>
inoremap {<tab> {<CR>}<c-o>O
inoremap [<tab> []<Left>
inoremap "<tab> ""<Left>
inoremap '<tab> ''<Left>
inoremap (; ();<Left><Left>
inoremap {; {<CR>};<c-o>O
inoremap [; [];<Left><Left>
inoremap ", "",<Left><Left>
inoremap ', '',<Left><Left>

" Zen
nnoremap <leader>z :Goyo<CR>
nnoremap <leader>Z :Goyo!<CR>

" Relative numbers
nnoremap <leader>r :set number relativenumber<CR>
nnoremap <leader>R :set number norelativenumber<CR>

" Add empty lines
nnoremap <c-j> o<esc>cc<esc>
nnoremap <c-k> O<esc>cc<esc>

" Easy brackets
imap <c-h> {
imap <c-j> }
imap <c-k> [
imap <c-l> ]

" Moving and copying lines
vnoremap <silent> <a-k> :m '<-2<CR>gv=gv
inoremap <silent> <a-j> <esc>:m .+1<CR>==a
vnoremap <silent> <a-j> :m '>+1<CR>gv=gv
inoremap <silent> <a-k> <esc>:m .-2<CR>==a
nnoremap <silent> <a-j> :m .+1<CR>==
nnoremap <silent> <a-k> :m .-2<CR>==
vnoremap <a-J> y<esc>P==gv=gv
vnoremap <a-K> y<esc>'>p==gv=gv
inoremap <a-J> <esc>yyp==A
inoremap <a-K> <esc>yyP==A
nnoremap <a-J> yyp==
nnoremap <a-K> yyP==
nnoremap <Tab> >>
nnoremap <s-Tab> <<
vnoremap <Tab> >gv
vnoremap <s-Tab> <gv

" Alt+ navigation
nnoremap <a-h> ^
nnoremap <a-l> g_
vnoremap <a-h> ^
vnoremap <a-l> g_
inoremap <a-h> <c-o>^
inoremap <a-l> <c-o>g_

" Buffers
nnoremap <silent> <leader>b :ls<CR>:b<Space>
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <leader>s :w<CR>:bdelete<Space><CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bNext<CR>

" Split resize
nnoremap <silent> <Right> :vert res +3<CR>
nnoremap <silent> <Left> :vert res -3<CR>
nnoremap <silent> <Up> :res -1<CR>
nnoremap <silent> <Down> :res +1<CR>

" Build integration
nnoremap <f4> :split<CR>:term<CR><insert>./run.*<CR>
nnoremap <f5> :split<CR>:term<CR><insert>./build.*<CR>

" File navigation
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>F :!start .<CR>
nnoremap <leader>p :cd %:p:h<CR>
nnoremap <leader>V :e ~/_vimrc<CR>
command! Reroot cd %:p:h

" LaTeX
nnoremap <leader>gg vipJgql

" Modes
command! EnterNormalMode :set lbr! | :Goyo! | colorscheme gruvbox
command! EnterWriteMode :set lbr tw=75 | :Goyo 80 | colorscheme nord
command! EnterFocusMode :Goyo 80 | colorscheme nord

" Lightline configuration
let g:lightline = { 'colorscheme': 'material_vim' }
