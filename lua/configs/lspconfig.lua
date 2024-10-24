-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tailwindcss", "ts_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      nvlsp.on_attach(client, bufnr)
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(opts)
        end,
      })
      -- For goto reference
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Find all the references" })
      -- For formatting
      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   buffer = bufnr,
      --   callback = function()
      --     vim.lsp.buf.format { async = false }
      --   end,
      -- })
    end,
    on_init = function(client, _)
      nvlsp.on_init(client, _)
      print("Running " .. lsp .. " LSP")
    end,
    capabilities = nvlsp.capabilities,
  }
end

local cwd = vim.fn.getcwd()
local project_library_path = cwd .. "/node_modules"
local cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations",
  project_library_path }

lspconfig.angularls.setup({
  cmd = cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = cmd
  end,
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(opts)
      end,
    })
    -- For goto reference
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Find all the references" })
    -- For formatting
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
  capabilities = nvlsp.capabilities,
})

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(opts)
      end,
    })
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
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = "rounded",
    source = true,
    prefix = " ",
    scope = "cursor",
  }
})
