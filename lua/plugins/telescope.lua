return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      layout_strategy = "flex",
      layout_config = {
        flip_columns = 150,
        vertical = {
          preview_height = 0.6,
        },
      },
      file_ignore_patterns = {
        "node_modules",
        ".lock",
      },
    },
  },
}
