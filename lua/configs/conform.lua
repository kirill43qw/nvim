local options = {
  formatters_by_ft = {
    -- python = {
    --   "ruff_fix",
    --   "ruff_format",
    --   "ruff_organize_imports",
    -- },
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
