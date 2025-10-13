-- lazy bootstrap
require("config.lazy")

-- keymap
require("config.keymap")

-- load plugins
require("lazy").setup(require("plugins"))

-- set theme
require("config.theme")

require("config.lsp")

-- base settings 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.mouse = ""

