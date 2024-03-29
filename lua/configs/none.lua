local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local null_ls = require "null-ls"

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },

  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = group }
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        group = group,
        -- callback = function(event)
        --   vim.lsp.buf.format { buf = event.buf, async = false }
        --   print "Rin"
        -- end,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
          print "Rin"
          -- vim.lsp.buf.formatting_sync()
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method "textDocument/rangeFormatting" then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format { bufnr = vim.api.nvim_get_current_buf() }
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
}

null_ls.setup(opts)
