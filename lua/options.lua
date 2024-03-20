require "nvchad.options"

-- add yours here!
local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.wo.relativenumber = true
o.scrolloff = 10

vim.keymap.set("i", "<C-s>", "<Esc><cmd>w<CR>", { desc = "Save file in insert mode" })
vim.keymap.set("i", "<C-c>", "<Esc>yy", { desc = "Yank text in insert mode" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toogle Nvim Tree" })
