return {
  -- { import = "nvchad.blink.lazyspec" }, -- ???
  -- {
  --    "Saghen/blink.cmp",
  --     opts = { HERE }
  -- },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
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
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      return require "configs.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("auto-session").setup {
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        -- auto_sessions_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
      }
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.noice"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "echasnovski/mini.nvim",
    },
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      local leap = require "leap"
      leap.add_default_mappings()
      leap.opts.case_sensitive = true
    end,
  },

  -- {
  --   "tpope/vim-fugitive"
  -- },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- keys = {
    --     { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    -- }
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.65,
      },
    },
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
}
