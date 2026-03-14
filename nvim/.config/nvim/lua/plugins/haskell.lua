return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4", 
  lazy = false, -- This plugin automatically lazy-loads itself
  init = function()
    -- Global configuration for haskell-tools
    vim.g.haskell_tools = {
      hls = {
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set('n', '<leader>ea', vim.lsp.codelens.run, opts)
          vim.keymap.set('n', '<leader>hs', require('haskell-tools').hoogle.hoogle_signature, opts)
        end,
      },
    }
  end,
}