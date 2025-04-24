require "nvchad.mappings"

local map = vim.keymap

map.set({ "n", "i" }, "jk", "<ESC><cmd>noh<cr>", { desc = "Escape and clear highlight" })
map.set("n", "x", '"_x')

-- Increment/Decrement
map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- Split window
map.set("n", "<leader>s", "<C-w>s")
map.set("n", "<leader>v", "<C-w>v")

map.set({ "n", "v", "i" }, "<C-c>", '"+y')
map.set({ "n", "i", "v" }, "<C-s>", "<ESC><cmd> w <cr>")
map.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toogle Nvim Tree" })

map.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- LSP Keymaps (added)
-- Note: These require an LSP server to be attached to the current buffer
local lsp_map = vim.lsp.buf -- Use a shorter alias
map.set('n', 'gd', lsp_map.definition, { desc = "Go to definition" })
map.set('n', 'gD', lsp_map.declaration, { desc = "Go to declaration" })
map.set('n', 'gi', lsp_map.implementation, { desc = "Go to implementation" })
map.set('n', 'gT', lsp_map.type_definition, { desc = "Go to type definition" })
map.set('n', 'K', lsp_map.hover, { desc = "Show hover documentation" })
map.set('n', '<C-k>', lsp_map.signature_help, { desc = "Show signature help" })
map.set('n', '<leader>rn', lsp_map.rename, { desc = "Rename symbol" })
map.set({ 'n', 'v' }, '<leader>ca', lsp_map.code_action, { desc = "Code actions" })
map.set('n', 'gr', lsp_map.references, { desc = "Find all references" })
map.set('n', '[d', vim.diagnostic.get_prev, { desc = "Go to previous diagnostic" })
map.set('n', ']d', vim.diagnostic.get_next, { desc = "Go to next diagnostic" })
map.set('n', '<leader>ds', vim.diagnostic.open_float, { desc = "Show line diagnostics" })
-- You might also want a keymap for formatting, e.g.:
map.set('n', '<leader>lf', function() lsp_map.format({ async = true }) end, { desc = "Format buffer" })

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
  group = augroup("YankHighlight", { clear = true }),
})
