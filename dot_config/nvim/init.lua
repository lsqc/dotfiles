-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- List of plugins
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "iamcco/markdown-preview.nvim" },
    { "catppuccin/nvim" },  -- Add the Catppuccin colorscheme
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- disable mouse
vim.opt.mouse = ""

-- nvim tree toggle
vim.api.nvim_set_keymap('n', '<Space>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- use space+w for window switching
vim.api.nvim_set_keymap('n', '<Space>w', '<C-w>w', { noremap = true, silent = true })

-- tab indent configuration
vim.o.tabstop = 4 -- set tab character to 4 spaces
vim.o.expandtab = true -- insert spaces instead of tab character
vim.o.softtabstop = 4 -- amount of spaces inserted (replaces tab character)
vim.o.shiftwidth = 4 -- amount of spaces inserted when indenting

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- config for nvim tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

-- open NvimTree on start
vim.cmd [[
    autocmd VimEnter * NvimTreeOpen
    autocmd VimEnter * ++nested wincmd w
]]

-- Set colorscheme (catppuccin-mocha if available, default otherwise)
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
  vim.cmd 'colorscheme default'
end

