vim.o.ignorecase = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.hlsearch = false
vim.g.mapleader = " "

vim.keymap.set("n", "<c-f>", ":FZF<CR>", { noremap = true })
vim.keymap.set({ "n", "v" }, "<c-u>", "<c-u>zz")
vim.keymap.set({ "n", "v" }, "<c-d>", "<c-d>zz")
vim.keymap.set({ "n", "v" }, "n", "nzz")
vim.keymap.set({ "n", "v" }, "N", "Nzz")
vim.keymap.set({ "n", "v" }, "<Leader>p", '"_dP')

-- Tmux
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

-- Copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
