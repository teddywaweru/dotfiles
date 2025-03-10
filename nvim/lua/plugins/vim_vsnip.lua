return {
	"hrsh7th/vim-vsnip",
	lazy = true,
	event = "VeryLazy",
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
				-- ['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.close(),
				['<CR>'] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = false,
				})
			},
			sources = {
				{ name = 'path' },                           -- file paths
				{ name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
				{ name = 'nvim_lsp_signature_help' },        -- display function signatures with current parameter emphasized
				{ name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
				{ name = 'buffer',                 keyword_length = 2 }, -- source current buffer
				{ name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
				{ name = 'calc' },                           -- source for math calculation
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
					local MAX_WIDTH = 15
					local ELLIPSES = "..."

					item.menu = menu_icon[entry.source.name]
					local label = item.abbr
					local truncated_label = vim.fn.strcharpart(label, 0, MAX_WIDTH)
					if truncated_label ~= label then
						item.abbr = truncated_label .. ELLIPSES
					end
					return item
				end,
			}
		})
	end

}
