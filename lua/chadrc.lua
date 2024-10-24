-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    codeium = { fg = "orange" },
    CursorLine = {
      bg = "one_bg",
    },
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },

  cmp = {
    icons_left = true,
  },

  statusline = {
    modules = {
      cursor = function()
        return "Ln %l|Col %c " .. vim.api.nvim_call_function("codeium#GetStatusString", {})
      end,
    },
  },
}

M.nvdash = {
  load_on_startup = false,
  header = {
    "                            ",
    "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
    "   ▄▀███▄     ▄██ █████▀    ",
    "   ██▄▀███▄   ███           ",
    "   ███  ▀███▄ ███           ",
    "   ███    ▀██ ███           ",
    "   ███      ▀ ███           ",
    "   ▀██ █████▄▀█▀▄██████▄    ",
    "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
    "                            ",
    "     Powered By  eovim    ",
    "  Edited by Ritik Prajapat  ",
    "                            ",
  },
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
