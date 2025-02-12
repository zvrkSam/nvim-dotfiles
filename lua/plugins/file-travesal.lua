return {

  -- Oil
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
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
        max_width = 235,
        max_height = 65,
      },
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<c-c>"] = false,
        ["q"] = "actions.close",
      },
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

  -- arrow is like primeagens harpoon but with lualine support out of the box
  -- TODO: Add timeout option for popup menu | like which-key
  {
    "otavioschwanck/arrow.nvim",
    lazy = true,
    opts = {
      show_icons = true,
      leader_key = "\\",
      always_show_path = true,
      separate_by_branch = true,
    },
  },

  -- undo-tree
  {
    "mbbill/undotree",
    lazy = false,
  },

  -- scrollEOF
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },
}
