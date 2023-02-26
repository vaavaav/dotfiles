vim.o.ignorecase = true 
vim.o.relativenumber = true 
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.hlsearch = false

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>', {noremap = true})
vim.keymap.set('n', '<c-f>', ':FZF<CR>', {noremap = true})
vim.keymap.set('n', '<c-t>', ':ToggleTerm<CR>', {noremap = true})
