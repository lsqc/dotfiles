local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>t', ':NvimTreeToggle<CR>', opts)
map('n', '<Space>w', '<C-w>w', opts)

map('n', '<Space>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Space>.', '<Cmd>BufferNext<CR>', opts)
map('n', '<Space><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<Space>>', '<Cmd>BufferMoveNext<CR>', opts)

for i = 1, 9 do
  map('n', '<Space>' .. i, '<Cmd>BufferGoto ' .. i .. '<CR>', opts)
end
map('n', '<Space>0', '<Cmd>BufferLast<CR>', opts)
map('n', '<Space>p', '<Cmd>BufferPin<CR>', opts)
map('n', '<Space>c', '<Cmd>BufferClose<CR>', opts)

map('t', '<C-n>', '<C-\\><C-n>', opts)

map('n', '<Space>h', '<C-w>h', opts)
map('n', '<Space>j', '<C-w>j', opts)
map('n', '<Space>k', '<C-w>k', opts)
map('n', '<Space>l', '<C-w>l', opts)

map('n', '<Space><S-h>', '<C-w>H', opts)
map('n', '<Space><S-j>', '<C-w>J', opts)
map('n', '<Space><S-k>', '<C-w>K', opts)
map('n', '<Space><S-l>', '<C-w>L', opts)

map('n', '<Home>', '^', opts)
map('n', '<End>', '$', opts)
map('n', '<Space>e', ':qa!<CR>', opts)

vim.keymap.set('n', '<Space>q', function()
  vim.wo.number = not vim.wo.number
  vim.wo.relativenumber = vim.wo.number
end, { desc = 'Toggle line numbers' })