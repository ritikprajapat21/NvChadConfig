return {
  -- {
  --   "stevearc/conform.nvim",
  --   -- event = "BufWritePre", -- uncomment for format on save
  --   opts = require "configs.conform",
  -- },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    opts = {
      inlay_hints = { enabled = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = false,
      },
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "configs.nvimtree"
    end,
  },

  -- {
  --   'nvimtools/none-ls.nvim',
  --   dependencies = {
  --     'nvimtools/none-ls-extras.nvim',
  --     'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  --   },
  --   config = function()
  --     require "configs.none"
  --   end,
  -- },

  -- for brackets
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      require("nvim-autopairs").get_rule ">"

      -- setup cmp for autopairs
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- for tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  require "configs.code_assist",
  require "configs.nvim-cmp",
  require "configs.lazygit",
  require "configs.telescope",
  require "configs.none",

  -- require "configs.avante",

  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',     -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup({
        flutter_path = "~/development/flutter",
        lsp = {
          color = { enabled = true },
        }
      })
    end,
  },

}
