return {
	{ "ahrefs/vim-styled-ppx" },
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
					"pylsp",
					"rescriptls",
					"rust_analyzer@2024-10-21",
					"ts_ls",
					"hls",
					"sqls",
					"cssls",
					"bashls",
					"tailwindcss",
					"texlab",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.texlab.setup({ capabilities = capabilities })

			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })
			lspconfig.sqls.setup({ capabilities = capabilities })
			lspconfig.rescriptls.setup({
				capabilities = capabilities,
				settings = {
					extensionConfiguration = {
						allowBuiltInFormatter = true,
						askToStartBuild = false,
						cache = {
							projectConfig = {
								enabled = true,
							},
						},
						codeLens = true,
						incrementalTypechecking = {
							acrossFiles = true,
							enabled = true,
						},
						inlayHints = {
							enable = true,
						},
					},
				},
			})
			lspconfig.rust_analyzer.setup({
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

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
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
					"rescript",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.hls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.ocamllsp.setup({ capabilities = capabilities })
			lspconfig.swift_mesonls.setup({
				filetypes = { "swift" },
				capabilities = capabilities,
			})
			lspconfig.ocamllsp.mason = false

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "ge", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, {})
		end,
	},
}
