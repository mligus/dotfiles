-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
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


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    -- use 'Mofiqul/dracula.nvim'
    use 'tanvirtin/monokai.nvim'

    -- LSP manager
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim'}

    -- Auto-completion engine
    use { 'neovim/nvim-lspconfig' }     -- configs for the Nvim LSP client
    use { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] }  -- completion engine plugin for Nvim written in Lua
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }      -- nvim built-in LSP auto-completion
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion

    -- Code snippet engine
    use 'L3MON4D3/LuaSnip'  -- Snippet Engine for Neovim written in Lua
    use { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } }  -- luasnip completion source for nvim-cmp

    -- Add hooks to LSP to support Linters and Formatters
    use { 'nvim-lua/plenary.nvim' }  -- all the Lua functions I don't want to write twice. 
    use {  -- mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
        'jay-babu/mason-null-ls.nvim',
        after = 'plenary.nvim',
        requires = { 'jose-elias-alvarez/null-ls.nvim' },  -- use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
        config=[[require('config.mason-null-ls')]]
    }

    -- VSCode-like pictograms for NeoVim built-in LSP
    use { 'onsails/lspkind.nvim' }

    -- Git support
    use { 'tpope/vim-fugitive' }

    -- Comment stuff out
    use { 'tpope/vim-commentary' }

    -- Git decorations
    use { 'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]] }

    -- Autopairs: [], (), "", '', etc
    use {
        "windwp/nvim-autopairs",
        after = 'nvim-cmp',
        config = [[require('config.nvim-autopairs')]],
    }

    -- Treesitter-integration
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = [[require('config.nvim-treesitter')]],
    }

    -- Telescope - highly extendable fuzzy finder over lists.
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Show indentation and blankline
    use { 'lukas-reineke/indent-blankline.nvim', config = [[require('config.indent-blankline')]] }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',  -- blazing fast and easy to configure Neovim statusline written in Lua.
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = [[require('config.lualine')]],
    }

    -- Smart indentation for Python
    use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

    -- Extra stuff for Python
    -- use { 'psf/black' }

    -- File explorer
    use {
        'nvim-tree/nvim-tree.lua',  -- A File Explorer For Neovim Written In Lua
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = [[require('config.nvim-tree')]]
    }

    -- Smart motion
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use {
        'akinsho/toggleterm.nvim', tag = '*', config = function()
        require("toggleterm").setup()
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
