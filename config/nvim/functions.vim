" Statusline toggle
let g:buftabline_show=0
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
		let g:buftabline_show=0
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
		let g:buftabline_show=2
    endif
	call buftabline#update(0)
endfunction
