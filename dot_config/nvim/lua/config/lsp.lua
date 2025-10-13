-- lua
vim.lsp.config['luals'] = {

    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                workspace = { library = vim.api.nvim_get_runtime_file("", true) }
            }
        }
    }
}

-- enable lua language server
vim.lsp.enable('luals')

-- clang
vim.lsp.start({
  name = 'clangd',
  cmd = { 'clangd', '--log=verbose' },
  verbose = true,
  root_dir = '.'
})
