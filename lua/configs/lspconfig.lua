require("mason-lspconfig").setup()
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "dockerls", "yamlls", "jsonls", "html", "sqlls", "lua_ls", "ruff" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end

vim.lsp.config("pyright", {
  -- on_attach = nvlsp.on_attach,
  on_attach = function(client, bufnr) -- убрать всплывающие подсказки от lsp
    nvlsp.on_attach(client, bufnr)
    client.server_capabilities.signatureHelpProvider = nil
  end,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  filetypes = { "python" },
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace", -- or 'openFilesOnly'
        userLibraryCodeForTypes = true,
        typeCheckingMode = "basic", -- 'off', 'strict' or 'basic'
        -- ??? extraPaths = { "./src" }, -- если нужно
      },
    },
  },
})
