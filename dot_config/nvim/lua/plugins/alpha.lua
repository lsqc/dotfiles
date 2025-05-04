local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- set buttons
dashboard.section.buttons.val = {
    dashboard.button( "n", "  new file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  find file", ":cd $HOME/repos | Telescope find_files<CR>"),
    dashboard.button( "t", "  open file tree", ":NvimTreeOpen <CR>"),
    dashboard.button( "r", "  recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "  quit", ":qa<CR>"),
}

-- set color path
dashboard.section.header.opts.hl = "AlphaHeaderCustom"

dashboard.section.footer.val = {
  ">w<"
}

-- push settings to alpha
alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
