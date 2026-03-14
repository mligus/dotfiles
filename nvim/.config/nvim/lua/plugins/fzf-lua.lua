-- ~/.config/nvim/lua/plugins/fzf-lua.lua

return {
  "ibhagwan/fzf-lua",
  -- Optional: for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    
    -- Setup fzf-lua 
    fzf.setup({
      "telescope", -- This brilliant preset makes fzf-lua look and behave exactly like Telescope!
      winopts = {
        preview = {
          default = "bat", -- Highly recommended: install 'bat' on your OS for syntax highlighted previews
        }
      }
    })

    -- Core search keymaps
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = "Fuzzy find files in cwd" })
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = "Fuzzy find string in cwd" })
    vim.keymap.set('n', '<leader>fc', fzf.grep_cword, { desc = "Fuzzy find string under cursor" })
    vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Fuzzy find open buffers" })
    vim.keymap.set('n', '<leader>fh', fzf.help_tags, { desc = "Fuzzy find help tags" })
    
    -- LSP specific keymaps (Perfect for your Python, Scala, and Haskell setup)
    vim.keymap.set('n', '<leader>fr', fzf.lsp_references, { desc = "Fuzzy find LSP references" })
    vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, { desc = "Fuzzy find document symbols" })
    vim.keymap.set('n', '<leader>ca', fzf.lsp_code_actions, { desc = "Fuzzy find code actions" })
  end
}