local ok, _ = pcall(vim.cmd, 'colorscheme nord')
if not ok then
  vim.cmd('colorscheme default')
end

vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE')