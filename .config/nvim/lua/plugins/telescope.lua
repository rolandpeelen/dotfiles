return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".*/fixtures/.*", "next.config.js" },
					extensions = {
						fzf = {},
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
			})
			require("telescope").setup("fzf")
			local builtin = require("telescope.builtin")
			-- Trying overriding \f to \gf to show git files - not often I'm looking through files not version controlled
			-- vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			-- vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
			vim.keymap.set("n", "<leader>s", builtin.git_status, {})
			vim.keymap.set("n", "<leader>d", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>l", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_ivy({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
