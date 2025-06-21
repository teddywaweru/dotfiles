-- Editing
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>W", "<cmd>wall<CR>", { desc = "Write All buffer" })

vim.keymap.set("n", "<leader>Y", "\"+y", { desc = "Yank to System Clipboard" })
vim.keymap.set("v", "<leader>Y", "\"+y", { desc = "Yank to System Clipboard" })
vim.keymap.set("n", "<leader>D", "\"+d", { desc = "Delete to System Clipboard" })
vim.keymap.set("v", "<leader>D", "\"+d", { desc = "Delete to System Clipboard" })

vim.keymap.set("n", "<leader>;", "<Esc><S-a>;<Esc>", { desc = "Insert ; & Esc" })
vim.keymap.set("i", "<C-l>", "<Esc><S-a>;<CR>", { desc = "Insert ; & Continue" })


vim.keymap.set("v", "<C-p>", "10kzz", { desc = "Move up" })
vim.keymap.set("v", "<C-n>", "10jzz", { desc = "Move down" })

vim.keymap.set("n", "<leader>r", "<cmd>diffoff!<CR><cmd>windo diffthis<CR>", { desc = "Diff two open window buffers" })

-- Navigation
vim.keymap.set("n", "<leader>Z", "<cmd>qa<CR>", { desc = "Quit, if All saved." })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "N", "Nzzzv", { desc = "Center Search result and open fold" })
vim.keymap.set("n", "<C-p>", "10kzz", { desc = "Move up" })
vim.keymap.set("n", "<C-n>", "10jzz", { desc = "Move down" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center Search result and open fold" })

vim.keymap.set("n", "<leader>e", "<cmd>e %:h<CR>", { desc = "Open Current Buffer Location in netrw" })

-- Organization
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#<CR>", { desc = "Close all other buffers?" })
vim.keymap.set("n", "<leader>bd", ":bp|bd#<CR>", { desc = "Close current buffer and navigate to previous" })
vim.keymap.set("n", "<leader>W", "<cmd>wall<CR>", { desc = "Save all files changes" })

--     -- QuickFix Menu
vim.keymap.set("n", "<leader>fqo", "<cmd>copen<CR>", { desc = "Open the QuickFix List" })
vim.keymap.set("n", "<leader>fqc", "<cmd>cclose<CR>", { desc = "Close the QuickFix List" })
vim.keymap.set("n", "<leader>fql", "<cmd>call setqflist([],'r')<CR>", { desc = "Clear the QuickFix List" })
--
--     -- Tab Menu
vim.keymap.set("n", "<leader>Tn", "<cmd>tabnew<CR>", { desc = "Open a New Tab Section" })
vim.keymap.set("n", "<leader>Tm", "<cmd>tabm<CR>", { desc = "Move Current Tab to End" })
-- vim.keymap.set("n", "<leader>Ta", "<cmd>Telescope telescope-tabs list_tabs<CR>h", { desc = "List of all Tabs" })

-- LSP
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)


vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)
		vim.keymap.set("n", "<leader>bs", vim.lsp.buf.format, { desc = "Format buffer depending on LSP server attached" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename all instances of the variable?" })
	end
})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("format.rs", {}),
	pattern = ".rs",
	callback = function()
		local curr_file = vim.api.nvim_get_current_buf()
		vim.cmd("rustfmt" .. curr_file)
	end
})
