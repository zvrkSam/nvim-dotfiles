return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    opts = {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
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
  -- {
  --   "ibhagwan/fzf-lua",
  --   opts = {
  --     winopts = {
  --       preview = {
  --         vertical = "up:65%",
  --       },
  --     },
  --     -- files = {
  --     --   fzf_opts = { ["--layout"] = "default" },
  --     -- },
  --   },
  -- },
}
