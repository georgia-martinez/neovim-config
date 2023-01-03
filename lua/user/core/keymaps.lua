vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap

-- General
map.set("i", "jk", "<ESC>")

map.set("n", "<leader>sv", "<C-w>v") -- split window vertically
map.set("n", "<leader>sh", "<C-w>s") --- split window horizontally
map.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
map.set("n", "<leader>sx", ":close<CR>") -- close current split window

map.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
map.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
map.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
map.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- nvim-tree
map.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- turn finder on and off
map.set("n", "<leader>w", "<C-w>w") -- switch between finder and window
