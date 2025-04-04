local config = {
  theme = 'hyper',  -- or doom
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      {
        desc = ' last_session',
        group = 'Number',
        action = 'SessionRestore',
        key = 'r',
      },
      {
        desc = ' tree',
        -- group = 'DiagnosticHint',
        action = 'NvimTreeFocus',
        key = 'n',
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'find_file',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      { desc = '󰊳 update', group = '@property', action = 'Lazy update', key = 'u' },
    },
    footer = {
      '',
      '',
      '🏀',
    },
  },
}

return config
