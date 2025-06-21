-- FIX: error if colorscheme plugin is missing
vim.cmd.colorscheme  "catppuccin"

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalSB", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
