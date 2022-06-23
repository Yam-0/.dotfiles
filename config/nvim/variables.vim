" leader key for mappings
let mapleader = " "

" Emmet
let g:user_emmet_leader_key='<c-e>'

" Alternate
let g:AlternatePaths = ['./include', '..', '.']
let g:AlternateExtensionMappings = [{'.cpp' : '.h', '.h' : '.hpp', '.hpp' : '.cpp'}, {'.c': '.h', '.h': '.c'}, {'.js': '.module.css', '.module.css': '.js'}, {'.js': '.module.scss', '.module.scss': '.js'}]

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_shortcut = '>'

" Snippet
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Disable dev icons on windows
if has('win32')
	let g:webdevicons_enable = 0
end

" Floaterm
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_keymap_toggle = '<c-t>'

" Buftabline
let g:buftabline_separators = 1
let g:buftabline_indicators = 1
