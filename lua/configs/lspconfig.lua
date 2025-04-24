-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tailwindcss", "ts_ls", "gopls", }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      -- Keymaps are now defined globally in lua/mappings.lua

      -- For formatting (enabled)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end,
    on_init = function(client, _)
      nvlsp.on_init(client, _)
      print("Running " .. lsp .. " LSP")
    end,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.pyright.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   -- settings = {
--   --   python = {
--   --     analysis = {
--   --       autoSearchPaths = true,
--   --       diagnosticMode = "openFilesOnly",
--   --       useLibraryCodeForTypes = true
--   --     }
--   --   }
--   -- }
--   filetypes = { "python" }
-- }

lspconfig.pylsp.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    -- Keymaps are now defined globally in lua/mappings.lua

    -- Formatting
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { buffer = bufnr, async = false }
      end,
    })
  end,
  capabilities = nvlsp.capabilities,
  settings = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
  },
  filetypes = { "python" }
}

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    -- Keymaps are now defined globally in lua/mappings.lua

    -- Formatting
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { buffer = bufnr, async = false }
      end,
    })
  end,
  capabilities = nvlsp.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
      },
    },
  },
}

vim.diagnostic.config({
  float = {
    focusable = true,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    source = true,
    prefix = "<leader>d",
    desc = "Diagnostic Float",
    scope = "cursor",
  }
})
