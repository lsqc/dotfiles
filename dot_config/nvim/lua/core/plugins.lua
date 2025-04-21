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
            "goolord/alpha-nvim",
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                local startify = require("alpha.themes.startify")
                startify.file_icons.provider = "devicons"
                require("alpha").setup(startify.config)
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
        },
        {
            'nvim-java/nvim-java',
            dependencies = {
                'nvim-java/lua-async-await',
                'nvim-java/nvim-java-core',
                'nvim-java/nvim-java-test',
                'nvim-java/nvim-java-dap',
                'mfussenegger/nvim-dap',
                'neovim/nvim-lspconfig',
            },
            config = function()
                local jdtls = require('lspconfig').jdtls
                local root_dir = require('lspconfig').util.root_pattern('pom.xml', '.git')

                jdtls.setup({
                    cmd = { 'jdtls' },  
                    root_dir = root_dir,
                    settings = {
                        java = {
                            maven = {
                                downloadSources = true
                            }
                        }
                    }
                })
            end,
            ft = { "java" },
        }
    },
    checker = { enabled = true }
})

