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
	Plug 'OmniSharp/omnisharp-vim'

	" File tree and fuzzy finder
	Plug 'junegunn/fzf' 							" FZF
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
	Plug 'itchyny/vim-gitbranch' 					" Git branch variable

	" Visual
	Plug 'kaicataldo/material.vim' 					" Colorscheme
	Plug 'ryanoasis/vim-devicons' 					" Icons

call plug#end()
