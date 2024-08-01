
return {

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "rust", "toml" },
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				ident = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}

			})
		end
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			mode = "workspace_diagnostics"

		}
	},
	{
		'windwp/nvim-autopairs',
		lazy = true,
		event = "InsertEnter",
		config = true
	},
	{
		"williamboman/mason.nvim",
		lazy = true,
		config = function()
			vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Toggle Mason" })
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "",
						package_pending = "",
						package_uninstalled = "",
					}
				}

			})
		end,
		opts = function()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/cmp-nvim-lua",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/cmp-vsnip",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"hrsh7th/cmp-path",
		lazy = true,
		event = "VeryLazy",

	},
	{
		"hrsh7th/cmp-buffer",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		event = "VeryLazy",

	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("rust-tools").setup({
				server = {}
			})
		end
	},
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true -- Auto close on trailing </
				},
			})
		end
	},
	{
		"hedyhli/outline.nvim",
		-- can replace with aerial
		name = "outline",
		lazy = true,
		cmd = { "Outline", "OutlineOpen" },
		keys = { -- Example mapping to toggle outline
			{ "<leader>lS", "<cmd>Outline<CR>", desc = "Toggle outline" },
		},
		config = function()
			require("outline").setup()
		end,
		opts = {
			-- Your setup opts here
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				numhl = true,
				-- linehl = true,
				word_diff = true
			})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"folke/neodev.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
}
