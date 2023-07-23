-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ','
vim.g.localleader = '\\'

require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')