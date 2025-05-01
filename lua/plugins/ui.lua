return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { highlight = { backdrop = false } },
  },
  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        style = {
          { fg = "#9AA6DF" },
        },
        exclude_filetypes = {
          yaml = true,
        },
      },
      indent = {
        enable = true,
        chars = { "┊" },
        exclude_filetypes = {
          markdown = true,
        },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    enabled = false,
  },
}
