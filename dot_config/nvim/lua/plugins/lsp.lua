#local lspconfig = require("lspconfig")

vim.lsp.config.jdtls.setup {
    cmd = { "jdtls" },
    root_dir = vim.lsp.util.root_pattern("settings.gradle", "pom.xml", ".git"),
    settings = {
        java = {
            contentProvider = { preferred = "fernflower" },
            codeGeneration = {
                toString = { template = "${objectClassName}(${memberName} = ${memberValue})" },
            },
            import = {
                enable = true,  
                organizeImports = true,
            },
            formatting = {
                enabled = false,
            }
        },
    },
}
