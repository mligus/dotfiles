return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependency = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Reserve a space in the gutter
		-- This will avoid an annoying layout shift in the screen
		vim.opt.signcolumn = "yes"

		-- Advertize nvim-cmp capabilities to LSPs
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configure LSPs
		lspconfig.lua_ls.setup({
			-- capabilities = capabilities,
		})

		lspconfig.basedpyright.setup({
      capabilities = capabilities,
      -- Following might have been used to remove duplicate diagnostic messages
			-- capabilities = (function()
			-- 	local pyright_capabilities = vim.lsp.protocol.make_client_capabilities()
			-- 	pyright_capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
			-- 	return capabilities
			-- end)(),
			settings = {
				-- pyright: https://microsoft.github.io/pyright/#/settings
				-- basedpyright: https://docs.basedpyright.com/latest/configuration/language-server-settings/
				basedpyright = {
					disableOrganizeImports = true,
					analysis = {
						ignore = { "*" },
						typeCheckingMode = "basic",
						diagnosticMode = "openFilesOnly",
						inlayHints = {
							callArgumentNames = true,
						},
					},
				},
			},
		})

		lspconfig.ruff.setup({
			capabilities = capabilities,
			init_options = {
				settings = {
					-- https://docs.astral.sh/ruff/editors/settings/
					organizeImports = true,
					lineLength = 120,
				},
			},
		})

		-- Keymaps when LSP is attached
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP Actions",
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				-- Buffer local mappings.
				local opts = { buffer = event.buf, silent = true }
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", opts)
			end,
		})
	end,
}
