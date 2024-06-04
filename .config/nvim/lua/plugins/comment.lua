return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<Leader>cc",
				---Block-comment toggle keymap
				block = "<Leader>bc",
			},
			opleader = {
				---Line-comment keymap
				line = "<Leader>cc",
				---Block-comment keymap
				block = "<Leader>bc",
			},
		})
	end,
}
