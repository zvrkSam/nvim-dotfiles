return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        -- there a bug with layout_strategy = "flex"
        -- flip_columns are affected by it
        -- layout_strategy = "flex",
        layout_strategy = "vertical",
        layout_config = {
          -- flip_columns = 150,
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
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        preview = {
          vertical = "up:65%",
        },
      },
      files = {
        fzf_opts = { ["--layout"] = "default" },
      },
    },
  },
}
