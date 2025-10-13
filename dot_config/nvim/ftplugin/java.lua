local ok_jdtls, jdtls = pcall(require, "jdtls")
if not ok_jdtls then
  vim.notify("nvim-jdtls not found", vim.log.levels.WARN)
  return
end

-- Safe load for cmp_nvim_lsp (it might not be ready yet)
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp then
  vim.notify("cmp_nvim_lsp not found — ensure hrsh7th/cmp-nvim-lsp is installed", vim.log.levels.WARN)
  cmp_nvim_lsp = { default_capabilities = function() return {} end }
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local config = {
  cmd = { "jdtls" },
  root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
  capabilities = capabilities,
}

jdtls.start_or_attach(config)
