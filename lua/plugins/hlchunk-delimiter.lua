return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        style = {
          { fg = "#7aa2f7" },
        },
      },
      indent = {
        enable = true,
        chars = { "┊" },
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    -- enabled = false,
  },
}
