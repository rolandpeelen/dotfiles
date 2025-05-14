return {
	"saghen/blink.cmp",
	version = "1.*",
	config = function()
		require("blink.cmp").setup({
			-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
			-- build = "cargo +nightly build --release",
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					"select_next",
					"snippet_forward",
					"fallback",
				},
				["<S-Tab>"] = {
					"select_prev",
					"snippet_backward",
					"fallback",
				},
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "Nerd Font Mono",
			},
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "rust",
				prebuilt_binaries = {
					download = true,
					ignore_version_mismatch = false,
				},
			},
		})
	end,
}
