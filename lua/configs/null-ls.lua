local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')


local formatting = null_ls.builtins.formatting   -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters


local opts = {
  require('mason-null-ls').setup {
    ensure_installed = {
      'checkmake',
      'shfmt',
      'ruff',
    },
    automatic_installation = true,
  },

  sources = {
    diagnostics.checkmake,
    formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
    formatting.stylua,
    formatting.shfmt.with { args = { '-i', '4' } },
    formatting.terraform_fmt,
    -- require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I', "--ignore", "F401", } },
    require("none-ls.formatting.ruff_format").with {
      extra_args = { "--ignore", "F401" },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == 'ruff' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end,
        desc = 'LSP: Disable hover capability from Ruff',
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
