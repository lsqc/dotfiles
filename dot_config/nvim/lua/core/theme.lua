local ok, _ = pcall(vim.cmd, 'colorscheme nord')
if not ok then
  vim.cmd('colorscheme default')
end

vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE')

-- set colors for line numbers
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#292929', bold=false })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#FB508F', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#292929', bold=false })
