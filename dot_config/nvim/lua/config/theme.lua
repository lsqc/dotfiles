require("tokyonight").setup({
    style = "storm",
    transparent = true,
    styles = {},
})

vim.cmd.colorscheme("tokyonight")

-- taken from old config
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#292929', bold=false })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#6151f0', bold=true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#292929', bold=false })
