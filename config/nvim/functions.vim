" Number toggle
let s:number_toggle = 1
function! ToggleNumber()
	if  s:number_toggle == 0
		let s:number_toggle = 1
		set nonumber norelativenumber
	else
		if  s:number_toggle == 1
			let s:number_toggle = 2
			set number norelativenumber
		else
			let s:number_toggle = 0
			set number relativenumber
		endif
	endif
endfunction

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
