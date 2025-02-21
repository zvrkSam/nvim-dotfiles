return {
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
  {
    -- TODO: Add timeout option for popup menu | like which-key
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    lazy = true,
    opts = {
      show_icons = true,
      leader_key = "\\",
      always_show_path = true,
      separate_by_branch = true,
    },
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },
}
