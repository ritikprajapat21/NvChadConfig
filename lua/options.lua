require "nvchad.options"

-- add yours here!

require "nvchad.options"

-- add yours here!

local o = vim.opt
o.cursorline = true
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.scrolloff = 8
o.numberwidth = 3
o.wrap = true
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"
o.ruler = true
o.inccommand = "split"
o.backspace:append { "indent", "eol", "start" }
o.path:append { "**" }
o.wildignore = { "*/node_modules/*", "*.o", "*.a", "__pycache__" }
o.splitbelow = true
o.splitright = true
o.splitkeep = "cursor"
o.formatoptions:append "r"
o.guicursor = "n-v-i-c:block"
-- o.cursorcolumn = true -- To set cursor column
o.textwidth = 120
-- o.columns = 120

o.clipboard = ""
o.mouse = "a"
o.mousemoveevent = true
o.mousefocus = true
o.shortmess = "aoOtT"

-- To set fold
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
