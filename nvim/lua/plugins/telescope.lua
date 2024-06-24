return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = true,
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")

		-- Clone the default Telescope configuration
		-- local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

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
		local vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--no-ignore-vcs"
		}

		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Search files" })
		vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = "Grep string under cursor" })
		vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Grep word" })
		vim.keymap.set('n', '<leader>fF',
			function()
				local find_command = {
					'rg', '--files', '--no-ignore-vcs', '--hidden'
				}
				builtin.find_files({ find_command = find_command })
			end,
			{ desc = "Search files incl. hidden" })
		vim.keymap.set('n', '<leader>fW', function()
			builtin.live_grep({ vimgrep_arguments = vimgrep_arguments })
		end, { desc = "Grep incl. hidden" })
		vim.keymap.set('n', '<leader>fC', function()
			builtin.grep_string({ vimgrep_arguments = vimgrep_arguments })
		end, { desc = "Grep string under cursor incl. hidden" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search in help tags" })
		vim.keymap.set('n', '<leader>lD', builtin.diagnostics,
			{ desc = "Search Open Buffer Diagnostics" })
	end
}
