return {

	"neovim/nvim-lspconfig",
	lazy = true,
	event = "VeryLazy",
	config = function()
		-- Enabling built-in snippets for LSPs usinf vscode's lang servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require("mason-lspconfig").setup()
		require("lspconfig").rust_analyzer.setup({
			settings = {
				['rust_analyzer'] = {
					diagnostics = {
						refreshSupport = false,
						-- enabled = false
					}
				}

			}
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
		require("lspconfig").svls.setup({
			capabilities = capabilities,
			filetypes = { "v", "systemverilog", "verilog", "vlg", "vh" }
		})
		require("lspconfig").verible.setup({
			capabilities = capabilities,
			filetypes = { "v", "systemverilog", "verilog", "vlg", "vh" }
		})
		require("lspconfig").clangd.setup({
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "mq5" },
			-- init_options = { compilationDatabasePath = "./.build" }
		})
		require("lspconfig").cmake.setup({
		})
		require("lspconfig").bashls.setup({
			filetypes = {"zsh", "sh"}
		})
		-- local vue_language_server_path = require('mason-registry').get_package('vue-language-server'):get_install_path() ..
		-- 	'/node_modules/@vue/language-server'

		require("lspconfig").svelte.setup({
		})
		require("lspconfig").ts_ls.setup({
			init_options = {
				plugins = {
					-- {
					-- 	name =
					-- 	'@vue/typescript-plugin',
					-- 	location = vue_language_server_path,
					-- 	languages = { 'vue' },
					-- },
				}
			},
			filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
		})

		-- require("lspconfig").volar.setup({
		-- 	capabilities = capabilities
		-- })

		require("lspconfig").html.setup({
			capabilities = capabilities
		})
		require("lspconfig").cssls.setup({
			capabilities = capabilities
		})
		require("lspconfig").jsonls.setup({
			capabilities = capabilities
		})
		-- require("lspconfig").lemminx.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = { "svd", "xml" }
		-- })
		require("lspconfig").jedi_language_server.setup({
			capabilities = capabilities
		})
		require("lspconfig").pyright.setup({
			capabilities = capabilities
		})

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

}
