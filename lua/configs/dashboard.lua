local config = {
  theme = "hyper", -- or doom
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        desc = " last_session",
        group = "Number",
        action = "SessionRestore",
        -- action = function() vim.cmd.SessionRestore() end,
        key = "r",
      },
      {
        desc = " tree",
        -- group = 'DiagnosticHint',
        action = "NvimTreeFocus",
        key = "n",
      },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "find_file",
        group = "Label",
        action = "Telescope find_files",
        -- action = function() vim.cmd.Telescope('find_files') end,
        key = "f",
      },
      { desc = "󰊳 update", group = "@property", action = "Lazy update", key = "u" },
    },
    footer = {
      "",
      "",
      "🏀",
    },
  },
}

return config
