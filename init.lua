-- Hybrid line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Color scheme
vim.cmd("colorscheme nordfox")

-- Plugins
require("user.dashboard")
require("user.nvim-tree")
