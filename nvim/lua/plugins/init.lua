local plugins = {}

local telescope = require("plugins.telescope")
local nvim_config = require("plugins.nvim_lspconfig")
local vim_vsnip = require("plugins.vim_vsnip")
local functional = require("plugins.functional")
local programming = require("plugins.programming")
local pedantic_btw = require("plugins.pedantic_btw")
local theming = require("plugins.theming")

local custom_plugins = {
telescope,
nvim_config,
vim_vsnip,
programming,
functional,
pedantic_btw,
theming,
}

for k,v in pairs({ custom_plugins }) do
	plugins[k] = v
end

return plugins
