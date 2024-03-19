return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "pyright",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "tsx",
        "typescript",
        "javascript",
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    event = "VeryLazy",
    config = function()
      require "configs.none"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = {
    --   highlight = { enable = true },
    --   ensure_installed = {
    --     "bash",
    --     "html",
    --     "css",
    --     "javascript",
    --     "lua",
    --     "markdown",
    --     "python",
    --     "query",
    --     "tsx",
    --     "typescript",
    --     "yaml",
    --   },
    -- },
    opts = function()
      require "nvchad.configs.nvimtree"
      require "configs.nvimtree"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
