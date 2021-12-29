call plug#begin('~/.vim/plugged')

" Code completion and linting
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocomplete
	Plug 'dense-analysis/ale'						" Lint
	Plug 'sheerun/vim-polyglot'						" Syntax highlighting language library
	Plug 'bronson/vim-trailing-whitespace'			" Trim trailing whitespaces
	Plug 'lervag/vimtex' 							" LaTeX
	Plug 'alvan/vim-closetag' 	 					" HTML
	Plug 'mattn/emmet-vim' 							" Emmets

" File tree and fuzzy finder
	Plug 'junegunn/fzf'								" Fuzzy file finder
	Plug 'junegunn/fzf.vim' 						" Wrapper
	Plug 'preservim/nerdtree'						" File navigation

" Other
	Plug 'junegunn/goyo.vim' 						" Zen mode
	Plug 'szw/vim-maximizer'						" Maximize
	Plug 'ton/vim-alternate' 						" C utility
	Plug 'airblade/vim-gitgutter' 					" Git diff
	Plug 'tpope/vim-surround' 						" Change around word
	Plug 'tpope/vim-commentary' 					" Comment utility
	Plug 'tpope/vim-fugitive' 						" Git wrapper
	Plug 'tpope/vim-eunuch' 						" Utility

" Visual
	Plug 'kaicataldo/material.vim' 					" Colorscheme
	Plug 'itchyny/lightline.vim'					" Status line
	Plug 'ap/vim-buftabline'						" Buffer tabs
	Plug 'ap/vim-css-color' 						" Preview colors
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Nerdtree colors
	Plug 'ryanoasis/vim-devicons' 					" Icons

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

xmap <leader>ca <Plug>(coc-codeaction-selected)
nnoremap <leader>ca :CocAction<CR>

" Quick fix
nmap <leader>cf :CocFix<CR>

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

" Quick escape
imap jk <esc>
imap kj <esc>

" Misc
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap Y y$
imap <c-e> <c-y>,

" Fuzzy finder
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Lines<CR>

" Auto pairs
inoremap (<tab> ()<Left>
inoremap {<tab> {}<Left>
inoremap {<CR> {<CR>}<c-o>O
inoremap [<tab> []<Left>
inoremap "<tab> ""<Left>
inoremap '<tab> ''<Left>
inoremap (; ();<Left><Left>
inoremap {; {};<Left><Left>
inoremap [; [];<Left><Left>
inoremap (, (),<Left><Left>
inoremap {, {},<Left><Left>
inoremap [, [],<Left><Left>

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
vnoremap <silent> <a-j> :m '>+1<CR>gv=gv
vnoremap <silent> <a-k> :m '<-2<CR>gv=gv
inoremap <silent> <a-j> <esc>:m .+1<CR>==a
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
nnoremap <silent> <leader>s :w<CR>:bp\|bd<space>#<CR>
nnoremap <silent> <leader>d :bd<CR>
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
nnoremap <leader>F :NERDTreeFind<CR>
nnoremap <leader>p :cd %:p:h<CR>
nnoremap <leader>V :e ~/_vimrc<CR>
command! Reroot cd %:p:h

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Minimal ui
let NERDTreeMinimalUI=1
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

" Behave Nerdtree!
let NERDTreeMapCustomOpen='l'
let NERDTreeMapCloseDir='h'

" Git
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Hide tilde
hi NonText guifg=bg

" Easy copy
vnoremap <leader>C "+y

" LaTeX
nnoremap <leader>gg gqip
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Modes
command! EnterNormalMode :set lbr!
command! EnterWriteMode :set lbr tw=60

" Alternate between files
nnoremap <leader>S :Alternate<CR>
let g:AlternatePaths = ['./include', '..', '.']
let g:AlternateExtensionMappings = [{'.cpp' : '.h', '.h' : '.hpp', '.hpp' : '.cpp'}, {'.c': '.h', '.h': '.c'}, {'.js': '.module.css', '.module.css': '.js'}]

" Lightline configuration
let g:lightline = { 'colorcheme': 'material_vim' }

" Closetag configuration
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_shortcut = '>'
