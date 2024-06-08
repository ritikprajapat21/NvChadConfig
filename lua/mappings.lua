require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<ESC>", "<cmd>nohlsearch<CR>")

map({ "n", "i", "v" }, "<C-s>", "<ESC><cmd> w <cr>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toogle Nvim Tree" })

map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

local builtin = require "telescope.builtin"
map("n", "<leader>fh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>fs", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>fw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>fg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>f.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
  group = augroup("YankHighlight", { clear = true }),
})
