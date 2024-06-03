require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt

opt.relativenumber = true
opt.cursorline = true
opt.numberwidth = 3
opt.wrap = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.ruler = true

opt.clipboard:append("unnamedplus")
