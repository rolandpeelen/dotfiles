return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"zls",
					"lua_ls",
					"bashls",
					"tailwindcss",
					"stylua",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "stevearc/conform.nvim" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities({
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			})

			vim.lsp.config("*", { capabilities = capabilities })
			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						check = {
							command = "clippy",
						},
						diagnostics = {
							enable = true,
						},
						inlayHints = {
							chainingHints = true,
							typeHints = true,
							parameterHints = true,
							bindingModeHints = {
								enable = true,
							},
							closureCaptureHints = {
								enable = true,
							},
						},
					},
				},
			})

			local tailwindCapabilities = capabilities
			tailwindCapabilities.textDocument.definition = nil
			vim.lsp.config("tailwindcss", {
				capabilities = tailwindCapabilities,
				-- other options
				init_options = {
					userLanguages = {},
				},
				filetypes = {
					"css",
					"scss",
					"sass",
					"html",
					"reason",
					"reasonml",
					"reason-ml",
					"rescript",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			vim.lsp.enable({ "conform", "rust_analyzer", "sourcekit",  })

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "ge", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {})
			-- vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, {})
		end,
	},
}
