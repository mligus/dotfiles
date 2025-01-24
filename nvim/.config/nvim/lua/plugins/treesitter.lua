return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"python",
				"scala",
				"rust",
				"c",
				"sql",
				"dockerfile",
				"javascript",
				"html",
				"json",
				"odin",
				"lua",
				"vim",
				"vimdoc",
				"query",
			},
      auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
		})
	end,
}
