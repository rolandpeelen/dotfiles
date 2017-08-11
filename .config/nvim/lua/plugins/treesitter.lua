return {
	{ "nkrkv/nvim-treesitter-rescript" },
	{
		"nvim-treesitter/nvim-treesitter",
		requires = { { "nkrkv/nvim-treesitter-rescript" } },
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
