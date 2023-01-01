vim.g.mapleader = " "
vim.g.maplocalleader = " "

function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("i", "<Bslash>", "<Esc>") 
map("n", "<leader>n", ":NvimTreeToggle<CR>")
map("n", "<leader>w", "<C-w>w")
