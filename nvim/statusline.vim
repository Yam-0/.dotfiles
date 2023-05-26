" Global statusline
set laststatus=3

highlight Mode gui=bold guibg=Gray12 guifg=white

" Status Line Customization
let g:currentmode={
    \ 'n'  : 'NORMAL',
    \ 'v'  : 'VISUAL',
    \ 'i'  : 'INSERT',
    \ 'R'  : 'REPLACE',
    \ 'c'  : 'COMMAND',
    \ 't'  : 'TERMINAL'
    \}

function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'VISUAL'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

function! BufferChanged() abort
	if getbufinfo('%')[0].changed
		return '+'
	else
		return ' '
	endif
endfunction

function! GitBranch() abort
	let branch = gitbranch#name()
	if empty(branch) | return 'Not a repository' | end
	let line = ' ' . branch
	return line
endfunction

" Clear
set statusline=

" Mode
set statusline+=%#Mode#
set statusline+=\ %{ModeCurrent()}\ 

" Branch
set statusline+=%#LineNr#
set statusline+=\ %{GitBranch()}\ 
set statusline+=%=

set statusline+=%=

" Position
set statusline+=\ %l:%c
set statusline+=\ %{coc#status()}%{get(b:,'coc_current_function','')}

" --------------------------------------------------------------------------------------------------------------------
" Winbar

" Clear
set winbar=

set winbar+=%#LineNr#
set winbar+=\ \ %{WebDevIconsGetFileTypeSymbol()}\ 
set winbar+=%t
set winbar+=%{BufferChanged()}

set winbar+=%=

set winbar+=%=

set winbar+=%#LineNr#
set winbar+=\ %{&filetype}\ 
