return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "All files search (in current directory)" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git file search" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find text in files" })
  end,
}
