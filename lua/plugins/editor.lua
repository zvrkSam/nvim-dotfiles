return {

  -- lualine

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
      -- theme = "tokyonight",
      theme = "catppuccin",
    },
  },

  -- devicons

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      strict = true,
      override_by_extension = {
        ["astro"] = {
          icon = "",
          color = "#EF8547",
          name = "Astro",
        },
        ["go"] = {
          icon = "󰊭",
          color = "#00ADD8",
          name = "Go",
          size = 24,
        },
      },
    },
  },

  -- {
  --   "echasnovski/mini.nvim",
  --   version = "*",
  --   opts = {
  --     windows = {
  --       width_preview = 50,
  --     },
  --   },
  -- },

  -- Oil

  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      float = {
        padding = 4,
      },
      preview = {},
    },
  },

  -- neo-tree

  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    enabled = false,
    opts = {
      window = {
        -- "right" | "left" | "float" | "current"
        position = "float",
        -- width = 30,
        mappings = {
          ["w"] = "close_all_nodes",
          ["W"] = "expand_all_nodes",
        },
      },
      -- hijack_netrw_behavior = "open_default",
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = false,
          hide_dotfiles = false,
          hide_gitignore = false,
          hide_by_name = {
            "node_modules",
            ".git",
          },
          -- never_show = {
          --   "node_modules",
          --   ".git",
          -- },
          -- always_show = {
          --   ".gitignore",
          -- },
        },
      },
    },
  },

  -- zen mode

  { "folke/zen-mode.nvim" },
  { "folke/twilight.nvim" },

  -- scrollEOF

  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },

  -- mini.pairs
  -- If you wish to have auto pairs then enable the plugin or remove the code block

  -- {
  --   "echasnovski/mini.pairs",
  --   enabled = true,
  -- },

  -- whichkey

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      window = {
        border = "single",
      },
    },
  },
}
