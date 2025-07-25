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
					"pylsp",
					"rescriptls",
					"hls",
					"sqls",
					"cssls",
					"bashls",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "stevearc/conform.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}

			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
			local conform = require("conform")
			local util = require("lspconfig.util")

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "ge", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, {})

			lspconfig.texlab.setup({ capabilities = capabilities })

			lspconfig.sourcekit.setup({
				capabilities = capabilities,
				root_dir = util.root_pattern("Package.swift", "buildServer.json", "compile_commands.json", ".git"),

				vim.keymap.set("n", "gf", conform.format, {}),
			})

			lspconfig.zls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			local venv_path = os.getenv("VIRTUAL_ENV")
			local py_path = nil
			-- decide which python executable to use for mypy
			if venv_path ~= nil then
				py_path = venv_path .. "/bin/python3"
			else
				py_path = vim.g.python3_host_prog
			end

			lspconfig.pylsp.setup({
				settings = {
					pylsp = {
						plugins = {
							-- formatter options
							black = { enabled = true },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							-- linter options
							pylint = {
								enabled = true,
								executable = "pylint",
							},
							ruff = { enabled = false },
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							-- type checker
							pylsp_mypy = {
								enabled = true,
								overrides = { "--python-executable", py_path, true },
								report_progress = true,
								live_mode = false,
							},
							-- auto-completion options
							jedi_completion = { fuzzy = true },
							-- import sorting
							isort = { enabled = true },
						},
					},
				},
				flags = {
					debounce_text_changes = 200,
				},
				capabilities = capabilities,
			})

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

			local tailwindCapabilities = capabilities
			tailwindCapabilities.textDocument.definition = nil
			lspconfig.tailwindcss.setup({
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
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.hls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.ocamllsp.setup({ capabilities = capabilities })
		end,
	},
}
