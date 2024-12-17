return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
      opts = {
        auto_install = true,
      },
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "ruff_lsp",
        "pyright",
        "lua-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    -- "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
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
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      require('auto-session').setup({
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        -- auto_sessions_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
        pre_save_cmds = { "silent! mkview" }, -- Сохранение views перед сохранением сессии
        post_restore_cmds = { "silent! loadview" }, -- Загрузка views после восстановления сессии
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
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
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --     event = "VeryLazy",
  --     config = function()
  --       require("chatgpt").setup()
  --     end,
  --     dependencies = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "folke/trouble.nvim",
  --       "nvim-telescope/telescope.nvim"
  --     }
  -- },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
