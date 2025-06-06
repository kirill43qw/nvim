local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- local servers = { "html", "pyright", "docker-compose-language-service", "dockerfile-language-server", "lua-language-server"}
local servers = {"lua_ls", "dockerls", "pyright",}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

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
      diagnosticMode='openFilesOnly',
      typeCheckingMode='basic'
    }},
  },
})
