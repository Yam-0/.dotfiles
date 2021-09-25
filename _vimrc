call plug#begin('~/.vim/plugged')

" Code completion and linting
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'dense-analysis/ale' " Lint
	Plug 'sheerun/vim-polyglot' " Syntax highlighting language library
	Plug 'bronson/vim-trailing-whitespace' "Trim trailing whitespaces

" File tree and fuzzy finder
	Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
	Plug 'preservim/nerdtree' " File navigation

" Other
	Plug 'tpope/vim-fugitive' " Git wrapper
	Plug 'szw/vim-maximizer' " Maximize

" Visual
	Plug 'morhetz/gruvbox'
	Plug 'itchyny/lightline.vim' " Status line
	Plug 'ap/vim-buftabline' " Buffer tabs

call plug#end()

" Syntax highlighting
syntax on

" Theme
colorscheme gruvbox

" Position in code
set number

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
set hidden " Keep buffer loaded when abandoned
set guicursor=i:block
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
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Quick fix
nmap <leader>q  :CocFix<CR>

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
nnoremap Y y$
nnoremap <leader>m :MaximizerToggle<CR>

" Moving and copying lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <c-j> <esc>:m .+1<CR>==a
inoremap <c-k> <esc>:m .-2<CR>==a
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <a-j> y<esc>Pgv=gv
vnoremap <a-k> y<esc>'>pgv=gv
inoremap <a-j> <esc>yypA
inoremap <a-k> <esc>yyPA
nnoremap <a-j> yyPA
nnoremap <a-k> yyPA

" Buffers
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>s :w<CR>:bdelete<Space><CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bNext<CR>
nnoremap <leader>n :badd<Space>

" Build
nmap <f5> :split<CR>:term<CR><insert>build.bat<CR>

" File navigation
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>p :NERDTree<CR>
nnoremap <leader>P :cd %:p:h<CR>
nnoremap <leader>F :!start .<CR>
nnoremap <leader>V :e ~/_vimrc<CR>

" Gui settings
if has('gui_running')

	" Disable gui
	set guioptions -=m
	set guioptions -=T
	set guioptions -=r
	set guioptions -=L

	autocmd GUIEnter * simalt ~x "Fullscreen
endif
