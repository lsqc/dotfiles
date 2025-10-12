local plugins = {}

plugins = vim.list_extend(plugins, require("plugins.tree-sitter"))
plugins = vim.list_extend(plugins, require("plugins.lualine"))

table.insert(plugins, {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
})

table.insert(plugins, {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
})
return plugins
