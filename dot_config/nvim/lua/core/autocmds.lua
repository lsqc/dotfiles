vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set path+=**",
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.cmd [[ autocmd VimEnter * ++nested wincmd w ]]