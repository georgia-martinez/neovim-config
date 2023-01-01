-- Hybrid line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Color scheme
vim.cmd("colorscheme nordfox")

-- Plugins
require("user.keymaps")
require("user.dashboard")
require("user.nvim-tree")
require("user.treesitter")
require("user.mason")

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
