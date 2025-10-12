-- lazy bootstrap
require("config.lazy")

-- load plugins
require("lazy").setup("plugins")

-- set theme
require("config/theme")

require("core")

-- base settings 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mouse = ""

-- keymaps
vim.g.mapleader = " "
