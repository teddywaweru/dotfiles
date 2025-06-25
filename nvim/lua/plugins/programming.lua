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
		keys = {
			{
				"<leader>m", "<cmd>Mason<CR>", desc = "Toggle Mason"
			}
		},
		config = function()
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
		-- Complete Lua runtime API
		"hrsh7th/cmp-nvim-lua",
		lazy = true,
		event = "VeryLazy",
	},
	{
		-- Highlight function signature variable
		"hrsh7th/cmp-nvim-lsp-signature-help",
		lazy = true,
		event = "VeryLazy",
	},
	{
		"rafamadriz/friendly-snippets",
		-- dependencies = { },
	},
	{
		"hrsh7th/cmp-vsnip",
		lazy = true,
		event = "VeryLazy",
	},
	{
		-- Completion of filesystem paths
		"hrsh7th/cmp-path",
		lazy = true,
		event = "VeryLazy",

	},
	{
		-- Suggesting words in the buffer
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
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"williamboman/mason.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio"
		},
		lazy = true,
		event = "VeryLazy",
		keys = {
			{
				"<leader>db", "<cmd>:lua require('dap').toggle_breakpoint()<CR>", "n", desc = "Toggle Breakpoint",
			},
			{
				"<leader>dr", "<cmd>:lua require('dap').continue()<CR>", "n", desc = "Start/Resume Debugger"
			},
			{
				"<leader>dt", "<cmd>:lua require('dap').terminate()<CR>", "n", desc = "Close Debugger"
			},
			{
				"<leader>di", "<cmd>:lua require('dap').step_into()<CR>", "n", desc = "Step Into"
			},
			{
				"<leader>do", "<cmd>:lua require('dap').step_over()<CR>", "n", desc = "Step Over"
			},
			{
				"<leader>dO", "<cmd>:lua require('dap').step_out()<CR>", "n", desc = "Step Out"
			},
			{
				"<leader>dh", "<cmd>:lua require('dap').hover()<CR>", "n", desc = "Hover"
			}

		},
		opts = {},
		config = function()
			vim.fn.sign_define('DapBreakpoint', {
				text = "✪ ",
				texthl = "hl-DiagnosticHint",
				linehl = "yellow",
				numhl =
				"green"
			})
			local dap = require("dap")
			local gdb = vim.fn.exepath("gdb")

			if gdb ~= "" then
				dap.adapters.gdb = {
					type = "executable",
					command = gdb,
					args = { "--interpreter=dap",
						"--eval-command",
						"set print pretty on" }
				}
			end
			dap.configurations.c = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input('Path to executable:', vim.fn.getcwd() .. '/', 'file')
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				}
			}
		end

	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end
	},
	-- {
	-- 	"cordx56/rustowl",
	-- 	version = "*",
	-- 	build = "cargo binstall rustowl",
	-- 	lazy = true,
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		client = {
	-- 			on_attach = function(_,buffer)
	-- 				vim.keymap.set('n', '<leader>o', function()
	-- 					require('rustowl').toggle(buffer)
	-- 				end, { buffer = buffer, desc = "Toggle RustOwl" })
	-- 			end
	-- 		}
	-- 	}
	-- },
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
