return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				swift = { "swift" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		vim.keymap.set("n", "gf", conform.format, {})
	end,
}
