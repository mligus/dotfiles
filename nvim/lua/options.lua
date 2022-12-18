-- [[ options.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Context ]]
opt.colorcolumn = "120"             -- show max length color column
opt.number = true                   -- show line numbers
opt.relativenumber = true           -- show relative line numbers
opt.scrolloff = 4                   -- try to show at least 5 lines above and below cursor when scrolling
opt.sidescrolloff = 8               -- columns of context
opt.signcolumn = "number"           -- display signs in number column 
opt.clipboard = "unnamedplus"       -- allow normal work with system buffer
opt.backspace = "indent,eol,start"
-- opt.cursorline = true
opt.list = true                     -- show some invisible characters
opt.mouse = "nv"                    -- enable mouse in normal and visual modes
opt.wildmode = {"list", "longest"}  -- command-line completion mode
opt.wrap = false                    -- disable line wrap

-- [[ Filetypes ]]
opt.encoding = "utf8"               -- string encoding to use
opt.fileencoding = "utf8"           -- file encoding to use
-- Set filetype behaviors and hooks
cmd[[filetype plugin on]]
cmd[[autocmd FileType * setlocal formatoptions-=cro]]
cmd[[autocmd FocusGained * checktime]]


-- [[ Theme ]]
opt.syntax = "ON"                   -- allow syntax highlighting
opt.termguicolors = true            -- if term supports ui color then enable
cmd[[colorscheme dracula]]          -- set color scheme

-- [[ Search ]]
opt.ignorecase = true               -- ignore case in search patterns
opt.smartcase = true                -- override ignorecase if search contains capitals
opt.incsearch = true                -- use incremental search
opt.hlsearch = true                 -- highlight search matches


-- [[ Whitespace ]]
opt.expandtab = true                -- use spaces instead of tabs
opt.shiftwidth = 4                  -- size of an indent
opt.softtabstop = 4                 -- number of spaces tabs count for in insert mode
opt.tabstop = 4                     -- number of spaces tabs count for in the file


-- [[ Splits ]]
opt.splitright = true               -- place new window to right of current one
opt.splitbelow = true               -- place new window below the current one


-- [[ Commands ]]
cmd[[autocmd BufWritePre *.py execute 'Black']]  -- auto execute black for python files on save

