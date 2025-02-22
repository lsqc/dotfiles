-- disable mouse 
vim.opt.mouse = ""

-- tab indent configuration
vim.o.tabstop = 4 -- set tab character to 4 spaces
vim.o.expandtab = true -- insert spaces instead of tab character
vim.o.softtabstop = 4 -- amount of spaces inserted (replaces tab character)
vim.o.shiftwidth = 4 -- amount of spaces inserted when indenting

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

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
-- use space+w for switching 
vim.api.nvim_set_keymap('n', '<Space>w', '<C-w>w', { noremap = true, silent = true })

-- install packer if not installed already
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(install_path) then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
vim.cmd('autocmd VimEnter * NvimTreeOpen')  -- start NvimTree on start

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

-- tree plugin
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

end)

