-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- list of plugins to install
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer itself
  use 'glepnir/dashboard-nvim' -- dashboard
  use "EdenEast/nightfox.nvim" -- color scheme
    
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
