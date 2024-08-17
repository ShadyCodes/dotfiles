return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = function()
      require "configs.conform"
    end,
  },
  --- LSP stuff
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    opts = function()
      return require "configs.none-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      local ls = require "luasnip"
      local haskell_snippets = require("haskell-snippets").all
      ls.add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },
  --- Tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  --- rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  --- cpp
  {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
  },
  {
    "p00f/clangd_extensions.nvim",
    opts = function()
      return require "configs.clangd_extensions"
    end,
  },
  --- git
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
    },
    lazy = false,
    config = true,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      require("gitsigns").setup()
    end,
  },
  --- misc
  {
    "stevearc/overseer.nvim",
    opts = {},
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "rcarriga/nvim-notify",
  },
  -- {
  --
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = "kevinhwang91/promise-async",
  --   config = function()
  --     require "configs.nvim-ufo"
  --   end,
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
        float = {
          enable = true,
        },
      },
      filters = {
        dotfiles = false,
      },
    },
  },
  {
    "rmagatti/goto-preview",
    lazy = false,
    config = function()
      require("goto-preview").setup { default_mappings = true }
    end,
  },
  --- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          theme = "ivy",
        },
        grep_string = {
          additional_args = { "--hidden" },
        },
        live_grep = {
          additional_args = { "--hidden" },
        },
      },

      extensions_list = { "themes", "terms", "ui-select", "fzf" },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_ivy {},
        },
        live_grep_args = {
          additional_args = { "--hidden" },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release; cmake --build build --config Release",
    lazy = false,
  },

  --- QoL coding
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require("symbols-outline").setup()
    end,
  },
  --- Haskell
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    lazy = false,
  },
  {
    "mrcjkb/haskell-snippets.nvim",
  },
  -- {
  --   "Vigemus/iron.nvim",
  --   lazy = false,
  --   version = "^3",
  --   opts = function()
  --     return require "configs.iron"
  --   end,
  --   config = function(_, opts)
  --     require("iron.core").setup(opts)
  --   end,
  -- },
}
