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
					"lua_ls",
					"rescriptls",
					"rust_analyzer",
					"sqlls",
					"tsserver",
					"hls",
					"cssls",
					"bashls",
					"ocamllsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.rescriptls.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.sqlls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.hls.setup({})
			lspconfig.elixirls.setup({
				cmd = { "/Users/rwjpeelen/Git/tools/elixir-ls/release/language_server.sh" },
				filetypes = { "ex", "exs", "elixir" },
				root_dir = lspconfig.util.root_pattern("mix.exs"),
			})
			lspconfig.cssls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.ocamllsp.setup({})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<CR>", vim.lsp.buf.hover, {})
		end,
	},
}
