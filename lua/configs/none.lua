local augroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.diagnostics.pylint.with {
      diagnostics_postprocess = function(diagnostic)
        diagnostic.code = diagnostic.message_id
      end,
    },
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.biome,
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.eslint_d,
  },

  -- Not required ?
<<<<<<< HEAD
  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       -- buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format { async = false }
  --       end,
  --     })
  --   end
  -- end,
=======
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = false, timeout_ms = 2000 }
        end,
      })
    end
  end,
>>>>>>> ad009c1 (New config)
}

null_ls.setup(opts)
