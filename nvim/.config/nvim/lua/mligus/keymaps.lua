-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows (delta =  2 lines)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move selected range up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "J", "mzJ`z", opts)       -- same J but keep cursos in the same spot
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- go page down and keep cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts) -- go page up and keep cursor in the middle
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]], opts) -- paste over and preserve yanked text

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], opts) -- delete to void register

vim.keymap.set("n", "Q", "<nop>", opts)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

-- Quickfix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", opts)

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Some fun
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)
