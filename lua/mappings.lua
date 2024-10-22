require "nvchad.mappings"

local map = vim.keymap

map.set("i", "jk", "<ESC>")
map.set("n", "x", '"_x')

-- Increment/Decrement
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- Split window
map.set("n", "<leader>s", "<C-w>s")
map.set("n", "<leader>v", "<C-w>v")

map.set("i", "jk", "<ESC>")

map.set({ "n", "v", "i" }, "<C-c>", '"+y')
map.set({ "n", "i", "v" }, "<C-s>", "<ESC><cmd> w <cr>")
map.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toogle Nvim Tree" })

map.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
    group = augroup("YankHighlight", { clear = true }),
})
