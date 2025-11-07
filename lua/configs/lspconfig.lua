local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- local servers = {"pyright", "lua_ls"}
local servers = {"dockerls", "pyright", }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- for _, lsp in ipairs(servers) do
--     vim.lsp.config(lsp, { -- <--- ИСПРАВЛЕНО: lsp (строка) и затем таблица {}
--         on_attach = nvlsp.on_attach,
--         on_init = nvlsp.on_init,
--         capabilities = nvlsp.capabilities,
--     })
-- end

lspconfig.pyright.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  filetypes = {"python"},
  settings = {
    pyright = {
      autoImportCompletion=true,
    },
    python = {analysis = {
      autoSearchPaths=true,
      diagnosticMode = "workspace", -- or 'openFilesOnly'
      userLibraryCodeForTypes=true,
      typeCheckingMode = 'basic', -- 'off', 'strict' or 'basic'
      -- ??? extraPaths = { "./src" }, -- если нужно
    }},
  },
})

