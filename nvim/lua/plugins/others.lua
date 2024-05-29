return {
	--------Functional-------
	{
		"vifm/vifm.vim",
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
		event = "VeryLazy",
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
		-- "nvim-neo-tree/neo-tree.nvim",
		-- lazy = true,
		-- event = "VeryLazy",
		-- branch = "v3.x",
		-- dependencies = {
		-- 	"nvim-lua/plenary.nvim",
		-- 	"nvim-tree/nvim-web-devicons",
		-- 	"MunifTanjim/nui.nvim"
		-- },
		-- config = function(_, opts)
		-- 	require("neo-tree").setup({
		-- 		window = {
		-- 			position = "right"
		-- 		}
		-- 	})
		-- end
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
		end
	},
	{
		"AckslD/nvim-neoclip.lua",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require('neoclip').setup()
			require('telescope').load_extension('neoclip')
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
		"mbbill/undotree"
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
	------------Programming------------
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
		dependencies = { "nvim/tree/nvim-web-devicons" },
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
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mason-lspconfig").setup()
			require("lspconfig").rust_analyzer.setup({
			})
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			})
			require("lspconfig").clangd.setup({
				filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "mq5" }
			})
			require("lspconfig").tsserver.setup({})

			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
			local config = {
				-- Enable virtual text
				virtual_text = {
					prefix = '󱓇 ', -- Could be '●', '▎', 'x'
				},

				-- show signs
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(config)
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})
		end,
		opts = {
			inlay_hints = {
				enabled = true
			}
		}

	},
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{
		"hrsh7th/vim-vsnip",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-k>'] = cmp.mapping.select_prev_item(),
					['<C-j>'] = cmp.mapping.select_next_item(),
					-- Add tab support
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					})
				},
				sources = {
					{ name = 'path' },                        -- file paths
					{ name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
					{ name = 'nvim_lsp_signature_help' },     -- display function signatures with current parameter emphasized
					{ name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = 'buffer',                 keyword_length = 2 }, -- source current buffer
					{ name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
					{ name = 'calc' },                        -- source for math calculation
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = 'λ',
							vsnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				}
			})
		end
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
				server = {
					on_attach = function(_, bufnr)
					end
				}
			})
		end
		-- {
		-- "williamboman/mason-lspconfig.nvim",
		-- opts = {
		-- 	ensure_installed = {"rust_analyzer"}
		-- }
		-- }
		-- config = function (opts)
		-- require("rust-tools").setup(opts)
		-- require("rust-tools").setup({
		-- 	executor = require("rust-tools.executors").termopen,
		-- 	on_initialized = nil,
		-- opts = {
		-- ensure_installed = {"rust_analyzer"},
		-- tools = {
		-- inlay_hints = {
		-- 		auto = false,
		-- 		only_current_line = false,
		-- 		show_parameter_hints = true,
		-- 		RustSetInlayHints = true,
		-- 		RustEnableInlayHints = true,
		-- 		parameter_hint_prefix = ": ",
		-- 		other_hints_prefix = "--> "
		-- },
		-- },
		-- },
		-- 	})
		-- end
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
		"/lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("gitsigns").setup()
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"folke/neodev.nvim",
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},

	-----Themic-------
	{
		"catppuccin/nvim",
		name = "catppuccin",
		--priority = 1000,
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("catppuccin").setup {
				flavour = "mocha"
			}
		end
	},
	{
		'nvim-lualine/lualine.nvim',
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
	-- Visual Indentation
	-- {
	-- -- Focus on code areas, dimming everything else
	-- 	"folke/twilight.nvim"
	-- },
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

	-- Illuminate similar variables/words
	{
		"RRethy/vim-illuminate"
	},
	-- 	For Highlighting function args
	-- 	{
	-- " m-demare/hlargs.nvim"
	-- 	}
	{
		"danilamihailov/beacon.nvim"
	},
	-- Highlight colorcolumn limits
	{
		'Bekaboo/deadcolumn.nvim'
	}
}
