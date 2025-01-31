return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  init = function()
    -- vim.g.toggle_cmp = true -- not vim.g.toggle_cmp
    vim.keymap.set("n", "<leader>oa", function()
      if vim.g.toggle_cmp then
        vim.notify("Toggled On", vim.log.levels.INFO, { title = "Autocomplete" })
      else
        vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Autocomplete" })
      end
    end, { desc = "Options | Toggle Autocomplete" })
  end,
  config = function(_, opts)
    table.insert(opts.sources, 1, { name = "supermaven" })

    opts.mapping = vim.tbl_extend("force", {}, opts.mapping, {
      -- You can add here new mappings.
    })

    opts.completion["completeopt"] = "menu,menuone,noselect" -- disable autoselect

    opts.enabled = true
    vim.g.toggle_cmp = true
    -- Disabled since not enabling suggestions
    -- opts.enabled = function()
    --   return (vim.g.toggle_cmp and vim.bo.buftype == "")
    -- end

    require("luasnip").filetype_extend("javascriptreact", { "html" })
    require("luasnip").filetype_extend("typescriptreact", { "html" })
    require("luasnip").filetype_extend("svelte", { "html" })
    require("luasnip").filetype_extend("vue", { "html" })
    require("luasnip").filetype_extend("php", { "html" })
    require("luasnip").filetype_extend("javascript", { "javascriptreact" })
    require("luasnip").filetype_extend("typescript", { "typescriptreact" })

    --NOTE: add border for cmp window
    if vim.g.border_enabled then
      opts.window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      }
    end

    require("cmp").setup(opts)

    local cmdline_mappings = vim.tbl_extend("force", {}, require("cmp").mapping.preset.cmdline(), {
      -- ["<CR>"] = { c = require("cmp").mapping.confirm { select = true } },
    })

    require("cmp").setup.cmdline(":", {
      mapping = cmdline_mappings,
      sources = {
        { name = "cmdline" },
      },
    })
  end,
  dependencies = {
    -- For Rust
    -- {
    --   "saecki/crates.nvim",
    --   tag = "v0.4.0",
    --   opts = {},
    -- },
    -- Commandline completions
    {
      "hrsh7th/cmp-cmdline",
    },
    -- AI Autocomplete
    -- {
    --   "Exafunction/codeium.nvim",
    --   enabled = true,
    --   opts = {
    --     enable_chat = true,
    --   },
    -- },
    {
      "supermaven-inc/supermaven-nvim",
      -- commit = "df3ecf7",
      event = "BufReadPost",
      -- opts = {
      --   disable_keymaps = false,
      --   disable_inline_completion = false,
      --   -- keymaps = {
      --   --   accept_suggestion = "<C-;>",
      --   --   clear_suggestion = "<Nop>",
      --   --   accept_word = "<C-y>",
      --   -- },
      -- },
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      build = "make install_jsregexp",
    },
  },
}
