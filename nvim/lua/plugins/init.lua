local plugins = {}

local telescope = require("plugins.telescope")
local others = require("plugins.others")
table.insert(plugins, telescope)

table.insert(plugins, others)

return plugins
