return {
  'mfussenegger/nvim-jdtls',
--  ft = { 'java' },
  dependencies = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    local ok_jdtls, jdtls = pcall(require, "jdtls")
    if not ok_jdtls then
      vim.notify("nvim-jdtls not found", vim.log.levels.WARN)
      return
    end

    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or {}

    local function start_jdtls()
      local config = {
        cmd = { "jdtls" },
        root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
        capabilities = capabilities,
      }
      jdtls.start_or_attach(config)
    end

    if vim.fn.expand("%:p") ~= "" then
      start_jdtls()
    else
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.java",
        once = true,
        callback = start_jdtls,
      })
    end
  end
}

