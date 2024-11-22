return {
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    -- svenn's gitsigns options
    -- https://github.com/zveinn/nvim-config/blob/master/lua/plugins/gitsigns.lua
    opts = {
      -- signs = {
      --   add = { text = "A" },
      --   change = { text = "M" },
      --   delete = { text = "D" },
      --   topdelete = { text = "TD" },
      --   changedelete = { text = "CD" },
      --   untracked = { text = "U" },
      -- },
      numhl = true,
      -- linehl = true,
    },
  },
  {
    "NeogitOrg/neogit",
    event = "VeryLazy",
    dependencies = { "sindrets/diffview.nvim" },
    opts = {},
  },
}
