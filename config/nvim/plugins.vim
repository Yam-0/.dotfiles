if empty(glob('~/.vim/autoload/plug.vim'))
	if has('win32')
		echo ''
	else
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	end
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
	\| endif

call plug#begin('~/.vim/plugged')

	" Code completion and linting
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP manager and completion
	Plug 'github/copilot.vim' 						" Copilot
	Plug 'dense-analysis/ale'						" Lint
	Plug 'sheerun/vim-polyglot'						" Syntax highlighting language library
	Plug 'lervag/vimtex' 							" LaTeX
	Plug 'honza/vim-snippets' 						" Snippets
	Plug 'mattn/emmet-vim' 							" Emmet

	" File tree and fuzzy finder
	Plug 'junegunn/fzf.vim' 						" FZF Wrapper
	Plug 'preservim/nerdtree'						" File navigation

	" Other
	Plug 'ton/vim-alternate' 						" C utility
	Plug 'airblade/vim-gitgutter' 					" Git diff
	Plug 'tpope/vim-surround' 						" Change around word
	Plug 'tpope/vim-commentary' 					" Comment utility
	Plug 'tpope/vim-fugitive' 						" Git wrapper
	Plug 'tpope/vim-eunuch' 						" Unix utility, SudoWrite!
	Plug 'mhinz/vim-startify' 						" Start screen
	Plug 'bronson/vim-trailing-whitespace'			" Trim trailing whitespaces
	Plug 'alvan/vim-closetag' 	 					" HTML
	Plug 'voldikss/vim-floaterm' 					" Floating terminal

	" Folding
	Plug 'kevinhwang91/promise-async'
	Plug 'kevinhwang91/nvim-ufo'

	" Visual
	Plug 'kaicataldo/material.vim' 					" Colorscheme
	Plug 'dylanaraps/wal.vim' 						" Pywal Colorscheme
	Plug 'itchyny/lightline.vim'					" Status line
	Plug 'ap/vim-buftabline'						" Buffer tabs
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Nerdtree colors
	Plug 'ryanoasis/vim-devicons' 					" Icons

call plug#end()
