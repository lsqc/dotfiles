return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", 
    "lewis6991/gitsigns.nvim"
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
  event = "BufReadPre",
}

