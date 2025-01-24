return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.keymap.set("n", "<leader>ee", "<cmd>Neotree filesystem reveal left toggle<cr>", { desc = "Toggle Neotree file explorer" })
      vim.keymap.set("n", "<leader>eb", "<cmd>Neotree buffers reveal left toggle<cr>", { desc = "Toggle Neotree buffers explorer" })
    end
}
