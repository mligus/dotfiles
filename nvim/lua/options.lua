vim.opt.clipboard = 'unnamedplus' 	-- use system clipboard and allow use of mouse
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'nv'                -- enable mouse in normal and visual modes


-- Tab config
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.scrolloff = 4               -- try to show at least 5 lines above and below cursor when scrolling
vim.opt.sidescrolloff = 8           -- columns of context
vim.opt.colorcolumn = '120' 		-- show max length color column
vim.opt.backspace = 'indent,eol,start'  -- backspaces work over newline
vim.opt.list = true                     -- show some invisible characters
vim.opt.wildmode = {'list', 'longest'}  -- command-line completion mode
vim.opt.wrap = false                    -- disable line wrap
vim.opt.foldenable = false          -- all folds are open by default


-- Search
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Filetypes
vim.opt.encoding = 'utf8'           -- string encoding to use
vim.opt.fileencoding = 'utf8'       -- file encoding to use
-- Set filetype behaviors and hooks
vim.api.nvim_command[[filetype plugin on]]
vim.api.nvim_command[[autocmd FileType * setlocal formatoptions-=cro]]
vim.api.nvim_command[[autocmd FocusGained * checktime]]

-- Split config
vim.opt.splitright = true               -- place new window to right of current one
vim.opt.splitbelow = true               -- place new window below the current one

-- for nvim-tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1




-- Auto-commands
-- vim.api.nvim_command[[autocmd BufWritePre *.py execute 'Black']]  -- auto execute black for python files on save