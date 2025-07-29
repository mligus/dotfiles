return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependency = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Advertize nvim-cmp capabilities to LSPs
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Configure LSPs

        -- Lua
		lspconfig.lua_ls.setup({ capabilities = capabilities })

        -- C lang
        lspconfig.clangd.setup({ capabilities = capabilities })

        -- Python
        local on_attach_pyright = function(client, _)
            client.server_capabilities.hoverProvider = true
        end
        lspconfig.pyright.setup({
            on_attach = on_attach_pyright,
            capabilities = (function()
                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
                return capabilities
            end) (),
            settings = {
                python = {
                    analysis = {
                        useLibraryCodeForTypes = true,
                        diagnosticSeverityOverrides = {
                            reportUnusedVariable = "warning",
                        },
                        typeCheckingMode = "off", -- Set type-checking mode to off
                        diagnosticMode = "off", -- Disable diagnostics entirely
                    },
                },
            },
        })

        local on_attach_ruff = function(client, _)
            if client.name == "ruff" then
                -- disable hover in favor of pyright
                client.server_capabilities.hoverProvider = false
            end
        end

        lspconfig.ruff.setup({
            on_attach = on_attach_ruff,
			capabilities = capabilities,
			init_options = {
				settings = {
					-- https://docs.astral.sh/ruff/editors/settings/
					organizeImports = true,
					lineLength = 120,
				},
			},
		})

        --

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
