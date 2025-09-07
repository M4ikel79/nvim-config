return {
  {
    "stevearc/conform.nvim",
    event = "bufwritepre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- these are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VimEnter",
    config = function()
      -- Existing modules
      require("mini.cursorword").setup() -- highlights word under cursor
      require("mini.indentscope").setup { -- indent guides
        draw = { delay = 3, priority = 2 },
        symbol = "│",
        options = { try_as_border = true },
      }
      vim.api.nvim_set_hl(0, "miniindentscopesymbol", { fg = "#383a5f" })
      require("mini.surround").setup { -- surround text objects
        mappings = {
          add = "gsa",
          delete = "gsd",
          replace = "gsr",
          find = "gsf",
          find_left = "gsf",
          highlight = "gsh",
          update_n_lines = "gsn",
        },
      }

      -- Optional modules you can add:
      -- require("mini.animate").setup()        -- smooth animations
      -- require("mini.basics").setup()         -- essential editor settings
      -- require("mini.bufremove").setup()      -- buffer removal commands
      -- require("mini.bracketed").setup()      -- bracketed text objects navigation
      -- require("mini.clue").setup()           -- keybinding hints
      -- require("mini.comment").setup()        -- comment/uncomment lines
      -- require("mini.files").setup()          -- lightweight file explorer
      -- require("mini.jump").setup()           -- navigation helper
      require("mini.move").setup() -- move lines/blocks
      -- require("mini.pairs").setup()          -- auto pairs for brackets/quotes
      -- require("mini.sessions").setup()       -- session management
      -- require("mini.starter").setup()        -- startup/dashboard page
      -- require("mini.statusline").setup()     -- lightweight statusline
      -- require("mini.tabline").setup()        -- tabline generator
      -- require("mini.trailspace").setup()     -- highlight/remove trailing whitespace
      require("mini.align").setup() -- text alignment utilities
      -- require("mini.ai").setup()             -- extra text objects
      -- require("mini.splitjoin").setup()      -- split/join code structures
    end,
  },

  {
    "folke/flash.nvim",
    event = "VimEnter",
    opts = {},
  },

  {
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      local notify = require "notify"

      notify.setup {
        stages = "fade_in_slide_out",
        timeout = 5000,
        background_colour = "#1e222a",
        minimum_width = 30,
        icons = {
          error = "",
          warn = "",
          info = "",
          debug = "",
          trace = "✎",
        },
        render = "compact",
        top_down = true,
        merge_duplicates = true,
      }
      vim.notify = notify
    end,
  },

  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle", -- lazy load on command
    opts = {
      win_opts = { -- floating window look
        width = 50,
        height = 5,
        border = "rounded",
        -- position options
        row = 1, -- distance from top
        col = vim.o.columns, -- push to right edge
        anchor = "se", -- "nw", "ne", "sw", "se" (corners)
      },
      show_count = true, -- show key press counts
      timeout = 3, -- how long keys stay visible
      -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
      position = "top-center",
    },
  },

  -- extra lsp helpers: lua dev + treesitter context
  {
    -- better lua dev (completion + docs for neovim/lua)
    "folke/lazydev.nvim",
    ft = "lua", -- only load for lua files
    opts = {
      library = {
        -- neovim runtime + plugins with lua typings
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
      --- whether to load types for plugins (requires luasnip/blink for full effect)
      plugin = true,
    },
  },

  {
    -- sticky context (shows function/class header at top when scrolling)
    "nvim-treesitter/nvim-treesitter-context",
    event = "bufreadpost",
    opts = {
      enable = true, -- disable to turn it off
      max_lines = 3, -- how many lines of context
      min_window_height = 20, -- don’t show if window too small
      multiline_threshold = 5, -- collapse big nodes into one line
      trim_scope = "outer", -- "inner" | "outer"
      mode = "cursor", -- or "topline"
      zindex = 20, -- floating layer
    },
  },

  {
    "l3mon4d3/luasnip",
    version = "v2.*", -- keep on stable v2
    build = "make install_jsregexp", -- needed for regex snippet support
    event = "insertenter", -- load only when editing
    dependencies = { "rafamadriz/friendly-snippets" }, -- prebuilt snippets
    config = function()
      local luasnip = require "luasnip"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
      "muniftanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false, -- Disable LSP progress messages
        },
        hover = { enabled = true },
        signature = { enabled = true },
        message = { enabled = true },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      search = {
        enabled = true,
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
    },
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
}
