return {
  -- devicons

  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      strict = true,
      override_by_extension = {
        -- ["astro"] = {
        --   icon = "",
        --   color = "#EF8547",
        --   name = "Astro",
        -- },
        ["go"] = {
          icon = "󰊭",
          color = "#00ADD8",
          name = "Go",
          size = 24,
        },
      },
    },
  },

  -- Oil

  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          return name == "node_modules" or name == ".git"
        end,
      },
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

  -- mini.pairs | If you wish to have auto pairs then enable the plugin or remove the code block

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
