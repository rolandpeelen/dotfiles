-- yank highlight
local aug = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = aug,
	callback = function()
		vim.highlight.on_yank()
	end,
})

