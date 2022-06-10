let g:startify_bookmarks = [
	\ { 'i': '~/.config/i3/config' },
	\ { 'a': '~/Projects/.dotfiles/config/alacritty/alacritty.yml' },
	\ { 'v': '~/Projects/.dotfiles/config/nvim/init.vim' },
	\ { 'z': '~/Projects/.dotfiles/.zshrc' },
	\ { 'b': '~/Projects/.dotfiles/.bashrc' }
	\ ]

let g:startify_lists = [
	\ { 'header': ['    Bookmarks'], 	'type': 'bookmarks' },
	\ { 'header': ['    Recent'], 		'type': 'files' },
	\ { 'header': ['    '. getcwd()], 	'type': 'dir' },
\ ]

let g:startify_use_unicode = 1

let g:startify_custom_header = [
	\ '       _  __             _     ',
	\ '      / |/ /__ ___ _  __(_)_ _ ',
	\ '     /    / -_) _ \ |/ / /  ` \',
	\ '    /_/|_/\__/\___/___/_/_/_/_/',
	\ ]
