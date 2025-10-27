-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

local map = vim.keymap

-- Start visual mode with the same area as the previous area and the same mode
map.set("v", "<", "<gv", opts)
map.set("v", ">", ">gv", opts)

-- Selection movement
map.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- move selected range up
map.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- move selected range down
map.set("n", "J", "mzJ`z", opts) -- same J but keep cursos in the same spot

-- Copy (yank) to system clipboard
map.set({ "n", "v" }, "<leader>y", [["+y]], opts)
map.set("n", "<leader>Y", [["+Y]], opts)
map.set("x", "<leader>p", [["_dP]], opts) -- paste over and preserve yanked text

-- Delete to void register
map.set({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Search and replace word under cursor
map.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Move between search results (next/prev) in a better way
map.set("n", "n", "nzzzv", opts)
map.set("n", "N", "Nzzzv", opts)
