# NeoVim Configuration


## Cheatsheet

Window navigation:
* Use `<C-h/j/k/l>` to move the cursor among windows
* Use `Ctrl` + arrow keys to resize windows
* In select mode, we can use `Tab` or `Shift-Tab` to change the indentation repeatedly

Auto-complete:
* Use `<C-k/j>` or `/` to move among completion items
* Use `<C-b/f>` to scroll among the doc of completion item
* Use `<CR>` to confirm completion

vim-commentary:
* use `gcc` to comment out a line (takes a count)
* use `gc` to comment out the target of a motion (for example, `gcap` to comment out a paragraph)
* use `gc` in **visual mode** to comment out the selection,
* and `gc` in operator pending mode to target a comment.
* You can also use it as a command, either with a range like `:7,17Commentary`

gitsigns.nvim:
* `<leader>tb` toggle current line blame

Telescope (fuzzy find):
* `<leader>ff` open find files
* `<leader>fg` open live grep
* `<leader>fb` open find buffer (search for buffer)
* `<leader>fh` search for help tags


NVim-tree:
* `<leader>e` open/close nvim-tree


Toggleterm (https://github.com/akinsho/toggleterm.nvim#usage):
* `ToggleTerm`
	* `:ToggleTerm size=40 dir=~/Desktop direction=horizontal`


## Install NeoVim

On Fedora Linus:

```bash
sudo dnf install -y neovim python3-neovim
```

Configure folders:

```bash
mkdir ~/.config/nvim
```

Clone `dotfiles` repo and copy config to that folder.


## Debug Adapter Protocol (DAP)

Links:
* https://davelage.com/posts/nvim-dap-getting-started/
* https://github.com/mfussenegger/nvim-dap
* https://microsoft.github.io/debug-adapter-protocol/overview


## Fonts and Colorschemes

* Nerd Fonts - https://www.nerdfonts.com/
* iTetm 2 Color Schemes - https://iterm2colorschemes.com/

## References and Links

* https://martinlwx.github.io/en/config-neovim-from-scratch/
* https://github.com/MartinLwx/dotfiles/tree/main/nvim
