-- telescope
vim.keymap.set('n', '<leader>t', function()
  require('telescope.builtin').find_files({ initial_mode = "normal" })
end, { noremap = true, silent = true })
