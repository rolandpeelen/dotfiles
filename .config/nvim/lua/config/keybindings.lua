-- keymaps
local map = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- Oil
map("n", "<Leader>k", ":Oil<CR>")

-- tabs
map("n", "t<Right>", ":tabnext<CR>")
map("n", "t<Left>", ":tabprev<CR>")
map("n", "tn", ":tabnew<CR>")
map("n", "tc", ":tabclose<CR>")
map("n", "th", ":tabprev<CR>")
map("n", "tl", ":tabnext<CR>")
map("n", "tt", ":tablast<CR>")

-- quickfix next/prev
map("n", "<leader>cn", ":cnext<CR>", { noremap = true })
map("n", "<leader>cp", ":cprev<CR>", { noremap = true })
