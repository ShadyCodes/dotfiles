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

  --- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      -- setup treesitter with config
    end,
    dependencies = {
      -- NOTE: additional parser
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },

  --- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  --- terminal
  { "voldikss/vim-floaterm", lazy = false },

  -- --- themes
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   keys = { { "<leader>C", "<cmd>MonokaiProSelect<cr>", desc = "Select Monokai pro filter" } },
  --   opts = {
  --     transparent_background = false,
  --     devicons = true,
  --     filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  --     day_night = {
  --       enable = true,
  --       day_filter = "pro",
  --       night_filter = "spectrum",
  --     },
  --     inc_search = "background", -- underline | background
  --     background_clear = {
  --       "nvim-tree",
  --       -- "neo-tree",
  --       "bufferline",
  --       "telescope",
  --       "toggleterm",
  --     },
  --     plugins = {
  --       bufferline = {
  --         underline_selected = true,
  --         underline_visible = false,
  --         underline_fill = true,
  --         bold = false,
  --       },
  --       indent_blankline = {
  --         context_highlight = "pro", -- default | pro
  --         context_start_underline = true,
  --       },
  --     },
  --     override = function(c)
  --       return {
  --         -- ColorColumn = { bg = c.editor.background },
  --         -- Mine
  --         DashboardRecent = { fg = c.base.magenta },
  --         DashboardProject = { fg = c.base.blue },
  --         DashboardConfiguration = { fg = c.base.white },
  --         DashboardSession = { fg = c.base.green },
  --         DashboardLazy = { fg = c.base.cyan },
  --         DashboardServer = { fg = c.base.yellow },
  --         DashboardQuit = { fg = c.base.red },
  --         IndentBlanklineChar = { fg = c.base.dimmed4 },
  --         NeoTreeStatusLine = { link = "StatusLine" },
  --         -- mini.hipatterns
  --         MiniHipatternsFixme = { fg = c.base.black, bg = c.base.red, bold = true }, -- FIXME
  --         MiniHipatternsTodo = { fg = c.base.black, bg = c.base.blue, bold = true }, -- TODO
  --         MiniHipatternsHack = { fg = c.base.black, bg = c.base.yellow, bold = true }, -- HACK
  --         MiniHipatternsNote = { fg = c.base.black, bg = c.base.green, bold = true }, -- NOTE
  --         MiniHipatternsWip = { fg = c.base.black, bg = c.base.cyan, bold = true }, -- WIP
  --       }
  --     end,
  --     overridePalette = function(filter)
  --       -- if filter == "pro" then
  --       --   return {
  --       --     dark2 = "#101014",
  --       --     dark1 = "#16161E",
  --       --     background = "#1A1B26",
  --       --     text = "#C0CAF5",
  --       --     accent1 = "#f7768e",
  --       --     accent2 = "#7aa2f7",
  --       --     accent3 = "#e0af68",
  --       --     accent4 = "#9ece6a",
  --       --     accent5 = "#0DB9D7",
  --       --     accent6 = "#9d7cd8",
  --       --     dimmed1 = "#737aa2",
  --       --     dimmed2 = "#787c99",
  --       --     dimmed3 = "#363b54",
  --       --     dimmed4 = "#363b54",
  --       --     dimmed5 = "#16161e",
  --       --   }
  --       -- end
  --     end,
  --   },
  --   config = function(_, opts)
  --     local monokai = require "monokai-pro"
  --     monokai.setup(opts)
  --     monokai.load()
  --   end,
  -- },
}
