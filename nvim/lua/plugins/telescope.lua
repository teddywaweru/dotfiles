return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-[>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					}
				}
			}
		})
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Search files" })
		-- vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = "Search files in curr dir" })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Search string under cursor" })
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Search word" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search in help tags" })
		vim.keymap.set('n', '<leader>lD', builtin.diagnostics,
			{ desc = "Search Open Buffer Diagnostics" })
	end
}
