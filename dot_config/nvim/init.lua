-- disable mouse 
vim.opt.mouse = ""

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
    dotfiles = true,
  },
})
-- use space w for switching 
vim.api.nvim_set_keymap('n', '<Space>w', '<C-w>w', { noremap = true, silent = true })

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if not vim.loop.fs_stat(install_path) then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

vim.cmd('autocmd VimEnter * NvimTreeOpen')  -- start NvimTree on start

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})


use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

end)

