require("user.packer")
require("user.core.options")
require("user.core.keymaps")
require("user.plugins.dashboard")
require("user.plugins.nvim-tree")
require("user.plugins.treesitter")
require("user.plugins.mason")

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
