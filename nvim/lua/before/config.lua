vim.g.mapleader = " "
vim.g.netrw_preview = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.foldmethod = "indent"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.termguicolors = true
vim.o.timeoutlen = 200
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.updatetime = 100
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.foldcolumn = "2"
vim.opt.clipboard = "unnamed"
vim.opt.wrap = true
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 5
vim.opt.more = true
vim.opt.hidden = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
	end,
})
