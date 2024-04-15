return {
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "sindrets/diffview.nvim", -- optional - Diff integration
  --
  --     -- Only one of these is needed, not both.
  --     -- "nvim-telescope/telescope.nvim", -- optional
  --     -- "ibhagwan/fzf-lua", -- optional
  --   },
  --   config = true,
  -- },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    -- svenn's gitsigns options
    -- https://github.com/zveinn/nvim-config/blob/master/lua/plugins/gitsigns.lua
    opts = {
      signs = {
        add = { text = "A" },
        change = { text = "M" },
        delete = { text = "D" },
        topdelete = { text = "TD" },
        changedelete = { text = "CD" },
        untracked = { text = "U" },
      },
      numhl = true,
      -- linehl = true,
    },
  },
}
