" Folding
set foldenable
set foldmethod=manual

lua << EOF

vim.o.foldcolumn = '0'
vim.wo.foldlevel = 99
vim.wo.foldenable = true

require('ufo').setup()

EOF
