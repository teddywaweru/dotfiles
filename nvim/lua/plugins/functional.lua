return {

	{
		--Resession
		"stevearc/resession.nvim",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>ss", ":lua require('resession').save()<CR>", "n", desc = "Save Session",
			},
			{
				"<leader>st", ":lua require('resession').save_tab()<CR>", "n", desc = "Save Tab Session",
			},
			{
				"<leader>sl", ":lua require('resession').load()<CR>", "n", desc = "Load Session",
			},
			{
				"<leader>sd", ":lua require('resession').delete()<CR>", "n", desc = "Delete Session",
			}
		},
		config = function()
			local resession = require("resession")
			require("resession").setup({
				autosave = {
					enabled = true,
					interval = 60,
					notify = false
				}
			})
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					resession.save("last")
				end
			})
		end
	},
	{
		-- Vifm
		"vifm/vifm.vim",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>v", "<cmd>Vifm<CR>", desc = "Open Vifm File View"
			}
		}
	},
	{
		-- Tmux Navigator
		'christoomey/vim-tmux-navigator',
		event = "VeryLazy",
		-- keys = {
		-- 	{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>",     "n" },
		-- 	{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>",     "n" },
		-- 	{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>",       "n" },
		-- 	{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>",    "n" },
		-- 	{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", "n" },
		-- },
	},
	{
		-- Plenary
		"nvim-lua/plenary.nvim",
		name = "plenary",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("plenary")
		end
	},
	-- {
	-- 	-- Save sessions
	-- 	"rmagatti/auto-session",
	-- 	Lazy = true,
	-- 	event = "TabEnter"
	-- },
	{
		-- Scoped Tabs
		"tiagovla/scope.nvim",
		Lazy = true,
		event = "TabEnter"
	},
	{
		-- Marks
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
		-- Which Key
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
		end,
		opts = {}
	},
	{
		-- Notify
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
		-- LazyGit
		"kdheepak/lazygit.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"plenary"
		},
		keys = {
			{
				"<leader>lg",
				function()
					local gitdir = vim.fn.system("git rev-parse --show-toplevel")
					local _ = "-p " .. gitdir
					-- return "<cmd>LazyGit " .. flags .. "<CR>"
					vim.cmd("LazyGit")
				end,
				desc = "Toggle LazyGit"
			}
		},
	},
	{
		"AckslD/nvim-neoclip.lua",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>f/", "<cmd>Telescope neoclip<CR>", "n", desc = "Search in texts"
			}
		},
		config = function()
			require('neoclip').setup()
			require('telescope').load_extension('neoclip')
		end
	},
	{
		-- Hop
		"smoka7/hop.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = { "HopChar1", "HopLine" },
		keys = {
			{
				"gl", "<cmd>HopChar1MW<CR>", "n", desc = "Hop to a character"
			}
		},
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup {
				keys = 'etovxqpdygfblzhckisuran',
				case_insensitive = false }
		end,
		opts = {}
	},
	-- Splitting/Joining blocks of code arrays, hashes, statements, objects
	{
		"Wansmer/treesj",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>lT", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join code blocks "
			}
		},
		config = function()
			require("treesj").setup({
				max_join_length = 1500,
				use_default_keymaps = false
			})
		end
	},
	{
		-- Surround
		"kylechui/nvim-surround",
		version = "*",
		lazy = true,
		event = "BufEnter",
		opts = {},
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		-- ToggleTerm
		"akinsho/toggleterm.nvim",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>t", "<cmd>ToggleTerm<CR>", "n", desc = "Toggle Floating terminal"
			}
		},
		config = function()
			require("toggleterm").setup({
				-- open_mapping = false,
				-- insert_mapping = false,
				terminal_mapping = true,
				autochdir = true,
				direction = "float",
				float_opts = {
					border = "curved",
					width = 150,
					height = 40,
					title_pos = "center"
				}
			})
		end,
		opts = function()
			vim.keymap.set("t", "<C-h>", "<cmd>ToggleTerm<CR>",{ desc = "Toggle Floating terminal" })
			vim.keymap.set("t", "<C-j>", "<cmd>ToggleTerm<CR>",{ desc = "Toggle Floating terminal" })
			vim.keymap.set("t", "<C-k>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Floating terminal" })
			vim.keymap.set("t", "<C-l>", "<cmd>ToggleTerm<CR>",{ desc = "Toggle Floating terminal" })
		end
	},
	{
		"mbbill/undotree",
		lazy = true,
		event = "VeryLazy",
	},
	-- {
	-- 	"NvChad/nvim-colorizer.lua",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- },
	{
		--TODO
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		-- Color Code Colorizer
		"norcalli/nvim-colorizer.lua",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end
	}
}
