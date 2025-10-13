local plugins = {}

plugins = vim.list_extend(plugins, require("plugins.tree-sitter"))
plugins = vim.list_extend(plugins, require("plugins.lualine"))
plugins = vim.list_extend(plugins, require("plugins.telescope"))

table.insert(plugins, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
})

table.insert(plugins, {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
    end
})

return plugins
