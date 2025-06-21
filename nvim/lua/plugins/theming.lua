return {
	{
		-- Pop-up ie. replace word in file
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					title_pos = "right",
					relative = "win",
					mappings = {
						i = {
							["<C-[>"] = "Close"
						}
					},
				}
			})
		end
	},
	{
		--StatusLine
		'nvim-lualine/lualine.nvim',
		lazy = true,
		event = "VeryLazy",
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename" },
					lualine_c = { "branch", "diff", "diagnostics" },
				}
			})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "VeryLazy",
		name = "ibl",
		config = function()
			require("ibl").setup(
				{
					indent = { highlight = { "VertSplit" }, char = "▏",
					},
					scope = { enabled = false,
					},
				}
			)
		end,
		opts = {

		}
	},

	-- Greeter Page
	-- {
	-- 	"goolord/alpha-nvim "
	-- },
	{
		-- Illuminate similar variables/words
		"RRethy/vim-illuminate",
		lazy = true,
		event = "VeryLazy",
	},
	-- 	For Highlighting function args
	-- 	{
	-- " m-demare/hlargs.nvim"
	-- 	}
	{
		-- Highlight Cursor when it moves
		"danilamihailov/beacon.nvim",
		lazy = true,
		event = "VeryLazy",

	},
	-- Highlight colorcolumn limits
	{
		'Bekaboo/deadcolumn.nvim',
		lazy = true,
		event = "VeryLazy",

	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("catppuccin").setup {
				flavour = "mocha"
			}
		end
	}
}
