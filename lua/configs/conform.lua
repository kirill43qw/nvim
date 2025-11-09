local options = {
  formatters_by_ft = {
    python = {
      -- "ruff_fix", -- удаление неиспользуемых импортов
      "ruff_format",
      "ruff_organize_imports",
    },
    lua = { "stylua" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    sh = { "shfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
