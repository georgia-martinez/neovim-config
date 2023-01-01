-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- dashboard
  use 'glepnir/dashboard-nvim'

  -- color scheme
  use "EdenEast/nightfox.nvim"
    
  -- nvim-tree
  use { 
    'nvim-tree/nvim-tree.lua',
    requires = {'nvim-tree/nvim-web-devicons'},
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
                               --  , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'

  use 'neovim/nvim-lspconfig' 
  use 'simrat39/rust-tools.nvim'

end)
