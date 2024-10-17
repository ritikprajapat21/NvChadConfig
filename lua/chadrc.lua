-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = {
      bg = "one_bg",
    },
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },

  statusline = {
    modules = {
      cursor = function()
        return "Ln %l|Col %c" .. vim.api.nvim_call_function("codeium#GetStatusString", {})
      end,
    },
  },
}

M.nvdash = {
  load_on_startup = true,
}

M.mason = {
  pkgs = {
    "lua-language-server",
    "tailwindcss-language-server",
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "black", -- python formatter
    "biome",
    "pylint",
  },
}

return M