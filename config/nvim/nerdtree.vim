" Minimal ui
let NERDTreeMinimalUI=1
augroup nerdtreehidecwd
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
augroup end

" Behave Nerdtree!
let NERDTreeMapCustomOpen='l'
let NERDTreeMapCloseDir='h'
