let g:startify_bookmarks = [
	\ { 'v': '~/Projects/.dotfiles/config/nvim/init.vim' },
	\ { 'b': '~/.bashrc' },
	\ ]

let g:startify_lists = [
	\ { 'header': ['    Bookmarks'], 	'type': 'bookmarks' },
	\ { 'header': ['    Recent'], 		'type': 'files' },
	\ { 'header': ['    '. getcwd()], 	'type': 'dir' },
\ ]

let g:startify_use_unicode = 1

let g:startify_custom_header = [
	\ '       _  __             _',
	\ '      / |/ /__ ___ _  __(_)_ _',
	\ '     /    / -_) _ \ |/ / /  ` \',
	\ '    /_/|_/\__/\___/___/_/_/_/_/',
	\ ]

nnoremap <c-n> :Startify<cr>
