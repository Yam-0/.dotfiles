" ctrl-c to escape everywhere
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>
tmap <c-c> <C-\><C-n>

" escape
imap jk <esc>
imap kj <esc>

" Misc
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap Y y$

" Fuzzy finder
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Lines<CR>

" Auto pairs
inoremap (<tab> ()<Left>
inoremap {<tab> {}<Left>
inoremap [<tab> []<Left>
inoremap "<tab> ""<Left>
inoremap '<tab> ''<Left>
inoremap (; ();<Left><Left>
inoremap {; {};<Left><Left>
inoremap [; [];<Left><Left>
inoremap (, (),<Left><Left>
inoremap {, {},<Left><Left>
inoremap [, [],<Left><Left>

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" Add empty lines
nnoremap <c-j> o<esc>cc<esc>
nnoremap <c-k> O<esc>cc<esc>

" Easy brackets
imap <c-h> {
imap <c-j> }
imap <c-k> [
imap <c-l> ]
nmap <c-h> {
nmap <c-l> }

" Moving and copying lines
vnoremap <a-j> :m '>+1<CR>gv=gv
vnoremap <a-k> :m '<-2<CR>gv=gv
nnoremap <a-j> :m .+1<CR>==
nnoremap <a-k> :m .-2<CR>==
vnoremap <a-J> y<esc>P==gv=gv
vnoremap <a-K> y<esc>'>p==gv=gv
nnoremap <a-J> yyp==
nnoremap <a-K> yyP==
nnoremap <Tab> >>
nnoremap <s-Tab> <<
vnoremap <Tab> >gv
vnoremap <s-Tab> <gv

" Alt+ navigation
nnoremap <a-h> ^
nnoremap <a-l> g_
vnoremap <a-h> ^
vnoremap <a-l> g_
inoremap <a-h> <esc>i
inoremap <a-l> <esc>la
inoremap <a-j> <c-o>j
inoremap <a-k> <c-o>k
inoremap <a-w> <esc>lwi
inoremap <a-W> <esc>lWi
inoremap <a-b> <esc>bi
inoremap <a-B> <esc>Bi
inoremap <a-e> <esc>ea
inoremap <a-E> <esc>Ea

" Buffers
nnoremap <silent> <leader>s :w<CR>:bp\|bd<space>#<CR>
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bNext<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <c-b> <c-^>

" Split resize
nnoremap <silent> <Right> :vert res +3<CR>
nnoremap <silent> <Left> :vert res -3<CR>
nnoremap <silent> <Up> :res -1<CR>
nnoremap <silent> <Down> :res +1<CR>

" File navigation
nnoremap <leader>f :NERDTreeToggle<CR>

" Number toggle
nnoremap <leader>r :call ToggleNumber()<CR>

" Statusline toggle
nnoremap <leader>t :call ToggleHiddenAll()<CR>

" Spellcheck
nnoremap <leader>cc :set spell spelllang=sv<cr>
nnoremap <leader>cC :set nospell<cr>
nnoremap <leader>cl ]s
nnoremap <leader>ch [s
nnoremap <leader>cw z=

" Git
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" Alternate between files
nnoremap <leader>S :Alternate<CR>

" Text block
nnoremap <leader>gg gqip

" Snippets
imap <c-w> <Plug>(coc-snippets-expand-jump)
