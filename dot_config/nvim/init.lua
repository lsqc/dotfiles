-- Disable netrw (duplicate lines removed)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable mouse
vim.opt.mouse = ""

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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "iamcco/markdown-preview.nvim" },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
    { "catppuccin/nvim" },  -- Add the Catppuccin colorscheme
    {
      'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      init = function() vim.g.barbar_auto_setup = false end,
      opts = {},
      version = '^1.0.0',
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- Tab indent configuration
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.opt.termguicolors = true

-- Config for nvim-tree
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

-- Open NvimTree on start
vim.cmd [[autocmd VimEnter * NvimTreeOpen]]

-- Set colorscheme (catppuccin-mocha if available, default otherwise)
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
  vim.cmd 'colorscheme default'
end

-- Override theme background color with terminal default
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')

-- Set NvimTree background
vim.cmd('highlight NvimTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE')

-- Key mappings (buffer management)
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>t', ':NvimTreeToggle<CR>', opts)
map('n', '<Space>w', '<C-w>w', opts)
map('n', '<Space>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Space>.', '<Cmd>BufferNext<CR>', opts)
map('n', '<Space><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<Space>>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<Space>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Space>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Space>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Space>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Space>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Space>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Space>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Space>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Space>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Space>0', '<Cmd>BufferLast<CR>', opts)
map('n', '<Space>p', '<Cmd>BufferPin<CR>', opts)
map('n', '<Space>c', '<Cmd>BufferClose<CR>', opts)

-- Hotkey for leaving terminal mode
vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })

