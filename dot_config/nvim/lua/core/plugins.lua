require("lazy").setup({
    spec = {
        { "shaunsingh/nord.nvim" },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
        { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
        { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
        {
            "neovim/nvim-lspconfig",
            lazy = false,
            dependencies = {
                { "ms-jpq/coq_nvim", branch = "coq" },
                { "ms-jpq/coq.thirdparty", branch = "3p" },
            },
            init = function()
                vim.g.coq_settings = { auto_start = true }
            end,
        },
        {
            "romgrk/barbar.nvim",
            dependencies = {
                "lewis6991/gitsigns.nvim",
                "nvim-tree/nvim-web-devicons",
            },
            init = function()
                vim.g.barbar_auto_setup = false
            end,
            config = function()
                require("barbar").setup {
                    animation = true,
                    auto_hide = false,
                    tabpages = true,
                    clickable = true,
                }
            end,
            version = "^1.0.0",
        }
    },
    checker = { enabled = true },
})
