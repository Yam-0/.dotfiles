" ctrl-c to escape everywhere
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Misc
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap Y y$

" Fuzzy finder
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :BLines<CR>

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
vmap <c-h> {
vmap <c-l> }

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

" Statusline toggle
nnoremap <leader>t :call ToggleHiddenAll()<CR>

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
