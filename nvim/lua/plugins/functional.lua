
return {

	{
		"vifm/vifm.vim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		'christoomey/vim-tmux-navigator',
		event = "VeryLazy"
	},
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("plenary")
		end
	},
	{
		-- Save sessions
		"rmagatti/auto-session",
		Lazy = true,
		event = "TabEnter"
	},
	{
		-- Scoped Tabs
		"tiagovla/scope.nvim",
		Lazy = true,
		event = "TabEnter"
	},
	{
		"chentoast/marks.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("marks").setup({
				default_mappings = false,
				builtin_marks = { ".", "<", ">", "#", "@", "$" },
				-- whether movements cycle back to the beginning/end of buffer. default true
				cyclic = true,
				-- whether the shada file is updated after modifying uppercase marks. default false
				force_write_shada = true,
				-- how often (in ms) to redraw signs/recompute mark positions.
				refresh_interval = 250,
				-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
				-- marks, and bookmarks.
				-- can be either a table with all/none of the keys, or a single number, in which case
				-- the priority applies to all marks.
				-- default 10.
				sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
				mappings = {
					toggle = "m'",
					set_next = "m,",
					next = "m]",
					preview = "m:",
					prev = "m[",
					delete = "dm",
					delete_line = "dm;",
					delete_buf = "dm<space>"
				}
			})
		end
	},
	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeout = 50
		end,
		opts = {}
	},
	{
		"rcarriga/nvim-notify",
		lazy = true,
		event = "VeryLazy",
		config = function(_, opts)
			-- vim.opt.termguicolors = true
			local notify = require("notify")
			notify.setup()
			opts.top_down = false
			opts.background_colour = "#000000"
			notify.setup(opts)
			vim.notify = notify
		end,
	},
	{
		"f-person/git-blame.nvim",
		lazy = true,
		event = "BufEnter",
		config = function()
			require("gitblame").setup()
		end
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"plenary"
		},
		config = function()
			vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Toggle LazyGit" })
		end,
		opts = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.9
		end
	},
	{
		"AckslD/nvim-neoclip.lua",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require('neoclip').setup()
			require('telescope').load_extension('neoclip')
			vim.keymap.set("n", "<leader>f/", "<cmd>Telescope neoclip<CR>", { desc = "Search in texts" })
		end
	},
	{
		"smoka7/hop.nvim",
		lazy = true,
		event = "VeryLazy",
		-- branch = 'v2', -- optional but strongly recommended
		cmd = { "HopChar1", "HopLine" },
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup {
				keys = 'etovxqpdygfblzhckisuran',
				case_insensitive = false }
		end,
		opts = {
		}
	},
	-- Splitting/Joining blocks of code arrays, hashes, statements, objects
	{
		"Wansmer/treesj",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("treesj").setup({
				max_join_length = 1500,
				use_default_keymaps = false

			})
			vim.keymap.set('n', '<leader>lT', '<cmd>TSJToggle<CR>', { desc = "Toggle Split/Join code blocks " })
		end
	},
	{
		"kylechui/nvim-surround",
		lazy = true,
		event = "VeryLazy",
		version = "*",
		opts = {}
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				-- insert_mapping = false,
				-- terminal_mapping = false,
				autochdir = true,
				direction = "float",
				float_opts = {
					border = "curved",
					width = 150,
					height = 30,
					title_pos = "center"
				}
			})
		end,
		opts = function()
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Floating terminal" })
		end

	},
	{
		"mbbill/undotree",
		lazy = true,
		event = "VeryLazy",
	},
	{
		'ThePrimeagen/harpoon',
		event = "VeryLazy",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			vim.keymap.set("n", "<leader>aa", mark.add_file)
			vim.keymap.set("n", "<leader>au", ui.toggle_quick_menu)
			vim.keymap.set("n", "H", ui.nav_prev)
			vim.keymap.set("n", "L", ui.nav_next)
			vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
			vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
			vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
			vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
			vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
			require("harpoon").setup({
				save_on_change = true,
				tabline = false,
				menu = {
					-- width = vim.api.nvim_win_get_width(0) - 20,
					width = 60,
					height = vim.api.nvim_win_get_height(0) - 30
				}
			})
		end
	},
}
