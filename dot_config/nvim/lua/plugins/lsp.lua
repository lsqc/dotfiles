local lspconfig = require("lspconfig")

lspconfig.jdtls.setup {
    cmd = { "jdtls" },
    root_dir = lspconfig.util.root_pattern("pom.xml", ".git"),
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
