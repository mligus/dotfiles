-- [[ plugins.lua ]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use { 'mhinz/vim-startify' }

  -- replacement of airline/powerline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- plugin which shows a git diff in the sign column
  use { 'airblade/vim-gitgutter' }

  -- theme
  use { 'Mofiqul/dracula.nvim' }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'majutsushi/tagbar' }
  use { 'Yggdroot/indentLine' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-commentary' }
  use { 
    'junegunn/gv.vim',
    requires = { { 'tpope/vim-fugitive' } }
  }
  use { 'windwp/nvim-autopairs' }
    
  -- tree-sitter syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  -- Python specific
  use { 'glench/vim-jinja2-syntax' }
  -- use { 'psf/black', cmd = { 'Black' } }
  use { 'psf/black' }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
