vim.cmd('filetype plugin on')

-- options
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.numberwidth = 4
vim.opt.colorcolumn = "110"
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.hidden = true
vim.opt.list = true
vim.opt.title = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.lazyredraw = false
vim.opt.titlestring = "VIM: %-t %y %a%r%m"
vim.opt.titlelen = 70
vim.opt.scrolloff = 25
vim.opt.relativenumber = true


-- true color
if vim.fn.has("nvim") == 1 then
	vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
end
if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end
