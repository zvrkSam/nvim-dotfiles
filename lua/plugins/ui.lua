return {
  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { highlight = { backdrop = false } },
  },
  -- { "folke/zen-mode.nvim" },
  -- { "folke/twilight.nvim" },
}
