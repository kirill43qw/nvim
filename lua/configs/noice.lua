
local opts = {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      -- enabled = false,
      enabled = true,
    },
    signature = {
      -- enabled = false,
      enabled = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B"},
          { find = "; after #%d+"},
          { find = "; before #%d+"},
        },
      },
    },
  },
  view = "mini",
}

return opts
