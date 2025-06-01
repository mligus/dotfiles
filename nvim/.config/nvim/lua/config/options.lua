vim.opt.guicursor = ""                  -- "fat" cursor in insert mode

vim.opt.number = true                   -- show line numbers
vim.opt.relativenumber = true           -- show relative line numbers

vim.opt.expandtab = true                -- use spaces instead of tabs
vim.opt.softtabstop = 4                 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4                  -- insert 4 spaces on a autoindent
vim.opt.tabstop = 4                     -- tab width of 4 spaces

vim.opt.smartindent = true 		-- smart autoindenting

vim.opt.backspace = "indent,eol,start"  -- backspaces work over newline

vim.opt.splitbelow = true               -- open new vertical split bottom
vim.opt.splitright = true               -- open new horizontal splits right
vim.opt.termguicolors = true            -- enable true colors (important for themes)
vim.opt.showmode = false                -- don't show the mode (e.g., -- INSERT --)
vim.opt.wrap = false                    -- disable line wrap
vim.opt.scrolloff =  8                  -- lines to keep above/below cursor
vim.opt.sidescrolloff = 8               -- columns to keep to the left/right of the cursor
vim.opt.colorcolumn = "120"	        -- show max length color column
vim.opt.foldenable = false              -- all folds are open by default

vim.opt.incsearch = true                -- search as characters are entered
vim.opt.hlsearch = false                -- do not highlight matches
vim.opt.ignorecase = true               -- ignore case in searches by default
vim.opt.smartcase = true                -- but make it case sensitive if an uppercase is entered

vim.opt.swapfile = false                -- will use undo fiels instead
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.encoding = "utf8"               -- string encoding to use
vim.opt.fileencoding = "utf8"           -- file encoding to use

vim.api.nvim_command[[filetype plugin on]]
vim.api.nvim_command[[autocmd FileType * setlocal formatoptions-=cro]]
vim.api.nvim_command[[autocmd FocusGained * checktime]]

vim.opt.splitright = true               -- place new window to right of current one
vim.opt.splitbelow = true               -- place new window below the current one

vim.opt.lazyredraw = true  		-- Don't redraw while executing macros (performance)
vim.opt.synmaxcol = 200    		-- Max column for syntax highlighting (performance)

vim.g.loaded_netrw = 1 			-- disable netrw (better at the very start of init.lua)
vim.g.loaded_netrwPlugin = 1

-- Set completeopt to have a better completion experience
vim.opt.completeopt = {'menuone', 'noselect'}
