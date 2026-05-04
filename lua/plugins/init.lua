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

  -- нужно заменить на flash.nvim?
  {
    -- "ggandor/leap.nvim",
    url = "https://codeberg.org/andyg/leap.nvim",
    lazy = false,
    dependencies = {
      -- "ggandor/leap-ast.nvim", -- Поиск по AST дереву
      -- "ggandor/flit.nvim", -- Улучшенные f/t движения
    },
    config = function()
      require("leap").opts.vim_opts["go.ignorecase"] = false
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
      --   -- Включить подсветку для flit
      -- require("flit").setup {
      --   keys = { f = "f", F = "F", t = "t", T = "T" },
      --   labeled_modes = "nv",
      --   multiline = true,
      -- }
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
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.65,
      },
    },
  },
}

-- Варианты улучшения
-- 1. Дебаггер (mfussenegger/nvim-dap + nvim-dap-python):x
-- 2. Интеграция с тестами (nvim-neotest/neotest)
-- 3. Присмотрись к плагину tpope/vim-dadbod (и его UI-расширению vim-dadbod-ui + комплиту vim-dadbod-completion).
