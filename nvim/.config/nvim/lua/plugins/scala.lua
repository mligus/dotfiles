return {
  "scalameta/nvim-metals",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Optional: If you want to use the Telescope integration for Metals commands
    -- "nvim-telescope/telescope.nvim", 
  },
  ft = { "scala", "sbt", "java" },
  opts = function()
    local metals_config = require("metals").bare_config()
    
    -- Custom Metals settings
    metals_config.settings = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
    }
    
    metals_config.init_options.statusbarProvider = "on"
    
    -- Enable autocompletion capabilities
    -- (Assumes you have nvim-cmp setup as done in your lsp.lua)
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      metals_config.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    else
      metals_config.capabilities = capabilities
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })

    -- Useful Metals-specific keymaps
    vim.keymap.set("n", "<leader>mc", function()
      require("telescope").extensions.metals.commands()
    end, { desc = "Metals Commands" })
  end
}