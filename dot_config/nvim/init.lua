vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- disable mouse
vim.opt.mouse = ""

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- setup lazy.nvim
require("lazy").setup({
  spec = {
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")
            configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
        })
    end},
    -- bottom status line 
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    -- file tree
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
    { "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP   integration
        lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
        dependencies = {
            -- main one
            { "ms-jpq/coq_nvim", branch = "coq" },
            -- 9000+ Snippets
            --{ "ms-jpq/coq.artifacts", branch = "artifacts" },
            -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
            -- Need to **configure separately**
            { 'ms-jpq/coq.thirdparty', branch = "3p" }
        },
        init = function()
            vim.g.coq_settings = {
            auto_start = true, -- if you want to start COQ at startup
        }
        end,
        config = function()
        end,
    },
    -- theme
    { "catppuccin/nvim" },  -- Add the Catppuccin colorscheme
    --top bar
    { "romgrk/barbar.nvim",
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

-- disable mouse
vim.opt.mouse = ""

-- tab indent configuration
vim.o.tabstop = 4 -- set tab character to 4 spaces
vim.o.expandtab = true -- insert spaces instead of tab character
vim.o.softtabstop = 4 -- amount of spaces inserted (replaces tab character)
vim.o.shiftwidth = 4 -- amount of spaces inserted when indenting

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- config for nvim tree
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- open NvimTree on start
vim.cmd [[ autocmd VimEnter * NvimTreeOpen ]]

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.cmd [[ autocmd VimEnter * ++nested wincmd w ]]

-- lualine configuration
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Set colorscheme (catppuccin-mocha if available, default otherwise)
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin-mocha')
if not ok then
  vim.cmd 'colorscheme default'
end

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- override theme background color with terminal default
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')

-- set nvimtree background
vim.cmd('highlight NvimTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NvimTreeVertSplit guibg=NONE ctermbg=NONE')

-- hotkeys
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<Space>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- use space+w for window switching
vim.api.nvim_set_keymap('n', '<Space>w', '<C-w>w', { noremap = true, silent = true })

-- Move to previous/next
map('n', '<Space>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Space>.', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<Space><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<Space>>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<Space>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Space>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Space>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Space>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Space>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Space>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Space>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Space>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Space>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Space>0', '<Cmd>BufferLast<CR>', opts)

-- pin/unpin buffer
map('n', '<Space>p', '<Cmd>BufferPin<CR>', opts)

-- close buffer
map('n', '<Space>c', '<Cmd>BufferClose<CR>', opts)

-- hotkey for leaving terminal mode
vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })

-- used for navigating between windows 
vim.api.nvim_set_keymap('n', '<Space>h', '<C-w>h', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Space>j', '<C-w>j', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Space>k', '<C-w>k', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Space>l', '<C-w>l', { noremap = true, silent = true }) 

vim.api.nvim_set_keymap('n', '<Space><S-h>', '<C-w>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><S-j>', '<C-w>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><S-k>', '<C-w>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space><S-l>', '<C-w>L', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Home>', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<End>', '$', { noremap = true, silent = true })

-- quits vim instantly
vim.api.nvim_set_keymap('n', '<Space>e', ':qa!<CR>', { noremap = true, silent = true })

-- used for toggling line numbers 
vim.keymap.set('n', '<Space>q', function()
  if vim.wo.number then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end, { desc = 'Toggle line numbers' })

